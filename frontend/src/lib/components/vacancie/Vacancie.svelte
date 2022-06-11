<script lang="ts">
import { onMount, createEventDispatcher } from "svelte";
const dispatch = createEventDispatcher();

  export let data: any = {};
  onMount(() => {
    // console.log(data)
  })
</script>


<div class="card w-10/12 mx-auto bg-base-100 mt-10 flex-row justify-between shadow hover:shadow-md p-4">
  <div class="w-full flex flex-col pt-2 ">
    <div class="flex mb-1 ml-1">
      <p class="font-bold mt-auto">{data.name}</p>
      <p class="text-gray-300 ml-4 text-sm mt-auto">{data.date}</p>
    </div>
  

    <p class="text-sm ml-1">{data.description}</p>

    <div class="mt-auto">
      {#each data.skills as skill}
        <button class="btn btn-outline btn-warning btn-xs m-1" on:click={() => {dispatch("addFilter", skill);}}>{skill}</button>
      {/each}
    </div>
  </div>
  <img class="w-40 h-40 my-auto rounded-lg" src={data.image} alt="">
</div>