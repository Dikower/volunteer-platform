<script lang="ts">
  import type { StoryType } from "./types";
  import Story from "./Story.svelte";

  let stories: StoryType[] = [
    {
      title: "Посетили вершину вулкана",
      watched: false,
      opened: false,
      author: {
        name: "Кувшинов Марк",
        img: "/avatars/mark.jpg"
      },
      when: "5 hours ago",
      screens: [
        "https://proprikol.ru/wp-content/uploads/2020/04/kartinki-vulkany-27.jpg",
        "https://catherineasquithgallery.com/uploads/posts/2021-02/1613449395_3-p-fon-dlya-prezentatsii-pro-vulkani-4.jpg",
        "https://proprikol.ru/wp-content/uploads/2020/04/kartinki-vulkany-39.jpg"
      ],
      nav: 0,
      duration: 200
    },
    {
      title: "Прогулялись с щеночком",
      watched: false,
      opened: false,
      author: {
        name: "Кувшинов Марк",
        img: "/avatars/mark.jpg"
      },
      when: "2 hours ago",
      screens: [
        "https://rrav.ru/storage/media/878fcef0c41b03f5f1605daad41d3a90.jpg",
        "https://jdogs.ru/wp-content/uploads/2019/01/rassel4.jpg"
      ],
      nav: 0,
      duration: 200
    }
  ];

  export let current = 0;
  let opened = false;

  function prev() {
    if (current > 0) {
      current--;
    } else {
      opened = false;
    }
  }

  function next() {
    if (current + 1 < stories.length) {
      current++;
    } else {
      opened = false;
    }
  }
</script>

<div class="flex overflow-y-auto">
  {#each stories as story, i}
    <Story
      {...story}
      on:prev={prev}
      on:next={next}
      on:open={() => opened = true}
    />
  {/each}
</div>