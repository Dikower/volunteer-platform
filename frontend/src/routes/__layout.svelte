<script lang="ts">
  import "../app.css";
  import Header from "$lib/header/Header.svelte"; 
  import { onMount } from "svelte";

  let theme: any = "light";
  onMount(() => {
    theme = localStorage.getItem("theme");
  })
</script>

<Header on:themeChange = {(newTheme) => theme = newTheme.detail}/>

<div data-theme={theme}>
  <slot />
</div>