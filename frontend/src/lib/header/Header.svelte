<script lang="ts">
  import { page } from '$app/stores';
  import { faSun, faMoon } from "@fortawesome/free-solid-svg-icons";
  import { createEventDispatcher, onMount } from "svelte";
  import Fa from "svelte-fa";

  const dispatch = createEventDispatcher();
  
  let theme: any = "light";

  let companyPathList = [
    {href: "/company", name: "company"},
  ]
  let userPathList = [
    {href: "/user", name: "user"},
    {href: "/user/achievements", name: "achievements"},
  ]
  
  onMount(() => {
    theme = localStorage.getItem("theme");
  })
  
  function changeTheme(color: "night" | "light"){
    theme = color; 
    localStorage.setItem("theme", color); 
    dispatch("themeChange", color);
  }
</script>

<header class="flex justify-between p-4" data-theme={theme}>
	
  <a sveltekit:prefetch href={"/"} class={$page.url.pathname === "/" ? "mx-2 font-bold py-2" : "mx-2 py-2"}>main</a>

  <!-- разделить после авторизации -->
  <div class="flex flex-col">
    <div class="text-sm flex">
      {#each companyPathList as path}
        <a sveltekit:prefetch href={path.href} class={$page.url.pathname === path.href ? "mx-2 font-bold my-auto" : "mx-2 my-auto"}>{path.name}</a>
      {/each}
    </div>
    <div class="text-sm flex">
      {#each userPathList as path}
        <a sveltekit:prefetch href={path.href} class={$page.url.pathname === path.href ? "mx-2 font-bold my-auto" : "mx-2 my-auto"}>{path.name}</a>
      {/each}
    </div>
  </div>

  {#if theme === 'light'}
    <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("night")}}>
      <Fa icon={faSun} size="lg" />
    </button>
  {:else}
    <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("light")}} >
      <Fa icon={faMoon} size="lg" />
    </button>
  {/if}
</header>




