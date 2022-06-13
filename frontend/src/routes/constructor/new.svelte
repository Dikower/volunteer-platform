<script lang="ts">
  import { faArrowUp, faSun, faMoon, faChartLine } from "@fortawesome/free-solid-svg-icons";
  import { graphData } from "./data";
  import Fa from "svelte-fa";

  let showChange = true;
  let componentTheme: "dark" | "light" = "dark";
  let themeIcon = faMoon;
  let widgetType = 1;

  let colorsForGraph = ["bg-red-400", "bg-blue-400", "bg-yellow-400", "bg-green-400"];

  function changeTheme() {
    if (componentTheme === "dark") {
      componentTheme = "light";
      themeIcon = faSun;

    } else {
      componentTheme = "dark";
      themeIcon = faMoon;
    }
  }
</script>


<div class="w-full h-full flex flex-col items-center">
  <h1 class="my-5 text-5xl text-center font-black">Конструктор компонента</h1>
  <div class="mt-10 w-5/6 h-96 shadow-inner rounded-xl box-border mt-5">
    <h1 class="mt-5 text-2xl font-bold text-accent text-center">Итоговый компонент</h1>
    <div class="grid place-items-center w-full h-full">
      <div class="shadow-lg p-6 border-accent border-solid w-fit h-fit rounded-xl" data-theme={componentTheme}>
        {#if widgetType === 0}
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
        {:else if widgetType === 1}
          <h2 class="font-semibold text-xl text-accent w-48 my-2">Процент лояльных волонтеров</h2>
          <div class="flex items-center">
            <h1 class="font-black text-5xl text-accent-content w-48">50.7%</h1><span class="text-primary text-4xl"><Fa
            icon={faChartLine} /></span>
          </div>
        {:else if widgetType === 2}
          <div class="p-2 text-center border-2 border-gray-300 rounded-md h-40 flex justify-between">
            {#each graphData.graph as element, num}
              {#if element.count !== 0}
                <div class="flex flex-col text-xs w-6">
                  <p class="mt-auto font-bold">{element.count}</p>
                  <div class={"rounded-t " + colorsForGraph[num%4]}
                       style={"height: " + (Math.floor((element.count / element.max) * 100)*0.66) + "%"}></div>
                  <p class="text-gray-400">{element.month}</p>
                </div>
              {/if}
            {/each}
          </div>
        {/if}
      </div>
    </div>
  </div>

  <div class="flex flex-col justify-center items-center">
    <span class="">Тип виджета</span>
    <div class="flex items-center gap-4 my-2">
      <label class="flex items-center gap-2">
        <span class="label-text">Тип 1</span>
        <input type="radio" name="radio-1" class="radio" bind:group={widgetType} value={0} />
      </label>
      <label class="flex items-center gap-2">
        <span class="label-text">Тип 2</span>
        <input type="radio" name="radio-1" class="radio" bind:group={widgetType} value={1} />
      </label>
      <label class="flex items-center gap-2">
        <span class="label-text">Тип 3</span>
        <input type="radio" name="radio-1" class="radio" bind:group={widgetType} value={2} />
      </label>
    </div>
    {#if widgetType === 0}
      <label class="cursor-pointer label w-50">
        <input bind:checked={showChange} type="checkbox" class="checkbox" />
        <span class="label-text mx-2">Отображать изменение</span>
      </label>
    {/if}
    <label class="cursor-pointer label w-48 justify-start">
      <button class="text-2xl" on:click={changeTheme}>
        <Fa icon={themeIcon} />
      </button>
      <span class="label-text mx-2">Тема компонента</span>
    </label>
  </div>
</div>
