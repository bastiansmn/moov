<script lang="ts">
import { defineComponent, ref, onMounted } from "vue";

import Input from '@/components/common/Input.vue';
import { useSettingsStore } from '@/store/settings';
import User from '@/store/model/user';

export default defineComponent({
   name: "Connection",
   components: {
      Input,
   },
   setup() {
      const currentForm = ref("");
      const settingsStore = useSettingsStore();

      const loginForm = ref(null);
      const registerForm = ref(null);

      type UserPreferences = { 
         userRecommandations: boolean, 
         userEmailNotifications: boolean, 
         accessToken: string 
      };
      const connectUser = (userInfos: User, userPreferences: UserPreferences) => {
         // Save user in store to provide repetitive requests
         settingsStore.connectUser({
            user_uuid: userInfos.user_uuid,
            email: userInfos.email,
            username: userInfos.username,
            roles: userInfos.roles
         }, userPreferences);
      }

      const register = () => {
         const form = registerForm.value;
                 
         if (currentForm.value === "register") {              
            const inputs = Array.from(form.querySelectorAll("inputs:not([type=submit])")); // Get all the inputs

            if (inputs.map(input => input.value).includes("")) {
               settingsStore.sendNotification({
                  code: 400,
                  message: "Renseignez les champs",
               })
               return;
            }

            const username = inputs.find(input => input.name === "username").value;
            const email = inputs.find(input => input.name === "email").value;
            const password = inputs.find(input => input.name === "password").value;
            const passwordConfirm = inputs.find(input => input.name === "passwordConfirm").value;
            
            if (password !== passwordConfirm) {
               settingsStore.sendNotification({
                  code: 400,
                  message: "Les mots de passes sont différents",
               });
               return;
            }
            const payload = {
               username,
               email,
               password
            };

            fetch("/api/auth/signup", {
               method: "POST",
               headers: new Headers({
                  "Content-Type": "application/json",
               }),
               mode: "cors",
               body: JSON.stringify(payload)
            }).then(response => {
               const status = response.status;
               response.json().then(data => {
                  if (status >= 200 && status < 300) {
                     connectUser(data, {
                        userRecommandations: data.userRecommandations,
                        userEmailNotifications: data.userEmailNotifications,
                        accessToken: data.accessToken,
                     });
                     return;
                  }
                  settingsStore.sendNotification({
                     code: 400,
                     message: data.message,
                  });
               })
            }).catch(err => {
               console.error(err);
            });
         }
      }

      const login = () => {
         const form = loginForm.value;
         if (currentForm.value === "login") {
            const inputs = Array.from(form.querySelectorAll("input:not([type=submit])")); // Get all the inputs
            
            if (inputs.map(input => input.value).includes("")) {
               settingsStore.sendNotification({
                  code: 400,
                  message: "Renseignez les champs",
               })
               return;
            }

            const username = inputs.find(input => input.name === "username").value;
            const password = inputs.find(input => input.name === "password").value;            

            const payload = {
               username,
               password
            };

            fetch("/api/auth/signin", {
               method: "POST",
               headers: new Headers({
                  "Content-Type": "application/json",
               }),
               mode: "cors",
               body: JSON.stringify(payload)
            }).then(response => {
               const status = response.status;
               response.json().then(data => {                                    
                  if (status >= 200 && status < 300) {
                     connectUser(data, { 
                        userRecommandations: data.userRecommandations,
                        userEmailNotifications: data.userEmailNotifications,
                        accessToken: data.accessToken,
                     });
                     return;
                  }
                  settingsStore.sendNotification({
                     code: 400,
                     message: data.message,
                  });
               })
            }).catch(err => {
               console.error(err);
            });
         }
      }

      const toggleForm = form => {
         if (currentForm.value === form) {
            if (form === "login") {
               login();
               return;
            } else {
               register();
               return;
            }
         } else {
            if (form === "login")       
               loginForm.value.children[0].children[0].focus();
            else
               registerForm.value.children[0].children[0].focus();
         }
         currentForm.value = form;
         document.querySelectorAll(".forms > div").forEach(e => {
            e.classList.remove("active");
         })
         document.querySelector(`.${form}`).classList.add("active");
      }

      

      return {
         currentForm,
         toggleForm,
         register, 
         login,

         loginForm,
         registerForm,
      }
   }
})
</script>

<template>
   <div class="Connection w-full">
      <div class="text mb-10">
         <h1>
            Votre compte :
         </h1>
         <p>
            Vous n’êtes pas encore connectés. Le compte Moov vous permet d’enregistrer des évènements pour plus tard, d’avoir des recommandations personnalisées
         </p>
         <p>
            Nous ne partageons, ni n’utilisons vos données ! Votre compte est strictement personnel et aucune information n’est partagée.
         </p>
      </div>
      <div class="forms w-full">
         <div class="register bg-light-grey shadow">
            <form ref="registerForm" @submit.prevent="register" autocomplete="off">
               <Input @submit="register" name="username" required shadow placeholder="Votre pseudo" />
               <Input @submit="register" name="email" required type="email" shadow placeholder="Votre mail" />
               <Input @submit="register" name="password" required type="password" shadow placeholder="Votre mot de passe" />
               <Input @submit="register" name="passwordConfirm" required type="password" shadow placeholder="Confirmez votre mot de passe" />
               <input type="submit" value="register" hidden>
            </form>
            <button @click="toggleForm('register')" class="toggle-register w-full h-[42px] text-white font-bold outline-none transition-[transform]">
               S'incrire
            </button>
         </div>
         <div class="login bg-purple shadow">
            <form ref="loginForm" @submit.prevent="login" autocomplete="off">
               <Input name="username" color="#4D4D4D" required shadow placeholder="Votre pseudo" />
               <Input name="password" color="#4D4D4D" required type="password" shadow placeholder="Votre mot de passe" />
               <a href="" class="text-light-grey font-light underline self-end hover:text-white ">Mot de passe oublié</a>
               <input type="submit" value="login" hidden>
            </form>
            <button @click="toggleForm('login')" class="toggle-login w-full h-[42px] text-white font-bold outline-none transition-[transform]">
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
      height: 0;
      padding: 0;
      overflow: hidden;
   }

   &.active > form {
      --padding: 12px;
      padding: var(--padding) var(--padding) 0 var(--padding);
      height: fit-content;
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: space-between;
      
      overflow: hidden;

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
}
</style>