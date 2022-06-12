<script lang="ts">
  import Vacancie from "$lib/components/vacancie/Vacancie.svelte";
  let data = {
    id: 3,
    name: "Кормежка бродячих собак",
    description: "Необходимо покормить бродячих собак в районе Одинцово.",
    date: "12.02.2021",
    type: "ofline",
    image: "https://www.ptichka.ru/data/cache/2017dec/06/12/40990_15810-600x0.jpg",
    skills: ["Собаки", "Забота о ближних", "Свежий воздух"]
  };
</script>


<Vacancie {data}/>


