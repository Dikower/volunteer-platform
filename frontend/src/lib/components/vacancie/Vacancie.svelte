<script lang="ts">
  import { goto } from "$app/navigation";
  import { faLocation } from "@fortawesome/free-solid-svg-icons";
  import Fa from "svelte-fa";
  import { onMount, createEventDispatcher } from "svelte";
  const dispatch = createEventDispatcher();

  export let data: any = {};
  onMount(() => {
    // console.log(data)
  });

  function openVacancie(event: any) {
    if (event.target.id !== "") {
      dispatch("addFilter", event.target.id);
    } else {
      goto("/vacancies/" + data.id);
    }
  }
</script>


<div
  class="card w-full mx-auto mb-10 flex-col sm:flex-row items-center justify-between shadow hover:shadow-lg p-4 cursor-pointer"
  on:click={(event) => openVacancie(event)}>
  <div class="w-full flex flex-col order-2 sm:order-1 pt-2 ">
    <div class="flex ml-1 ">
      <p class="text-xl text-base-content hover:text-accent font-bold my-auto">{data.name} &nbsp</p>
      <!-- <p class="my-auto text-xs"> - {data.type}</p> -->
      <!-- <p class="ml-auto mr-4 text-blue-300">{data.participation_type}</p> -->
    </div>
    <div class="flex mb-1 ml-1">
      {#if data.location !== ""}
        <p class="text-xs my-auto mr-2 flex">
          <Fa icon={faLocation} size="lg" class="mr-1" />{data.location}</p>
      {/if}
      <p class="text-info-content text-sm mt-auto my-auto">{data.date}</p>
    </div>


    <p class="text-sm ml-1">{data.description}</p>

    <div class="mt-auto">
      {#each data.skills as skill}
        <button class="btn btn-outline border-accent text-accent btn-xs m-1" id={skill}
                on:click={() => {dispatch("addFilter", skill);}}>{skill}</button>
      {/each}
    </div>
  </div>
  <img class="order-1 sm:order-2 w-40 h-40 my-auto rounded-lg" src={data.image} alt="">
</div>