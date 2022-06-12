<script>
  import lottie from "lottie-web";
  import { onMount } from "svelte";

  export let name = '';
  export let description = '';
  export let img = '';
  export let progress = "";
  export let total = "";
  // let player;

  // onMount(() => {
  //   lottie.loadAnimation({
  //     container: player, // the dom element that will contain the animation
  //     renderer: "svg",
  //     loop: true,
  //     autoplay: true,
  //     path: pic // the path to the animation json
  //   });
  // });
</script>


<div class="p-2 text-center border-2 border-gray-300 rounded-md mr-2 mb-2 flex">

  <img src={img} alt="" class="w-16 h-16 my-auto">
  <div class="ml-2 w-3/5">
    <h2 class="font-bold text-left">{name}</h2>
    <h3 class="text-2xs text-left">{description}</h3>
    <div class="flex items-center justify-between">
      <progress class="progress progress-secondary w-4/6" value={progress} max={total}></progress>
      <span class="text-info-content text-2xs">{progress} / {total} </span>
    </div>
  </div>
</div>

<!-- <div class="p-2 my-2 flex border border-info-content rounded-lg">
  <div bind:this={player} class="w-2/5"></div>
  <div class="ml-2 w-3/5">
    <h2 class="font-bold text-accent-content">{name}</h2>
    <h3 class="text-info-content text-2xs">{description}</h3>
    <div class="flex items-center justify-between">
      <progress class="progress progress-secondary w-4/6" value={progress} max={total}></progress>
      <span class="text-info-content text-2xs">{progress} / {total} </span>
    </div>
  </div>
</div> -->