<script lang="ts">
import { defineComponent, ref } from "vue";

import Input from '@/components/common/Input.vue';

export default defineComponent({
   name: "Connection",
   components: {
      Input,
   },
   setup() {
      const currentForm = ref("login");

      const toggleForm = form => {
         currentForm.value = form;
         document.querySelectorAll(".forms > div").forEach(e => {
            e.classList.remove("active");
         })
         document.querySelector(`.${form}`).classList.add("active");
      }

      const register = $event => {
         console.log($event);
      }

      const login = $event => {
         console.log($event);
      }

      return {
         currentForm,
         toggleForm,
         register, 
         login,
      }
   }

   // TODO : Lier les connections/inscriptions au backend -> Enregistrer les infos nécessaires dans le store/localStorage
   // TODO : Faire un component "alertBox" qui affiche les messages erreurs/succès (couleur selon code HTTP)
})
</script>

<template>
   <div class="Connection w-[80%] mb-7">
      <div class="text mb-10">
         <h1>
            Votre compte :
         </h1>
         <p>
            Vous n’êtes pas encore connectés. Le compte Moov vous permet d’enregistrer des évènements pour plus tard, d’avoir des recommendations personnalisées
         </p>
         <p>
            Nous ne partageons, ni n’utilisons vos données ! Votre compte est strictement personnel et aucune information n’est partagée.
         </p>
      </div>
      <div class="forms w-full">
         <div class="register bg-light-grey">
            <form @submit.prevent="register" autocomplete="off">
               <Input required shadow placeholder="Votre pseudo" />
               <Input required type="email" shadow placeholder="Votre mail" />
               <Input required type="password" shadow placeholder="Votre mot de passe" />
               <Input required type="password" shadow placeholder="Confirmez votre mot de passe" />
               <input type="submit" value="register" hidden>
            </form>
            <button @click="toggleForm('register')" class="toggle-register">
               S'incrire
            </button>
         </div>
         <div class="login bg-purple">
            <form @submit.prevent="login" autocomplete="off">
               <Input color="#4D4D4D" required shadow placeholder="Votre pseudo" />
               <Input color="#4D4D4D" required type="password" shadow placeholder="Votre mot de passe" />
               <a href="" class="text-light-grey font-light underline self-end hover:text-white ">Mot de passe oublié</a>
               <input type="submit" value="login" hidden>
            </form>
            <button @click="toggleForm('login')" class="toggle-login">
               Se connecter
            </button>
         </div>
      </div>
   </div>
</template>

<style lang="scss" scoped>
.Connection > div > * {
   margin-block: 12px;
}

h1 {
   font-size: 17px;
   font-weight: bold;
   color: black;
}

p {
   font-size: 15px;
   font-weight: bold;
   color: #4D4D4D;
   line-height: 18px;
}

.forms > div {
   width: 100%;
   min-height: 42px;
   border-radius: 11px;
   overflow: hidden;

   &:not(.active) > form {
      display: none;
      height: 0;
      padding: 0;
   }

   &.active > form {
      display: inline;
      animation: fadeIn 1.5s ease-in-out forwards;
      padding: 20px 20px 0 20px;
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-between;

      & > *:not(a) {
         width: 100%;
      }

      & > div:nth-child(2n) {
         margin-block: 10px;
      }
   }

   &.active > button:hover {
      transform: scale(1.1);
   }

   & > button {
      cursor: pointer;
      width: 100%;
      height: 42px;
      color: white;
      font-weight: bold;
      outline: none;
   }
}
</style>