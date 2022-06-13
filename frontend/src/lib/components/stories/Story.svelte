<script>
  import { fade } from "svelte/transition";
  import Fa from "svelte-fa";
  import { faXmark } from "@fortawesome/free-solid-svg-icons";
  import { createEventDispatcher } from "svelte";

  export let title = "Посетили вершину вулкана";
  export let watched = false;
  export let opened = false;
  export let author = {
    name: "Кувшинов Марк",
    img: "https://sun4-11.userapi.com/s/v1/ig2/0wydB4v0K9WTkRyxIL-jvzkYS_8WwssbFZLaMZPpIEWmjhQai2p_oqYiOxkF84Npl-Wqm8Iq3M6Ya7lxaTkyrepT.jpg?size=1066x1600&quality=96&type=album"
  };
  export let when = "5 hours ago";
  export let screens = [
    "https://proprikol.ru/wp-content/uploads/2020/04/kartinki-vulkany-27.jpg",
    "https://catherineasquithgallery.com/uploads/posts/2021-02/1613449395_3-p-fon-dlya-prezentatsii-pro-vulkani-4.jpg",
    "https://proprikol.ru/wp-content/uploads/2020/04/kartinki-vulkany-39.jpg"
  ];
  export let nav = 0;
  export let duration = 400;
  let ticker;
  let tickVal = 0;
  const dispatch = createEventDispatcher();

  export function open() {
    opened = true;
    watched = true;
    dispatch("open");
    ticker = setInterval(() => {
      tickVal++;
      if (tickVal > duration) {
        if (nav === screens.length - 1) {
          reset();
          close();
        } else {
          tickVal = 0;
          nav++;
        }
      }
    }, 1);
  }

  function reset() {
    nav = 0;
    tickVal = 0;
  }

  function close() {
    opened = false;
    reset();
    clearInterval(ticker);
  }

  function storyClick(e) {
    // let x = e.pageX - storyCard.offsetLeft;
    // let y = e.pageY - storyCard.offsetTop;
    let rect = storyCard.getBoundingClientRect();

    let x = e.x - rect.left;
    let half = (rect.right - rect.left) / 2;
    if (x < half && nav > 0) {
      nav--;
      tickVal = 0;
    } else if (x < half && nav === 0) {
      dispatch("prev");
    } else if (x > half && nav + 1 < screens.length) {
      nav++;
      tickVal = 0;
    } else if (x > half && nav + 1 === screens.length) {
      dispatch("next");
    }
  }

  let cover;
  let storyCard;
</script>

<div class="relative border-accent mr-4 grid place-items-center cursor-pointer max-w-1xl" on:click={open}>
  <img
    alt="story" class:border-accent={!watched}
    class="border-solid border-2 rounded-xl object-fill w-full h-full rounded-xl" src={screens[0]}>
  <h2 class="absolute w-[100px] text-slate-100 font-bold text-md">{title}</h2>
</div>

{#if opened}
  <div
    bind:this={cover}
    transition:fade={{duration: 100}}
    class="z-10 fixed w-screen h-screen top-0 left-0 grid place-items-center cover-bg"
    on:click={(e) => {if (e.target === cover) close()}}
  >
    <div
      bind:this={storyCard}
      class="
        relative
        w-full h-full
        artboard sm:phone-2
        rounded-xl bg-black
      "
      on:click={storyClick}
    >
      <div class="absolute w-full z-10">
        <div class="flex justify-center mt-3 w-full">
          {#each Array(screens.length) as _, i}
            {#if i < nav}
              <progress class="progress w-auto h-1 bg-slate-400 mx-1" value={duration} max={duration}></progress>
            {:else if i === nav}
              <progress class="progress w-auto h-1 bg-slate-400 mx-1" value={tickVal} max={duration}></progress>
            {:else}
              <progress class="progress w-auto h-1 bg-slate-400 mx-1" value="0" max={duration}></progress>
            {/if}
          {/each}
        </div>
        <div class="flex justify-between content-start w-full">
          <div class="flex mt-2 items-center">
            <div class="avatar mx-2">
              <div class="w-10 rounded-full">
                <img alt="avatar" class="w-10 h-10 object-scale-down rounded-xl" src={author.img}>
              </div>
            </div>
            <div class="flex flex-col mb-2">
              <h2 class="text-white">{author.name}</h2>
              <h3 class="text-slate-300 text-2xs">{when}</h3>
            </div>
          </div>
          <button class="text-white mx-10 sm:mx-5 text-lg" on:click={close}>
            <Fa icon={faXmark} />
          </button>
        </div>
      </div>
      <img class="object-contain w-full h-full" src={screens[nav]}>
    </div>
  </div>
{/if}

<style>
  .cover-bg {
    background: rgba(0, 0, 0, 0.7);
    backdrop-filter: blur(5px);
  }
</style>