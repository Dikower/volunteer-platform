<script lang="ts">
  import Story from "./Story.svelte";
  import {stories} from './data';
  export let current = 0;
  let opened = false;

  function prev() {
    if (current > 0) {
      current--;
    } else {
      opened = false;
    }
  }

  function next() {
    if (current + 1 < stories.length) {
      current++;
    } else {
      opened = false;
    }
  }
</script>

<div class="flex overflow-y-auto">
  {#each stories as story, i}
    <Story
      {...story}
      on:prev={prev}
      on:next={next}
      on:open={() => opened = true}
    />
  {/each}
</div>