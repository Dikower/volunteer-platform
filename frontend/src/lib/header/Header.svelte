<script lang="ts">
  import { page } from '$app/stores';
  import { faSun, faMoon } from "@fortawesome/free-solid-svg-icons";
  import { createEventDispatcher, onMount } from "svelte";
  import Fa from "svelte-fa";

  const dispatch = createEventDispatcher();
  
  let theme: any = "light";

  let companyPathList = [
    {href: "/vacancies/list", name: "vacancies list"},
    {href: "/company", name: "company"}
  ];
  let userPathList = [
    {href: "/vacancies/list", name: "vacancies list"},
    {href: "/user", name: "user"},
    {href: "/user/achievements", name: "achievements"}
  ];
  let authPathList = [
    {href: "/auth/signin", name: "signin"},
    {href: "/auth/signup", name: "signup"}
  ]

  let authorizationState = true;
  
  onMount(() => {
    theme = localStorage.getItem("theme");
  })
  
  function changeTheme(color: "night" | "light"){
    theme = color; 
    localStorage.setItem("theme", color); 
    dispatch("themeChange", color);
  }
</script>

<header class="flex justify-between p-4 shadow mb-1 w-screen" data-theme={theme}>
	
  <a sveltekit:prefetch href={"/"} class={$page.url.pathname === "/" ? "mx-2 font-bold py-2" : "mx-2 py-2"}>main</a>

  <!-- разделить после авторизации -->

  <div class="flex flex-col">
    {#if authorizationState}
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
    {:else}
      <div class="text-sm flex">
        {#each authPathList as path}
          <a sveltekit:prefetch href={path.href} class={$page.url.pathname === path.href ? "mx-2 font-bold my-auto" : "mx-2 my-auto"}>{path.name}</a>
        {/each}
      </div>
    {/if}
  </div>



  <div>
    {#if authorizationState}
      <button on:click={() => {authorizationState = false}}>logOut</button>
    {:else}
      <button on:click={() => {authorizationState = true}}>SignIn</button>
    {/if}

    {#if theme === 'light'}
      <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("night")}}>
        <Fa icon={faSun} size="lg" />
      </button>
    {:else}
      <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("light")}} >
        <Fa icon={faMoon} size="lg" />
      </button>
    {/if}
  </div>
 
</header>




