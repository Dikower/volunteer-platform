<script>
  import Fa from "svelte-fa";
  import { faMagnifyingGlass, faFilter } from "@fortawesome/free-solid-svg-icons";
  import CompCard from "$lib/components/vacancie/CompСard.svelte";
  import ArticlePreview from "$lib/components/index/ArticlePreview.svelte";
  import StoryList from "$lib/components/stories/StoryList.svelte";
</script>

<div class="w-full max-w-lg m-auto p-4 overflow-y-auto ">
  <div class="flex justify-between">
    <label class="flex items-center border border-base-300 text-neutral px-3 w-5/6 rounded-md">
      <Fa icon={faMagnifyingGlass} />
      <input class="focus:outline-none input-sm" placeholder="Поиск">
    </label>
    <button class="btn btn-sm btn-outline">
      <Fa icon={faFilter} />
    </button>
  </div>

  <div class="flex mt-7">
    <ArticlePreview />
    <ArticlePreview title="Помощь животным" description="Чем обычный человек может помочь бездомным животным?" bg="#ffd166"/>
  </div>

  <h2 class="mt-5 mb-2 uppercase font-bold">Истории</h2>
  <StoryList />


  <h2 class="mt-5 mb-2 uppercase font-bold">Предстоящие мероприятия</h2>
  <CompCard />
  <CompCard />
</div>