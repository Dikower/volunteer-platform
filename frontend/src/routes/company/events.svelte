<script>
  import Vacancie from "$lib/components/vacancie/Vacancie.svelte";
  import {testDataList} from "./data";
</script>

<div>
  {#each testDataList as data}
    <Vacancie {data}/>
  {/each}
</div>
