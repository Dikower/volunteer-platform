<script>
  import { page } from "$app/stores";
  import MdRender from "$lib/components/company/MdRender.svelte";
  import Fa from "svelte-fa";
  import { faPen, faSave } from "@fortawesome/free-solid-svg-icons";

  export let title = "Как мы помогли бездомным котикам";
  export let article = `
# Как мы помогали котикам
![cat](https://i.ytimg.com/vi/jg8ixdQzrjc/maxresdefault.jpg)
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.

## Следующий параграф
![cat](https://funik.ru/wp-content/uploads/2018/10/17478da42271207e1d86.jpg)
![cat](http://mobimg.b-cdn.net/v3/fetch/fe/fe22186dba2df35f07573604aa8a0e63.jpeg)
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.
Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum eleifend. Nulla varius volutpat turpis sed lacinia. Nam eget mi in purus lobortis eleifend. Sed nec ante dictum sem condimentum ullamcorper quis venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.

`;
  let editing = false;
</script>

<div class="flex flex-col">
  {#if !editing}
    <button
      class="btn btn-accent btn-md self-end text-primary-content"
      on:click={() => editing = true}
    >
      <Fa icon={faPen} />
      <span class="mx-2">Редактировать</span>
    </button>
  {:else}
    <button
      class="btn btn-accent btn-md self-end "
      on:click={() => editing = false}
    >
      <Fa icon={faSave} />
      <span class="mx-2">Сохранить</span>
    </button>

    <div class="fixed bg-base-100 right-5 top-5 w-2/6 h-full border border-accent">
      <button
        class="btn mx-5 mt-5 btn-accent btn-md self-end text-primary-content"
        on:click={() => editing = false}
      >
        <Fa icon={faSave} />
        <span class="mx-2">Сохранить</span>
      </button>
      <textarea bind:value={article} class="mt-3 textarea w-full h-full"></textarea>
    </div>
  {/if}
  <MdRender source={article} />
</div>
