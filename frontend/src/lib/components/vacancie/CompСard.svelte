<script>
  import Fa from "svelte-fa";
  import { faLocation, faTag } from "@fortawesome/free-solid-svg-icons";

  export let name = "Стажировка БФ Кораблик";
  export let image = "https://storage.yandexcloud.net/korablik-club/activities/289/header/oIPQPDvfevCTKkFQp8k9RTdGKS6cFcWslcfJ8487.jpg";
  export let location = "Москва";
  export let type = "Стажировка";
  export let persons = ["/avatars/mark.jpg", "/avatars/misha.jpg", "/avatars/nastya.jpg"];
</script>

<div class="my-5 flex w-full">
  <img class="w-1/2 object-cover rounded-xl" alt="vacancy" src={image}>
  <div class="flex flex-col w-1/2 ml-5">
    <h1 class="text-accent-content font-bold text-sm">{name}</h1>
    <h2 class="text-info-content text-2xs flex items-center">
      <Fa icon={faLocation} />
      <span class="mx-1">{location}</span>
    </h2>
    <h2 class="text-info-content text-2xs flex items-center">
      <Fa icon={faTag} />
      <span class="mx-1">{type}</span>
    </h2>

    <div class="flex">
      <div class="avatar-group -space-x-4">
        {#each persons as person}
          <div class="avatar">
            <div class="w-7">
              <img alt="person" src={person} />
            </div>
          </div>
        {/each}
        <div class="avatar placeholder">
          <div class="w-7 bg-neutral-focus text-neutral-content">
            <span>+30</span>
          </div>
        </div>
      </div>
    </div>
    <button class="mt-2 bg-accent rounded-md p-2 text-xs w-fit hover:bg-neutral hover:text-primary-content transition-all">
      Присоединиться
    </button>
  </div>
</div>