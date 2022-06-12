<script lang="ts">
  import { page } from '$app/stores';
  import { faSun, faMoon } from "@fortawesome/free-solid-svg-icons";
  import { createEventDispatcher, onMount } from "svelte";
  import Fa from "svelte-fa";

  const dispatch = createEventDispatcher();
  
  let theme: any = "light";

  let companyPathList = [
    {href: "/vacancies/list", name: "Мероприятия"},
    {href: "/vacancies/create", name: "Создание мероприятия"},
    {href: "/company", name: "Профиль"},
    {href: "/constructor/new", name: "Конструктор"}
  ];
  let userPathList = [
    {href: "/vacancies/list", name: "Мероприятия"},
    {href: "/user", name: "Профиль"},
    {href: "/user/achievements", name: "Достижения"}
  ];
  let authPathList = [
    {href: "/auth/signin", name: "signin"},
    {href: "/auth/signup", name: "signup"}
  ]

  let authorizationState = true;
  
  onMount(() => {
    theme = localStorage.getItem("theme");
  })
  
  function changeTheme(color: "dark" | "light"){
    theme = color; 
    localStorage.setItem("theme", color); 
    dispatch("themeChange", color);
  }
</script>

<header class="flex justify-between p-4 shadow mb-1" data-theme={theme}>
	
    
  <a id="main" href={"/"} class="flex">
    <img src={"/logo.svg"} alt="">
    <p class="my-auto text-emerald-400 ml-2 ">Благодел</p>
  </a>

  
  
  <!-- разделить после авторизации -->

  <div class="flex flex-col">
    {#if authorizationState}
      <!-- <div class="text-sm flex my-auto">
        {#each companyPathList as path}
          <a sveltekit:prefetch href={path.href} class={$page.url.pathname === path.href ? "mx-2 font-bold my-auto" : "mx-2 my-auto"}>{path.name}</a>
        {/each}
      </div> -->
      <div class="text-sm flex my-auto">
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

  <div class="flex">
    {#if authorizationState}
      <button on:click={() => {authorizationState = false}} class="my-auto">Выход</button>
    {:else}
      <button on:click={() => {authorizationState = true}}>SignIn</button>
    {/if}

    {#if theme === 'light'}
      <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("dark")}}>
        <Fa icon={faSun} size="lg" />
      </button>
    {:else}
      <button class="btn btn-ghost btn-circle" on:click={() => {changeTheme("light")}} >
        <Fa icon={faMoon} size="lg" />
      </button>
    {/if}
  </div>
 
</header>




