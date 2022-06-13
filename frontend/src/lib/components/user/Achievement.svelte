<script>
  export let name = '';
  export let description = '';
  export let img = '';
  export let progress = "";
  export let total = "";
</script>


<div class="p-2 text-center border-2 border-gray-300 rounded-md mr-2 mb-2 flex w-full max-w-sm">
  <img src={img} alt="" class="w-16 h-16 my-auto">
  <div class="ml-2 w-full p-2">
    <h2 class="font-bold text-left">{name}</h2>
    <h3 class="text-2xs text-left">{description}</h3>
    <div class="flex items-center justify-between">
      <progress class="progress progress-secondary w-4/6" value={progress} max={total}></progress>
      <span class="text-info-content text-2xs">{progress} / {total} </span>
    </div>
  </div>
</div>
