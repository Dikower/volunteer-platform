<script lang="ts">
  import { faArrowUp, faSun, faMoon } from "@fortawesome/free-solid-svg-icons";

  import Fa from "svelte-fa";

  let showChange = true;
  let componentTheme: 'dark' | 'light' = 'dark';
  let themeIcon = faMoon;

  function changeTheme() {
    if (componentTheme === 'dark') {
      componentTheme = 'light';
      themeIcon = faSun;

    } else {
      componentTheme = 'dark';
      themeIcon = faMoon;

    }
  }
</script>


<div class="w-full h-full flex flex-col items-center">
  <h1 class="my-5 text-5xl text-center font-black">Конструктор компонента</h1>
  <div class="mt-10 w-5/6 h-96 shadow-inner rounded-xl box-border mt-5">
    <h1 class="mt-5 text-2xl font-bold text-accent text-center">Итоговый компонент</h1>
    <div class="grid place-items-center w-full h-full">
      <div class="shadow-lg p-6 border-accent border-solid w-fit h-fit rounded-xl" data-theme={componentTheme} >
        <h1 class="font-black text-5xl text-accent-content">12.924</h1>
        <h2 class="font-light text-md text-primary">Сотрудников-волонтеров</h2>
        {#if showChange}
          <div class="flex mt-2">
          <span class="text-success flex items-center">
            <Fa class="rotate-45" icon={faArrowUp} />
            <span class="mx-2">3.46%</span>
          </span>
            <span class="text-base-content ">с прошлого месяца</span>
          </div>
        {/if}
      </div>
    </div>
  </div>

  <div class="flex flex-col justify-center items-center">
    <label class="cursor-pointer label w-50">
      <input bind:checked={showChange} type="checkbox" class="checkbox" />
      <span class="label-text mx-2">Отображать изменение</span>
    </label>
    <label class="cursor-pointer label w-48 justify-start">
      <button class="text-2xl" on:click={changeTheme}><Fa icon={themeIcon}/></button>
      <span class="label-text mx-2">Тема компонента</span>
    </label>
  </div>
</div>
