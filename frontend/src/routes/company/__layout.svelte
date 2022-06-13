<script>
  import Fa from "svelte-fa";
  import { faHeart, faUserPlus, faArrowUp, faArrowDown } from "@fortawesome/free-solid-svg-icons";
  import ArticlePreview from "$lib/components/company/ArticlePreview.svelte";
  import { page } from "$app/stores";

  let data = {
    img: "/companies/ozon.png",
    name: "OZON.ru",
    desc: "Технологии, маркетплейс",
    top: 1,
    mark: 5.,
    articles: [],
    info: {
      creationDate: "15 октября 1998",
      location: "Россия",
      site: { short: "ozon.ru", full: "https://ozon.ru" },
      staff: "5000-1000 человек",
      regDate: "9 августа 2008",
      responsible: "Гисина Анастасия"
    },
    participation: {
      volunteers: 12_924,
      business: 30,
      tasks: 1000,
      retention: 70
    },

    // TODO calculate
    content: {
      blogAmount: 4,
      eventsAmount: 10
    }

  };
</script>

<div class="max-w-screen-xl w-full m-auto">
  <div class="flex w-full p-5 gap-6">
    <div class="flex flex-col w-full sm:w-4/6 gap-6">
      <header class=" flex flex-col shadow-md p-5 rounded-lg">
        <div class="flex w-full items-center my-2 gap-6">
          <img alt="company logo rounded-xl border border-accent p-1" src={data.img}>
          <div>
            <h3 class="text-accent font-black"> {data.top} место</h3>
            <span class="text-base-content font-light">Рейтинг</span>
          </div>

          <div>
            <h3 class="text-primary flex items-center font-bold gap-2">
              <Fa icon={faHeart} />
              <span>{data.mark}</span>
            </h3>
            <span class="text-base-content font-light">Оценка</span>
          </div>
          <div class="flex flex-col items-center">
            <div class="flex gap-1">
              <button class="btn btn-accent btn-square btn-outline btn-xs">
                <Fa icon={faArrowDown} />
              </button>
              <button class="btn btn-primary btn-square btn-outline btn-xs">
                <Fa icon={faArrowUp} />
              </button>
            </div>
            <span class="text-base-content font-light">Карма</span>
          </div>
        </div>
        <div class="flex w-full justify-between items-center">
          <div>
            <h2 class="my-1 text-base-content font-bold text-xl">{data.name}</h2>
            <h4 class="text-info-content text-md">{data.desc}</h4>
          </div>
          <button class="btn btn-accent text-primary-content btn-sm">
            <Fa icon={faUserPlus} />
            <span class="mx-2">Подписаться</span></button>
        </div>
        <div class="flex mt-2 uppercase gap-4 flex-wrap">
          <a class:underline={$page.routeId === 'company'} class="link link-hover" href="/company">Описание</a>
          <a class:underline={$page.routeId === 'company/articles'} class="link link-hover"
             href="/company/articles">Блог <span>{data.content.blogAmount}</span></a>
          <a class:underline={$page.routeId === 'company/events'} class="link link-hover"
             href="/company/events">Мероприятия <span>{data.content.eventsAmount }</span></a>
        </div>
      </header>
      <slot />

    </div>
    <div class="hidden sm:flex flex-col gap-5 w-2/6">
      <div class="flex h-fit flex-col shadow-md p-5 rounded-lg">
        <h3 class="uppercase text-base-content font-semibold">Информация</h3>
        <hr class="my-2" />
        <div class="grid grid-cols-2 gap-1">
          <h4 class="text-base-content font-semibold">Дата основания</h4>
          <span class="text-info-content">{data.info.creationDate}</span>
          <h4 class="text-base-content font-semibold">Местоположение</h4>
          <span class="text-info-content">{data.info.location}</span>
          <h4 class="text-base-content font-semibold">Сайт</h4>
          <a class="link link-primary" href={data.info.site.full}>{data.info.site.short}</a>
          <h4 class="text-base-content font-semibold">Численность</h4>
          <span class="text-info-content">{data.info.staff}</span>
          <h4 class="text-base-content font-semibold">Дата регистрации</h4>
          <span class="text-info-content">{data.info.regDate}</span>
          <h4 class="text-base-content font-semibold">Представитель</h4>
          <span class="text-info-content">{data.info.responsible}</span>
        </div>
      </div>

      <div class="flex h-fit flex-col shadow-md p-5 rounded-lg">
        <h3 class="uppercase text-base-content font-semibold">Участие на платформе</h3>
        <hr class="my-2" />
        <div class="grid grid-cols-2 gap-1">
          <h4 class="text-base-content font-semibold">Привлеченные волонтеры</h4>
          <span class="text-info-content">{data.participation.volunteers}</span>
          <h4 class="text-base-content font-semibold">Бизнес, поддержавший фонд</h4>
          <span class="text-info-content">+{data.participation.business}</span>
          <h4 class="text-base-content font-semibold">Опубликованных заданий</h4>
          <span class="text-info-content">{data.participation.tasks}</span>
          <h4 class="text-base-content font-semibold">Возвращаемость волонтеров</h4>
          <span class="text-info-content">{data.participation.retention}%</span>
        </div>
      </div>

      <div class="flex h-fit flex-col shadow-md p-5 rounded-lg">
        <h3 class="uppercase text-base-content font-semibold">Предстоящие события</h3>
        <hr class="my-2" />
      </div>
    </div>
  </div>
</div>
