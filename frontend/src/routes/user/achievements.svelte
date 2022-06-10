<script>
  import Achievement from '$lib/components/user/Achievement.svelte';

  // const allAchievements = client.query({ query: GET_ALL_ACHIEVEMENTS });
  const allAchievements = {
    "data": {
      "achievements": [
        {
          "id": "1",
          "name": "Выпускник",
          "reason": "Успешно завершил курс",
          "pic": {
            "url": "/animations/graduation.json",
            "__typename": "UploadFile"
          },
          "progressbar": 60,
          "__typename": "Achievements"
        },
        {
          "id": "2",
          "name": "Эко-энергетик",
          "reason": "Ознакомиться с курсами по альтернативными источниками энергии",
          "pic": {
            "url": "/animations/84872-disconnected.json",
            "__typename": "UploadFile"
          },
          "progressbar": 100,
          "__typename": "Achievements"
        },
        {
          "id": "3",
          "name": "Эко-профи",
          "reason": "Прошёл все курсы на платформе",
          "pic": {
            "url": "/animations/86299-3x3-cube-loader-3.json",
            "__typename": "UploadFile"
          },
          "progressbar": 100,
          "__typename": "Achievements"
        },
        {
          "id": "4",
          "name": "Эко-практик",
          "reason": "Прошел курс с прикладным содержанием ",
          "pic": {
            "url": "/animations/bouncing-shapes.json",
            "__typename": "UploadFile"
          },
          "progressbar": 100,
          "__typename": "Achievements"
        },
        {
          "id": "5",
          "name": "На экваторе пути ",
          "reason": "Прошел 50% курсов на платформе",
          "pic": {
            "url": "/animations/online-learning.json",
            "__typename": "UploadFile"
          },
          "progressbar": 100,
          "__typename": "Achievements"
        },
        {
          "id": "6",
          "name": "Эко-активист ",
          "reason": "Посещение платформы курсов на протяжение двух недель",
          "pic": {
            "url": "/animations/work-team.json",
            "__typename": "UploadFile"
          },
          "progressbar": 0,
          "__typename": "Achievements"
        }
      ]
    },
    "loading": false,
    "networkStatus": 7,
    "stale": false
  };
</script>

<div class='flex flex-col sm:flex-row sm:p-10'>
  <div class='w-11/12 sm:w-4/12 ml-auto mr-auto sm:mt-0 mt-8 sm:ml-0 shadow p-4 sm:mr-4'>
    <p class='text-center text-xl uppercase mb-4'>Личная информация</p>
    <div class='flex'>
      <img class='w-36 h-36 rounded-2xl'
           src='https://upload.wikimedia.org/wikipedia/commons/thumb/7/72/%D0%92%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D0%B9_%D0%9D%D0%B0%D0%BB%D0%B8%D0%B2%D0%BA%D0%B8%D0%BD_%2808.09.2020%29.jpg/280px-%D0%92%D0%B8%D1%82%D0%B0%D0%BB%D0%B8%D0%B9_%D0%9D%D0%B0%D0%BB%D0%B8%D0%B2%D0%BA%D0%B8%D0%BD_%2808.09.2020%29.jpg'
           alt=''>
      <div class='my-auto ml-4'>
        <p class='text-lg font-bold'>Виталий Наливкин</p>
        <p class='text-lg'>"НИТУ МИСиС"</p>
        <p class='text-lg'>3 курс</p>
        <p class='text-lg'>ИНМИН</p>
      </div>
    </div>
    <div class='my-5'>
      <h2 class='text-lg'>Баллы: <span class='text-blue-600'>100</span></h2>
      <h2 class='text-lg'>Место в ВУЗе: <span class='text-blue-500'>5</span></h2>
      <h2 class='text-lg'>Достижения: <span class='text-blue-400'>6/10</span></h2>

    </div>

  </div>
  <div class='p-4 w-11/12 sm:w-8/12 shadow ml-auto mr-auto mt-4 sm:mr-0 sm:ml-0 sm:mt-0'>
    <h2 class='text-center text-xl uppercase mb-4'>дашборд/система мотивации</h2>
    <div class='flex flex-wrap'>
      {#await allAchievements}
        <p>Загрузка...</p>
      {:then r}
        {#each r.data.achievements as { name, reason, pic, active }}
          <Achievement {name} {reason} {active} pic={pic.url}/>
        {/each}
      {/await}
    </div>
  </div>
</div>