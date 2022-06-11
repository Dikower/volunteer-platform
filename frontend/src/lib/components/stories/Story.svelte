<script>
  import { fade } from "svelte/transition";

  export let title = "Посетили вершину вулкана";
  export let opened = true;
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
  export let duration = 200;
  let ticker;
  let tickVal = 0;


  function open() {
    opened = true;
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
    let half = (rect.right - rect.left) / 2
    if ( x < half && nav > 0) {
      nav--;
      tickVal = 0;
    } else if (x > half && nav + 1 < screens.length) {
      nav++;
      tickVal = 0;
    }
  }

  let cover;
  let storyCard;
</script>

<div class="w-[100px] h-[100px] border-accent m-4 grid place-items-center cursor-pointer" on:click={open}>
  <img alt="story" class="object-fill w-full h-full rounded-xl" src={screens[0]}>
  <h2 class="absolute w-[80px] text-slate-100 font-bold">{title}</h2>
</div>

{#if opened}
  <div
    bind:this={cover}
    transition:fade={{duration: 100}}
    class="fixed w-screen h-screen top-0 left-0 grid place-items-center cover-bg"
    on:click={(e) => {if (e.target === cover) close()}}
  >
    <div
      bind:this={storyCard}
      class="
        relative
        w-full h-full
        artboard sm:phone-2
        rounded-xl bg-gray-900
      "
      on:click={storyClick}
    >
      <div class="absolute w-full">

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