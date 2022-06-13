<script lang="ts">  
  import Vacancie from "$lib/components/vacancie/Vacancie.svelte";
  import {getActivities} from "./functions";
  import { onMount } from "svelte";
  import { faFilter } from "@fortawesome/free-solid-svg-icons";
  import Fa from "svelte-fa";
  import {testDataList} from './data';

  let dataListForShow = testDataList;
  let filtersList = [
    "Свежий воздух",
    "Дети",
    "Стойкая психика",
    "Забота о ближних",
    "Собаки",
    "Городские пространства",
  ];
  let filterState = false;
  let typeList = [
    "online", "offline"
  ]

  let searchInput = "";
  let filters:any[] = [];
  let vacType = "";
  let dateStart = "";
  let dateEnd = "";

  onMount(() => {
    // let out = getActivities();
  })

  function search(){

    let newDataListForShow: any[] = [];
    dataListForShow = [];

    // search
    testDataList.forEach(vacancie => {
      let name = vacancie.name.toLowerCase();
      if(name.match(searchInput.toLowerCase()) !== null){
        newDataListForShow.push(vacancie);
      }
    })
    // filters
    newDataListForShow.forEach(vacancie => {
      let mainState = true;
      if((vacancie.participation_type !== vacType) && (vacType !== "")) mainState = false;
      filters.forEach(filter => {
        let state = false;
        vacancie.skills.forEach((skill: any) => {
          if(skill === filter) state = true;
        })
        if(!state)mainState = false;
      })
      if(mainState)dataListForShow.push(vacancie);
    })
    newDataListForShow = dataListForShow;
    dataListForShow = [];
    newDataListForShow.forEach(vacancie => {
      let newStart = "0001-01-01";
      let newEnd = "9999-12-31";
      if(dateStart !== "") newStart = dateStart;
      if(dateEnd !== "") newEnd = dateEnd;
      if(vacancie.date <= newEnd && vacancie.date >= newStart) dataListForShow.push(vacancie);
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

<div class="p-5">
  <div class="w-full sm:w-6/12 flex flex-col mx-auto mb-4">
    <div class="flex flex-col w-full"> 
      <p class="text-xs pb-1">Поиск по мероприятиям:</p>
      <div class="flex">
        <input type="text" class="input input-bordered w-full" placeholder="Название мероприятия..." bind:value={searchInput}>
        <button class="btn btn-accent text-primary-content mx-2" on:click={search}>Поиск</button>
        <button class="btn btn-accent text-primary-content w-12" on:click={() => {filterState = !filterState}}><Fa icon={faFilter} size="lg" class="m-auto"/></button>
      </div>      
    </div>
  </div>
  

  {#if filterState}
    <div class="w-6/12 mt-2 mx-auto flex flex-wrap">
      {#each filtersList as filter, num}
        <input id={"filter" + num} class="radioInput hidden " type="checkbox" bind:group={filters} value={filter} on:change={search}/>
        <label for={"filter" + num} class="rounded-md border btn-info btn-outline  hover:text-black p-0.5 px-2 text-xs uppercase font-bold m-1 whitespace-nowrap">
          {filter}
        </label>
      {/each}
    </div>
    <div class="w-6/12 mt-2 mx-auto flex flex-wrap">
      {#each typeList as type, num}
        <input id={"type" + num} class="radioInput hidden" on:click={() => {if(vacType === type){vacType=""; search()}}} type="radio" bind:group={vacType} value={type} on:change={search}/>
        <label for={"type" + num} class="rounded-md border btn-info btn-outline  hover:text-black p-0.5 px-2 text-xs uppercase font-bold m-1 whitespace-nowrap">
          {type}
        </label>
      {/each}
    </div>
    
    <div class="w-6/12 mx-auto mt-2 flex justify-center items-center gap-2 mb-4">
      <input type="date" name="" class="input shadow" bind:value={dateStart}>
      <span>-</span>
      <input type="date" name="" class="input shadow" bind:value={dateEnd}>
    </div>
  {/if}
  
  <div class="grid grid-cols-1 sm:grid-cols-2">
    {#each dataListForShow as item}
      <div class="w-11/12 mx-auto">
        <Vacancie data={item} on:addFilter={(newFilter) => {filters.push(newFilter.detail); filters = filters; search();} }/>
      </div>
    {/each}
  </div>  
</div>


<style>
  .radioInput:checked + label {
    border-color: #3abef8;
    background-color: #3abef8;
    color: black;
  }
</style>
