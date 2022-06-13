<script context="module">
  export function load({ session }) {
    // if (session.token) {
    //   return {redirect: '/users/self', status: 302}
    // }
    return {};
  }
</script>

<script>
  import { goto } from "$app/navigation";
  import { bridge } from "$lib/shared";
  import { slide } from "svelte/transition";
  import { session } from "$app/stores";
  import * as cookie from "$lib/cookies";

  let username = "";
  let password = "";
  let errorMessage = null;
  let errors = { username: false, password: false };
  let rsp = bridge.createStore();

  function validate() {
    if (username === "") {
      errorMessage = "Введите E-mail";
      errors.username = true;
      return false;
    }
    // if (!/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/.test(username)){
    //   errorMessage = 'Введите валидный E-mail'
    //   errors.username = true;
    //   return false;
    // }
    if (password === "") {
      errorMessage = "Введите пароль";
      errors.password = true;
      return false;
    }
    return true;
  }

  async function submit() {
    if (!validate()) return;
    bridge.post({ path: "users/login", json: { username, password }, store: rsp });
    // eslint-disable-next-line @typescript-eslint/no-empty-function
    const data = await $rsp.promise;
    if (data.detail === "Incorrect username or password") {
      errorMessage = "Указана неверная почта или пароль";
      errors.username = true;
      errors.password = true;
    } else if (!data.access_token) {
      errorMessage = "Произошла непредвиденная ошибка";
    } else {
      $session.token = data.access_token;
      cookie.set("token", data.access_token);
      goto("/user/");
    }
  }
</script>

<svelte:head>
  <title>Вход</title>
  <link rel="icon" href="data:image/svg+xml,
    <svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22>
    <text y=%22.9em%22 font-size=%2290%22>🔐</text>
    </svg>"
  >
</svelte:head>

<div class="grid place-items-center">
  <!-- svelte-ignore a11y-missing-attribute -->
  <img src="https://static.tildacdn.com/tild3232-6435-4164-b565-313266623131/space.svg" alt="auth" />
  <div>
    <h1 class="font-bold text-xl my-5">Зайти в <span class="text-primary">Благодел</span></h1>
    <div class="flex flex-col max-w-xs gap-2">
      <input class="input input-bordered w-full" on:focus={() => errors.username = false} class:error={errors.username} bind:value={username}
             placeholder="E-mail" type="email">
      <input class="input input-bordered w-full" on:focus={() => errors.password = false} class:error={errors.password} bind:value={password}
             placeholder="Пароль" type="password">
      {#if (errorMessage != null)}
        <h3 class="text-error text-center" transition:slide|local>{errorMessage}</h3>
      {/if}
      <div class="flex justify-between gap-2 mb-5">
        <button class="btn btn-primary text-primary-content" on:click={submit}>Войти</button>
        <a class="btn btn-outline" href="/auth/signup">Зарегистрироваться</a>
      </div>
    </div>
  </div>
</div>
