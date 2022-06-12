<script>
  import Fa from "svelte-fa";
  import { faUserPlus } from "@fortawesome/free-solid-svg-icons";
  import StoryList from "$lib/components/stories/StoryList.svelte";
  import Achievement from "$lib/components/user/Achievement.svelte";
</script>


<div class="artboard phone-1 mt-5 m-auto overflow-y-auto p-4 border-solid border-accent border-2 rounded-xl">
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

<!--  <div>-->
<!--    Соцсети-->
<!--  </div>-->

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
</div>
