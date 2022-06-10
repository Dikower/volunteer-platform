<script>
  import lottie from 'lottie-web';
  import { onMount } from 'svelte';

  export let name, reason, pic, active;
  let player;
  let hover = false;

  onMount(() => {
    lottie.loadAnimation({
      container: player, // the dom element that will contain the animation
      renderer: 'svg',
      loop: true,
      autoplay: true,
      path: pic // the path to the animation json
    });
  });
</script>

<div
  class='shadow rounded-xl m-4 flex p-4 w-5/12 m-auto z-0'
  on:mouseenter={() => hover = true}
  on:mouseleave={() => hover = false}
>
  <div class='relative m-auto w-sm'>
    <div bind:this={player} class='z-0'></div>
    <h2 class='text-center text-2xl m-3'>{name}</h2>
    {#if hover}
      <div class='absolute left-0 right-0 top-0 bottom-0 m-auto flex items-center content-center justify-center'>
        <p class='h-10 mb-10 bg-blue-200 text-center color text-gray-600 '>{reason}</p>
      </div>
    {/if}
  </div>
</div>