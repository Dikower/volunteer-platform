<script>
  export let opened = false;
  export let screens = [];
</script>

<div class="" on:click={ () => opened = true }>

</div>
{#if opened}
  <div class="absolute w-screen h-screen ">

  </div>
{/if}

<style>

</style>