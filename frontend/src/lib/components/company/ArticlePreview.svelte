<script>
  export let title = "Как мы помогли бездомным котикам";
  export let content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.\n" +
    "Curabitur tempor quis eros tempus lacinia.";
  export let tags = ["Помощь животным", "Волонтерство"];
</script>

<div class="p-5 shadow-md rounded-xl">
  <h1 class="font-bold text-2xl">{title}</h1>
  <p class="my-4 max-h-60 ">{content}</p>
  <hr>
  <div class="flex gap-4 mt-5">
    {#each tags as tag}
      <span class="bg-base-200 p-2 rounded-md text-accent">{tag}</span>
    {/each}
  </div>
</div>
