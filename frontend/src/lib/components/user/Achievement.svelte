<script>
  import lottie from "lottie-web";
  import { onMount } from "svelte";

  export let name = 'Мастер';
  export let reason = '12 активных месяцев без перерыва' ;
  export let pic = '/animations/work_team.json';
  // export let active = true;
  export let progress = 10;
  export let total = 12;
  let player;

  onMount(() => {
    lottie.loadAnimation({
      container: player, // the dom element that will contain the animation
      renderer: "svg",
      loop: true,
      autoplay: true,
      path: pic // the path to the animation json
    });
  });
</script>


<div class="p-2 my-2 flex border border-info-content rounded-lg">
  <div bind:this={player} class="w-2/5"></div>
  <div class="ml-2 w-3/5">
    <h2 class="font-bold text-accent-content">{name}</h2>
    <h3 class="text-info-content text-2xs">{reason}</h3>
    <div class="flex items-center justify-between">
      <progress class="progress progress-secondary w-4/6" value={progress} max={total}></progress>
      <span class="text-info-content text-2xs">{progress} / {total} </span>
    </div>
  </div>
</div>