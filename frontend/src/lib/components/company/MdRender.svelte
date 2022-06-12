<script>
  import SvelteMarkdown from "svelte-markdown";

  export let source;
</script>


<div class="md-wrap">
  <SvelteMarkdown {source} />
</div>

<style>
  .md-wrap :global(h1) {
    @apply font-bold text-xl my-2;
  }

  .md-wrap :global(h2) {
    @apply font-semibold text-lg my-2;
  }

  .md-wrap :global(img) {
    @apply my-5;
  }

  .md-wrap :global(p) {
    @apply text-justify;
  }

</style>
