<script lang="ts">
  import "../app.css";
  import { faSun, faMoon } from "@fortawesome/free-solid-svg-icons";
  import Fa from "svelte-fa";

  let theme: "light" | "night" = "light";
</script>


<nav>
  {#if theme === 'light'}
    <button
      class="btn btn-ghost btn-circle"
      on:click={() => theme = 'night'}
    >
      <Fa icon={faSun} size="lg" />
    </button>
  {:else}
    <button
      class="btn btn-ghost btn-circle"
      on:click={() => theme = 'light'}
    >
      <Fa icon={faMoon} size="lg" />
    </button>
  {/if}
</nav>

<div data-theme={theme}>
  <slot />
</div>