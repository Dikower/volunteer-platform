<script lang="ts">
  
  import Vacancie from "$lib/components/vacancie/Vacancie.svelte";
import { faL } from "@fortawesome/free-solid-svg-icons";


  let testDataList = [
    {
      id: 1,
      name: "Уборка парка",
      description: "Необходимо убрать мусор в парке Горького после дня космонавтики.",
      date: "29.03.2022",
      image: "http://room-number.ru/wp-content/uploads/2017/10/park-gorkogo-22.jpg",
      skills: ["Свежий воздух", "Городские пространства"]
    },
    {
      id: 2,
      name: "Выгул детей",
      description: "Необходимо погулять с детьми из детдома \"Василек\".",
      date: "24.03.2022",
      image: "https://n1s2.hsmedia.ru/c7/53/d1/c753d1e2641e5e797d17882eb664be66/728x484_1_cf1807640669d0e83db859cbe8b2b9bb@4816x3204_0xac120003_17907956671647506659.jpeg",
      skills: ["Дети", "Стойкая психика", "Забота о ближних"]
    },
    {
      id: 3,
      name: "Кормежка бродячих собак",
      description: "Необходимо покормить бродячих собак в районе Одинцово.",
      date: "12.02.2021",
      image: "https://www.ptichka.ru/data/cache/2017dec/06/12/40990_15810-600x0.jpg",
      skills: ["Собаки", "Забота о ближних", "Свежий воздух"]
    }
  ]
  let dataListForShow = testDataList;
  let filtersList = [
    "Свежий воздух",
    "Дети",
    "Стойкая психика",
    "Забота о ближних",
    "Собаки",
    "Городские пространства",
  ]

  let searchInput = "";
  function search(){
    dataListForShow = [];
    testDataList.forEach(vacancie => {
      let name = vacancie.name.toLowerCase();
      if(name.match(searchInput.toLowerCase()) !== null){
        dataListForShow.push(vacancie);
      }
    })
  }
  let filters:any[] = [];
  function filterSearch(){
    dataListForShow = [];
    testDataList.forEach(vacancie => {
      let mainState = true;
      filters.forEach(filter => {
        let state = false;
        vacancie.skills.forEach(skill => {
          if(skill === filter) state = true;
        })
        if(!state)mainState = false;
      })
      if(mainState)dataListForShow.push(vacancie);
    })
  }
  function handleKeydown(event:any) {
    let key = event.key;
    if(key === "Enter"){
      search();
    }
  }
</script>


<svelte:window on:keydown={handleKeydown}/>

<div class="pt-8 bg-base-200 min-h-screen">

  <div class="w-6/12 flex flex-col mx-auto">
    <div class="flex flex-col w-full"> 
      <p class="text-xs pb-1">Поиск по мероприятиям:</p>
      <div class="flex">
        <input type="text" class="input input-bordered w-full" placeholder="Название мероприятия..." bind:value={searchInput}>
        <button class="btn btn-info mx-2" on:click={search}>поиск</button>
      </div>      
    </div>
  </div>
  
  <div class="w-6/12 mt-2 mx-auto flex flex-wrap">
    {#each filtersList as filter, num}
      
      <input id={"filter" + num} class="radioInput hidden " type="checkbox" bind:group={filters} value={filter} on:change={filterSearch}/>

      <label for={"filter" + num} class="rounded-md border border-yellow-400 hover:bg-yellow-400 text-yellow-500 hover:text-black p-0.5 px-2 text-xs uppercase font-bold m-1 whitespace-nowrap">
        {filter}
      </label>
    {/each}
  </div>
  
  
  <div class="grid grid-cols-2">
    {#each dataListForShow as item}
      <Vacancie data={item} on:addFilter={(newFilter) => {filters.push(newFilter.detail); filters = filters; filterSearch();} }/>
    {/each}
  </div>  
</div>


<style>
  .radioInput:checked + label {
    border-color: #fbbc23;
    background-color: #fbbc23;
    color: black;
  }
</style>
