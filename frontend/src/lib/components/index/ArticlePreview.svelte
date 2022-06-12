<script>
  export let authors = ["/avatars/mark.jpg", "/avatars/misha.jpg", "/avatars/nastya.jpg"];
  export let bg = "#ef476f";
  export let title = "Научное волонтерство: быстрый старт";
  export let description = "Как помочь, если знаешь Python?";
</script>

<div class="p-2 mr-2 rounded-lg w-1/2 flex flex-col justify-between" style="background: {bg}">
  <div>
    <h1 class="text-xs font-bold text-white">{title}</h1>
    <p class="text-2xs text-slate-100 text-clip">{description}</p>
  </div>
  <div class="avatar-group -space-x-4 my-2">
    {#each authors as author}
      <div class="avatar">
        <div class="w-7">
          <img alt="person" src={author} />
        </div>
      </div>
    {/each}
  </div>
</div>