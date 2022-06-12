<script lang="ts">
  import { faSun, faMoon, faLocation } from "@fortawesome/free-solid-svg-icons";
  import Fa from "svelte-fa";
  let data = {
      id: 3,
      name: "Кормежка бродячих собак",
      description: "Необходимо покормить бродячих собак в районе Одинцово.",
      date: "2022-12-21",
      location: "Одинцово ул. Лесная д. 42",
      type: "Стажировка",
      tasks: "Участие в разработке стратегии привлечения средств от компаний Мониторинг рынка и поиск потенциальных партнеров, в т.ч. «холодный» поиск, формирование отношений с нуля, привлечение, формирование базы Подготовка предложения для потенциальных корпоративных партнеров Ведение переговоров с существующими и потенциальными компаниями-партнерами, подготовка и передача партнерам информационных материалов и документов, необходимых для оформления сотрудничества Ответственность за подписание и переподписание соглашений с партнерамиКоординация маркетинговых проектов c существующими компаниями-партнерами Участие в подготовке благотворительных и корпоративных мероприятий компаний-партнеров Совершенствование имеющихся инструментов привлечения корпоративной поддержки (спонсорские пакеты, благотворительные открытки и др.), разработка новых Координация работы подрядчиков (агентства, сторонние специалисты, волонтеры др.) в рамках проектов и акций, направленных на работу с корпоративными партнерами Мониторинг рынка на предмет появления новых трендов и технологий в привлечении корпоративных доноров, представление дайджеста руководству с описанием возможностей реализации в фонде.",
      participants: 12,
      participation_type: "ofline",
      company: {name: "БФ Кораблик", description: "детский благотворительный фонд", rating: "5.0", grade: "1 место", img: "https://media-exp1.licdn.com/dms/image/C4D0BAQG6MLcBzJThug/company-logo_200_200/0/1519889862676?e=2147483647&v=beta&t=De-zc0-89y0BlNZSiD0S7adA43I35nsflrZSR4blNlU"},
      image: "https://www.ptichka.ru/data/cache/2017dec/06/12/40990_15810-600x0.jpg",
      skills: ["Собаки", "Забота о ближних", "Свежий воздух"]
    }
</script>



<div class="shadow mx-auto w-11/12 mt-12 p-8 flex rounded-lg">
  <div class="mr-8 flex flex-col w-96">
    <img class="w-80 h-80 rounded-lg" src={data.image} alt="">
    <div class="w-80 border-2 border-gray-200 mt-4 rounded-lg p-1 flex">
      <img src={data.company.img} alt="" class="w-16 h-16 rounded-full my-auto shadow mx-2">
      <div>
        <p class="text-sm mt-2">{data.company.name}</p>
        <p class="text-xs text-gray-400 my-1">{data.company.description}</p>
        <div class="flex text-xs">
          <div class="flex flex-col">
            <p class="mx-auto text-green-500">{data.company.rating}</p>
            <p class="-mt-0.5 text-gray-400">оценка</p>
          </div>
          <div class="flex flex-col ml-2">
            <p class="mx-auto text-red-500">{data.company.grade}</p>
            <p class="-mt-0.5 text-gray-400">рейтинг</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <div class="w-full flex flex-col rounded-lg pl-1">
    <div class="flex">
      <p class="font-bold mt-auto">{data.name}</p>
      
      <p class="text-gray-300 text-sm ml-auto">{data.date}</p>
    </div>
    <div class="flex mb-1">
      {#if data.location !== ""}
        <p class="text-xs my-auto mr-2 flex"><Fa icon={faLocation} size="lg" class="mr-1"/>{data.location}</p>
      {/if}

      <p class="ml-auto text-blue-300">{data.participation_type}</p>
      
    </div>
    

    <p class="text-sm my-1">{data.description}</p>

    <div class="my-1">
      <p>Задачи</p>
      <p class="text-sm text-gray-500">{data.tasks}</p>
    </div>
    
    <div class="mt-auto">
      {#each data.skills as skill}
        <button class="btn btn-outline btn-warning btn-xs m-1" id={skill}>{skill}</button>
      {/each}
    </div>
  </div>
</div>



