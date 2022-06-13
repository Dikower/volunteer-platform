<script lang="ts">
  import { faSun, faMoon, faLocation } from "@fortawesome/free-solid-svg-icons";
  import MdRender from "$lib/components/company/MdRender.svelte";
  import Fa from "svelte-fa";
  import { dataId as data } from "./data";
</script>


<div class="shadow mx-auto w-11/12 mt-12 p-8 flex rounded-lg">
  <div class="mr-8 flex flex-col w-96">
    <img class="w-80 h-80 rounded-lg" src={data.image} alt="">
    <div class="w-80 border-2 border-gray-200 mt-4 rounded-lg p-1 flex">
      <img src={data.company.img} alt="" class="w-16 h-16 rounded-full my-auto shadow mx-2">
      <div>
        <p class="text-sm mt-2">{data.company.name}</p>
        <p class="text-xs text-gray-400 my-1">{data.company.description}</p>
        <div class="flex text-xs">
          <div class="flex flex-col">
            <p class="mx-auto text-green-500">{data.company.rating}</p>
            <p class="-mt-0.5 text-gray-400">оценка</p>
          </div>
          <div class="flex flex-col ml-2">
            <p class="mx-auto text-red-500">{data.company.grade}</p>
            <p class="-mt-0.5 text-gray-400">рейтинг</p>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="w-full flex flex-col rounded-lg pl-1">
    <div class="flex">
      <p class="font-bold mt-auto">{data.name}</p>

      <p class="text-gray-300 text-sm ml-auto">{data.date}</p>
    </div>
    <div class="flex mb-1">
      {#if data.location !== ""}
        <p class="text-xs my-auto mr-2 flex">
          <Fa icon={faLocation} size="lg" class="mr-1" />{data.location}</p>
      {/if}

      <p class="ml-auto text-blue-300">{data.participation_type}</p>

    </div>


    <p class="text-sm my-1">{data.description}</p>

    <div class="my-1 text-gray-500 text-sm text-ellipsis">
      <p class="text-black text-sm">Задачи</p>
      <!-- <MdRender source={data.tasks}/> -->
      <p>{data.tasks}</p>
    </div>

    <div class="mt-auto">
      {#each data.skills as skill}
        <button class="btn btn-outline btn-warning btn-xs m-1" id={skill}>{skill}</button>
      {/each}
    </div>
  </div>
</div>



