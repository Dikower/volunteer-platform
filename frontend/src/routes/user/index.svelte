<script>
  import Fa from "svelte-fa";
  import { faUserPlus, faPen } from "@fortawesome/free-solid-svg-icons";
  import StoryList from "$lib/components/stories/StoryList.svelte";
  import Achievement from "$lib/components/user/Achievement.svelte";
import { element } from "svelte/internal";

  let data = {
    first_name: "Анастасия",
    last_name: "Гисина",
    friends: "5",
    subscriptions: "12",
    img: "/avatars/nastya.jpg",
    date_registration: "2022-06-14",
    active_month: "2",
    complete_tasks: "7",
    achievements: [
      {name: "Царь зверей", description: "500 заданий от благотворительных фондов помощи животным", progress: "100", total: "500", img: "data:image/png;base64,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"}
    ],
    graph: [
      {month: "Jan", count: 10, max: 15},
      {month: "Feb", count: 15, max: 15},
      {month: "Mar", count: 13, max: 15},
      {month: "Apr", count: 14, max: 15},
      {month: "May", count: 5, max: 15},
      {month: "Jun", count: 6, max: 15},
      {month: "Jul", count: 12, max: 15},
      {month: "Aug", count: 14, max: 15},
      {month: "Sep", count: 6, max: 15},
      {month: "Oct", count: 15, max: 15},
      {month: "Now", count: 0, max: 15},
      {month: "Dec", count: 0, max: 15},
    ],
    interests: ["Дизайн", "Бег", "Животные"]
  }
  let colorsForGraph = ["bg-red-400", "bg-blue-400", "bg-yellow-400", "bg-green-400"];
</script>




<div class="w-8/12 flex mx-auto pt-12">
  <div class="w-9/12 px-28">
    <div class="flex justify-between">
      <img src={data.img} alt="" class="w-40 h-40 rounded-full">
      <div class="my-auto">
        <p class="whitespace-nowrap text-lg font-bold">{data.first_name} {data.last_name}</p>
        <p class="text-gray-500 text-sm my-2">Регистрация: {data.date_registration}</p>
        <p class="text-red-500 text-xs">{data.friends} друзей {data.subscriptions} подписок</p>
      </div>
      <button class="bg-red-400 hover:bg-red-300 w-8 h-8 rounded-full my-auto">
        <Fa icon={faPen} class="m-auto"/>
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
            <div class={"rounded-t " + colorsForGraph[num%4]} style={"height: " + (Math.floor((element.count / element.max) * 100)*0.66) + "%"}></div>
            <p class="text-gray-400">{element.month}</p>
          </div>
        {/if}
      {/each}
    </div>

    <div class="mt-4">
      <h2 class="mt-4 mb-2 font-bold">Достижения</h2>
      {#each data.achievements as achievement}
       <Achievement {...achievement}/>  
      {/each}
      
    </div>

  </div>

  <div class="bg-ysellow-100 w-3/12 mt-8">
    <p class="font-bold m-2">Интересы</p>
    <div class="grid grid-cols-2"> 
      {#each data.interests as interes}
        <p class="text-xs p-0.5 text-gray-400 mx-2 my-1 text-center border-2 border-gray-300 uppercase rounded-md">{interes}</p>
      {/each}
    </div>
    
  </div>
</div>





<!-- <div class="artboard phone-1 mt-5 m-auto overflow-y-auto p-4 border-solid border-accent border-2 rounded-xl">
  <div class="flex justify-between items-center">
    <div>
      <h1 class="mt-5 font-bold text-xl text-accent-content">Анастасия Гисина</h1>
      <p class="text-info-content text-sm">Регистрация: Июнь 2022</p>
      <div class="flex my-2">
        <h3 class="text-accent text-xs">5 подписчиков</h3>
        <h3 class="text-accent text-xs mx-2">5 подписок</h3>
      </div>
      <button class="btn bg-accent btn-xs">
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
  <div class="mt-2 h-52 border border-primary rounded-lg grid place-items-center">
    Здесь будет график
  </div>

  <h2 class="mt-5 mb-2 uppercase font-bold">Достижения</h2>
  <div class="flex flex-col">
    <Achievement />
    <Achievement name="Царь зверей" reason="500 заданий от фондов помощи животным" progress="100" total="500"/>
  </div>
</div> -->