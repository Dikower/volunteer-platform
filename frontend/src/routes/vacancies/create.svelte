<script lang="ts">
  import { faSun, faMoon, faLocation } from "@fortawesome/free-solid-svg-icons";
  import MdRender from "$lib/components/company/MdRender.svelte";
  import Fa from "svelte-fa";
  let data = {
      name: "",
      description: "",
      date: "",
      location: "",
      type: "",
      tasks: ``,
      participation_type: "ofline",
      company: {name: "БФ Кораблик", description: "детский благотворительный фонд", rating: "5.0", grade: "1 место", img: "https://media-exp1.licdn.com/dms/image/C4D0BAQG6MLcBzJThug/company-logo_200_200/0/1519889862676?e=2147483647&v=beta&t=De-zc0-89y0BlNZSiD0S7adA43I35nsflrZSR4blNlU"},
      image: "",
      skills: []
    }

  let participation_typeList = ["ofline", "online"];
</script>



<div class="shadow mx-auto w-11/12 mt-12 p-8 flex rounded-lg">
  <div class="mr-8 flex flex-col w-96">
    <!-- <img class="w-80 h-80 rounded-lg" src={data.image} alt=""> -->
    <input type="image" class="w-80 h-80 rounded-lg" bind:value={data.image}>
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
      <input type="text" bind:value={data.name} class="shadow font-bold mt-auto" placeholder="Название мероприятия">
      <input type="date" bind:value={data.date} class="shadow text-gray-300 text-sm ml-auto">
    </div>
    <div class="flex my-1">
      {#if data.location !== ""}
        <p class="text-xs my-auto mr-2 flex"><Fa icon={faLocation} size="lg" class="mr-1"/>{data.location}</p>
      {/if}
      <input type="text" bind:value={data.location} class="shadow" placeholder="Локация мероприятия">
      <input type="text" bind:value={data.participation_type} class="shadow ml-auto text-blue-300" placeholder="participation_type мероприятия">
    </div>
    
    <textarea bind:value={data.description} placeholder="Описание мероприятия" class="shadow text-sm my-1 resize-y"/>


    <div class="my-1 text-gray-500 text-sm text-ellipsis">
      <p class="text-black text-sm">Задачи</p>
      <textarea bind:value={data.description} placeholder="Описание мероприятия" class="shadow text-sm my-1 resize-y w-full"/>
    </div>
    
    <div class="mt-auto">
      {#each data.skills as skill}
        <!-- <button class="btn btn-outline btn-warning btn-xs m-1" id={skill}>{skill}</button> -->

        <input type="text" bind:value={skill} class="shadow btn btn-outline btn-warning btn-xs m-1" placeholder="#*****">

      {/each}
      <button class="btn rounded-full" on:click={() => {data.skills.push(""); data.skills = data.skills;}}>+</button>
      <!-- <button class="btn rounded-full" on:click={() => {data.skills.slice(0, data.) data.skills = data.skills;}}>+</button> -->
    </div>
  </div>
</div>



