<script lang="ts">
import { defineComponent, ref } from 'vue'
import { useSettingsStore } from '@/store/settings'
import { useBackofficeStore } from '@/store/backoffice'
import { codeIsOK } from "@/utils/statusCodes";

import User from '@/store/model/user';
import Input from '@/components/common/Input.vue';
import clean from "@/utils/fetchCleaner";

export default defineComponent({
   components: {
      Input
   },
   setup(_props, { emit }) {
      const settingsStore = useSettingsStore();
      const backofficeStore = useBackofficeStore();

      const users = ref<Array<User>>(backofficeStore.users);

      const createUser = ($event) => {
         const username = $event.target.querySelector("input[name=username]").value;
         const email = $event.target.querySelector("input[name=email]").value;
         const password = $event.target.querySelector("input[name=password]").value;
         const passwordConfirm = $event.target.querySelector("input[name=passwordConfirm]").value;
         const birthyear = $event.target.querySelector("select[name=birthyear]").value;
         const moderator = $event.target.querySelector("input#moderator").checked;
         const admin = $event.target.querySelector("input#admin").checked;

         const user_uuid = localStorage.getItem('user_uuid');
         const accessToken = localStorage.getItem('accessToken');

         if (!user_uuid || !accessToken) {
            settingsStore.sendNotification({
               code: 400,
               message: "Impossible de créer l'utilisateur"
            });
            return;
         }

         if (password !== passwordConfirm) {
            settingsStore.sendNotification({
               code: 400,
               message: "Les mots de passe ne correspondent pas"
            });
            return;
         }

         const roles = [];
         if (moderator)
            roles.push("MODERATOR");
         if (admin)
            roles.push("ADMIN");

         fetch(clean("/api/user/create"), {
            method: "POST",
            headers: {
               'Content-Type': 'application/json',
               'x-access-token': accessToken
            },
            body: JSON.stringify({
               user_uuid,
               username,
               email,
               password,
               roles,
               birthyear
            })
         }).then(response => {
            const status = response.status;
            response.json().then(response => {
               if (codeIsOK(status)) {
                  settingsStore.sendNotification({
                     code: status,
                     message: "Utilisateur créé"
                  });
                  users.value.push(response);
                  emit("close")
               } else {
                  settingsStore.sendNotification({
                     code: status,
                     message: response.message
                  });
               }
            });
         }).catch(err => {
            console.error(err);
            settingsStore.sendNotification({
               code: 400,
               message: "Une erreur est survenue lors de la création de l'utilisateur"
            });
            emit("close")
         });
      }

      return {
         createUser,
      }
   },
})
</script>

<template>
   <div class="w-[400px] bg-white rounded p-6 flex flex-col items-center">
      <h1 class="font-semibold">Créer un utilisateur</h1>
      <!-- Créer un utilisateur avec username, email, mot de passe, confirmation, rôles -->
      <form @submit.prevent="createUser" class="flex flex-col items-center w-[90%]">
         <div class="mb-3 w-full">
            <h1 class="font-semibold">Pseudo :</h1>
            <Input 
               placeholder="Pseudo"
               shadow
               required
               name="username"
               background="#F7F7F7"
            />
         </div>
         <div class="mb-3 w-full">
            <h1 class="font-semibold">Email :</h1>
            <Input 
               placeholder="Email"
               shadow
               required
               name="email"
               background="#F7F7F7"
            />
         </div>
         <div class="mb-3 w-full">
            <h1 class="font-semibold">Mot de passe :</h1>
            <Input 
               placeholder="Mot de passe"
               shadow
               required
               name="password"
               background="#F7F7F7"
               type="password"
            />
         </div>
         <div class="mb-3 w-full">
            <h1 class="font-semibold">Confirmation :</h1>
            <Input 
               placeholder="Confirmation"
               shadow
               required
               name="passwordConfirm"
               background="#F7F7F7"
               type="password"
            />
         </div>
         <div class="mb-3 w-full">
            <h1 class="font-semibold">Année de naissance :</h1>
            <select name="birthyear" class="bg-white2 shadow rounded w-full h-[40px]" required>
               <option value="" disabled selected>...</option>
               <option :key="age" v-for="age in [...Array(new Date().getFullYear() + 1).keys()].slice(1900).reverse()" :value="age">{{ age }}</option>
            </select>
         </div>
         <div class="w-full">
            <h1 class="font-semibold">Rôles :</h1>
            <div class="flex items-center">
               <label for="moderator" class="flex items-center mr-10 cursor-pointer">
                  <input type="checkbox" name="moderator" id="moderator">
                  <div class="checkbox h-[14px] aspect-square rounded-[3px] shadow mr-2"></div>
                  Modérateur
               </label>
               <label for="admin" class="flex items-center cursor-pointer">
                  <input type="checkbox" name="admin" id="admin">
                  <div class="checkbox h-[14px] aspect-square rounded-[3px] shadow mr-2"></div>
                  Administrateur
               </label>
            </div>
         </div>
         <input type="submit" value="Créer" class="bg-purple text-white rounded-[4px] px-4 py-1 mt-5 
         mx-auto cursor-pointer">
      </form>
   </div>
</template>

<style lang="scss" scoped>
input[type=checkbox] {
   display: none;

   &:checked ~ .checkbox {
      background: #7061E4;
   }
   & ~ .checkbox {
      transition: background .3s;
      background: #C5C5C5;
   }
}
</style>
