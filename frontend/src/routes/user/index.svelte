<script>
  import Fa from "svelte-fa";
  import { faUserPlus, faPen } from "@fortawesome/free-solid-svg-icons";
  import Achievement from "$lib/components/user/Achievement.svelte";
  import {data} from './data';

  let colorsForGraph = ["bg-red-400", "bg-blue-400", "bg-yellow-400", "bg-green-400"];
</script>


<div class="hidden sm:flex w-full max-w-2xl mx-auto pt-12">
  <div class="w-9/12">
    <div class="flex justify-between">
      <img src={data.img} alt="" class="w-40 h-40 rounded-full">
      <div class="my-auto">
        <p class="whitespace-nowrap text-lg font-bold">{data.first_name} {data.last_name}</p>
        <p class="text-gray-500 text-sm my-2">Регистрация: {data.date_registration}</p>
        <p class="text-red-500 text-xs">{data.friends} друзей {data.subscriptions} подписок</p>
      </div>
      <button class="bg-red-400 hover:bg-red-300 w-8 h-8 rounded-full my-auto">
        <Fa icon={faPen} class="m-auto" />
      </button>
    </div>

    <div class="mt-12">
      <h2 class="mt-4 mb-2 font-bold">Статистика</h2>
      <div class="grid grid-cols-2 gap-2">
        <div class="p-2 text-center border-2 border-gray-300 rounded-md mr-2">
          <h2 class="font-bold text-accent-content text-2xl">500</h2>
          <h4 class="text-gray-400 text-s">выполненных заданий</h4>
        </div>
        <div class="p-2 text-center border-2 border-gray-300 rounded-md">
          <h2 class="font-bold text-accent-content text-2xl">10</h2>
          <h4 class="text-gray-400 text-sm">активных месяцев</h4>
        </div>
      </div>
    </div>

    <div class="p-2 text-center border-2 border-gray-300 rounded-md mt-4 h-40 flex justify-between">
      {#each data.graph as element, num}
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

    <div class="mt-4">
      <h2 class="mt-4 mb-2 font-bold">Достижения</h2>
      <div class="flex flex-col items-center">
        {#each data.achievements as achievement}
          <Achievement {...achievement} />
        {/each}
      </div>
    </div>

  </div>

  <div class="bg-ysellow-100 w-3/12 mt-8">
    <p class="font-bold m-2">Интересы</p>
    <div class="grid grid-cols-2">
      {#each data.interests as interes}
        <p
          class="text-xs p-0.5 text-gray-400 mx-2 my-1 text-center border-2 border-gray-300 uppercase rounded-md">{interes}</p>
      {/each}
    </div>

  </div>
</div>


<div class="w-full sm:hidden mt-5 m-auto overflow-y-auto p-4 border-2 rounded-xl">
  <div class="flex justify-between items-center">
    <div>
      <h1 class="mt-5 font-bold text-xl text-accent-content">Анастасия Гисина</h1>
      <p class="text-info-content text-sm">Регистрация: Июнь 2022</p>
      <div class="flex my-2">
        <h3 class="text-accent text-xs">5 подписчиков</h3>
        <h3 class="text-accent text-xs mx-2">5 подписок</h3>
      </div>
      <button class="btn bg-accent btn-xs border-none">
        <Fa icon={faUserPlus} />
        <span class="mx-2">Подписаться</span>
      </button>
    </div>
    <div class="avatar">
      <div class="w-20 h-20 rounded-full">
        <img src="/avatars/nastya.jpg" />
      </div>
    </div>
  </div>

  <h2 class="mt-4 mb-2 uppercase font-bold">Интересы</h2>
  <div class="grid grid-cols-3 gap-2">
    {#each ['Дизайн', 'Бег', 'Животные', 'Спорт', 'Tilda', 'Маркетинг'] as cat}
      <span class="p-2 text-2xs text-center border border-info-content text-info-content rounded-md">{cat}</span>
    {/each}
  </div>

  <h2 class="mt-4 mb-2 uppercase font-bold">Статистика</h2>
  <div class="grid grid-cols-2 gap-2">
    <div class="p-1 text-center border border-info-content rounded-md">
      <h2 class="font-bold text-accent-content text-xl">500</h2>
      <h4 class="text-info-content text-2xs">выполненных заданий</h4>
    </div>
    <div class="p-2 text-center border border-info-content rounded-md">
      <h2 class="font-bold text-accent-content text-xl">10</h2>
      <h4 class="text-info-content text-2xs">активных месяцев</h4>
    </div>
  </div>
  <div class="mt-2 h-52 rounded-lg grid place-items-center">
    <div class="p-2 text-center border-2 border-gray-300 rounded-md h-40 flex justify-between">
      {#each data.graph as element, num}
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
  </div>

  <h2 class="mb-2 uppercase font-bold">Достижения</h2>
  <div class="flex flex-col items-center">
    {#each data.achievements as achievement}
      <Achievement {...achievement} />
    {/each}
  </div>
</div>