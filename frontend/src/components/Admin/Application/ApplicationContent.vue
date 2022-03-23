<script lang="ts">
import { defineComponent, ref, computed } from 'vue'
import Input from '@/components/common/Input.vue'

import { useSettingsStore } from '@/store/settings'
import { useBackofficeStore } from '@/store/backoffice'
import { codeIsOK } from '@/utils/statusCodes'

import { BarChart, useBarChart } from "vue-chart-3";
import { Chart, ChartData, ChartOptions, registerables } from "chart.js";
Chart.register(...registerables);

const settingsStore = useSettingsStore();
const backofficeStore = useBackofficeStore();

export default defineComponent({
   components: {
      Input,
      BarChart
   },
   async setup() {
      // TODO: handle le select d'un user et changer les stats
      await backofficeStore.loadBackoffice();
      const users = ref(backofficeStore.getUsers);
      const roles = ref(backofficeStore.getRoles);
      const requests = ref(backofficeStore.getRequests);

      const backupUsers = users.value;

      const modifyActive = ref(false);
      const popUpEnabled = ref(false);
      const currentPopUp = ref("");

      const selectedUser = ref({});
      const noMatch = ref(false);

      const userStatsData = computed<ChartData<"bar">>(() => ({
         labels: ["Rien", "Recomm.", "Email", "Tout"],
         datasets: [{
            data: [
               users.value.filter(user => !user.emailNotificationEnabled && !user.recommandationsEnabled).length, 
               users.value.filter(user => user.recommandationsEnabled && !user.emailNotificationEnabled).length,
               users.value.filter(user => user.emailNotificationEnabled && !user.recommandationsEnabled).length,
               users.value.filter(user => user.emailNotificationEnabled && user.recommandationsEnabled).length, 
            ],
            backgroundColor: 'rgb(112, 97, 228)',
            hoverBackgroundColor: 'rgb(149, 101, 227)',
            borderRadius: 8
         }]
      }));

      const userStatsChart = useBarChart({
         chartData: userStatsData,
         options: {
            plugins: {
               title: {
                  display: true,
                  text: "Utilisateurs abonnés aux email et/ou ayant les recommandations"
               },
               legend: {
                  display: false
               }
            }
         }
      });
      const userBarChartProps = userStatsChart.barChartProps;

      const requestStatsData = computed<ChartData<"bar">>(() => ({
         labels: ["Jour", "Semaine", "Mois", "Année"],
         datasets: [{
            data: [
               requests.value.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}-${reqDate.getDate()}` === `${today.getFullYear()}-${today.getMonth()}-${today.getDate()}`
               }).length,
               requests.value.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  // TODO: être plus précis sur le calcul de la semaine (actuellement on peut dépasser de qq jours)
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}` === `${today.getFullYear()}-${today.getMonth()}` && (reqDate.getDate() > (today.getDate() - 7) % 31);
               }).length,
               requests.value.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}` === `${today.getFullYear()}-${today.getMonth()}`;
               }).length, 
               requests.value.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return reqDate.getFullYear() === today.getFullYear();
               }).length
            ],
            backgroundColor: 'rgb(112, 97, 228)',
            hoverBackgroundColor: 'rgb(149, 101, 227)',
            borderRadius: 8
         }]
      }));

      const requestStats = useBarChart({
         chartData: requestStatsData,
         options: {
            plugins: {
               title: {
                  display: true,
                  text: "Requêtes par période (jour/semaine/mois/année)"
               },
               legend: {
                  display: false
               }
            }
         }
      });
      const requestBarChartProps = requestStats.barChartProps;

      const selectUser = ($event, user) => {
         const modifyButton = document.querySelector(".modify");
         const classList = $event.target.parentElement.classList;
         if (classList.contains("active")) {
            document.querySelectorAll(".user").forEach(e => e.classList.remove("active"));
            selectedUser.value = undefined;
            modifyActive.value = false;
            classList.remove("active");
         } else {
            document.querySelectorAll(".user").forEach(e => e.classList.remove("active"));
            selectedUser.value = user;
            modifyActive.value = true;
            classList.add("active");
            // Changer la valeur 
         }
      }

      const filterSearch = (payload) => {
         payload = payload.trim();
         const filtered = backupUsers.filter(u =>
               u.username.includes(payload) 
            || u.email.includes(payload) 
            || u.roles.find(e => e.includes(payload))
         );

         if (filtered.length === 0) {
            noMatch.value = true;
            users.value = [];
            return;
         }         

         // Si la recherche n'as pas changé, on ne fait rien
         const arrayEquals = (arr1, arr2) => {
            if (arr1.length !== arr2.length) return false;
            arr1.forEach(user => {
               if (arr2.find(u => u.user_uuid === user.user_uuid)) return false;
            });
            return true;
         }
         if (arrayEquals(filtered, users.value)) return;
         
         
         noMatch.value = false;            
         if (payload === "") {
            users.value = backupUsers;
         } else {
            users.value = filtered;
         }
      }

      const showPopUp = (popUp) => {
         popUpEnabled.value = true;
         currentPopUp.value = popUp;
      }

      const unShowPopUp = ($event) => {
         if ($event.target.classList.contains("popUpBackground")) {
            popUpEnabled.value = false;
         }
      }

      const sendMail = ($event) => {
         const mailSubject = $event.target.querySelector("input[name=mailSubject]").value;
         const mailContent = $event.target.querySelector("textarea[name=mailContent]").value;
         const user_uuid = localStorage.getItem('user_uuid');
         const accessToken = localStorage.getItem('accessToken');

         if (!user_uuid || !accessToken) {
            settingsStore.sendNotification({
               code: 400,
               message: "Impossible d'envoyer le mail"
            });
            return;
         }

         fetch("/api/mail/send", {
            method: "POST",
            headers: {
               'Content-Type': 'application/json',
               'x-access-token': accessToken
            },
            body: JSON.stringify({
               user_uuid: user_uuid,
               mailSubject,
               mailContent
            })
         }).then(response => {
            const status = response.status;
            
            response.json().then(response => {
               if (codeIsOK(status)) {
                  settingsStore.sendNotification({
                     code: status,
                     message: response.message
                  });
               } else {
                  settingsStore.sendNotification({
                     code: status,
                     message: response.message
                  });
               }
               popUpEnabled.value = false;
            })
         }).catch(err => {
            console.error(err);
            settingsStore.sendNotification({
               code: 400,
               message: "Une erreur est survenue lors de l'envoi du mail"
            });
            popUpEnabled.value = false;
         });
      }

      const createUser = ($event) => {
         const username = $event.target.querySelector("input[name=username]").value;
         const email = $event.target.querySelector("input[name=email]").value;
         const password = $event.target.querySelector("input[name=password]").value;
         const passwordConfirm = $event.target.querySelector("input[name=passwordConfirm]").value;
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

         fetch("/api/user/create", {
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
               roles
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
                  popUpEnabled.value = false;
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
            popUpEnabled.value = false;
         });
         
      }

      const updateUser = ($event) => {
         const adminRole = $event.target.querySelector("input[name=ADMIN]").checked;
         const moderatorRole = $event.target.querySelector("input[name=MODERATOR]").checked;

         const accessToken = localStorage.getItem('accessToken');
         const user_uuid = localStorage.getItem('user_uuid');
         const target_user_uuid = selectedUser.value.user_uuid;
         const roles = [];
         if (adminRole) 
            roles.push("ADMIN");
         if (moderatorRole) 
            roles.push("MODERATOR");
         
         fetch("/api/user/updateRoles", {
            method: "PUT",
            headers: {
               'Content-Type': 'application/json',
               'x-access-token': accessToken
            },
            body: JSON.stringify({
               user_uuid: user_uuid,
               target_user_uuid: target_user_uuid,
               roles
            })
         }).then(response => {
            const status = response.status;
            if (codeIsOK(status)) {
               users.value = users.value.map(user => {
                  if (user.user_uuid === target_user_uuid) {
                     user.roles = roles;
                  }  
                  return user;
               });
               popUpEnabled.value = false;
            }
            response.json().then(response => {
               settingsStore.sendNotification({
                  code: status,
                  message: response.message
               });
            });
            
         });
      }

      return {
         users,
         selectUser,
         modifyActive,
         popUpEnabled,
         showPopUp,
         unShowPopUp,
         currentPopUp,

         selectedUser,
         noMatch,

         createUser,
   
         updateUser,
         filterSearch,

         sendMail,

         roles,

         // Charts:
         userBarChartProps,
         requestBarChartProps,
      }
   },
})
</script>

<template>
   <div class="application__content h-full max-w-[1500px] flex justify-between">
      <div class="users h-full w-[49%] p-5 bg-white rounded shadow">
         <div class="header w-full h-[24px] mb-4 flex items-center justify-between opacity__animation">
            <div class="title h-full">
               <h1>Utilisateurs du site</h1>
            </div>
            <div class="buttons w-[270px] h-full flex items-center justify-between">
               <Input @submit="filterSearch" placeholder="Chercher" :width="200" :height="24" background="#F7F7F7" :radius="8" shadow>
                  <button class="aspect-square absolute right-[6px] h-[20px] flex items-center justify-center bg-purple rounded-[6px]">
                     <svg width="11" height="11" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <circle cx="7" cy="7" r="6" stroke="white" stroke-width="2"/>
                        <rect x="11.562" y="10.1478" width="8.04218" height="2" rx="1" transform="rotate(45 11.562 10.1478)" fill="white"/>
                     </svg>
                  </button>
               </Input>
               <button @click="showPopUp('userModify')" class="modify bg-white2 px-4 ml-2 w-[80px] h-full rounded-sm text-sm transition-[all] shadow" :disabled="!modifyActive" :class="modifyActive ? 'active' : ''">
                  Modifier
               </button>
            </div>
         </div>

         <div class="container w-full h-[91%] bg-white2 border-[1px] border-light-grey opacity__animation">
            <div class="header h-[40px] w-full bg-white flex flex-col border-b-[1px] pr-[var(--navbar-width)] border-light-grey ">
               <div class="h-full w-full flex items-center justify-between">
                  <div class="h-full w-[30%] flex items-center px-3 border-r-[1px] border-r-light-grey">
                     <h2>Nom</h2>
                  </div>
                  <div class="h-full w-[55%] flex items-center px-3 border-r-[1px] border-r-light-grey">
                     <h2>Email</h2>
                  </div>
                  <div class="h-full w-[15%] flex items-center px-3">
                     <h2>Rôle</h2>
                  </div>
               </div>
            </div>
            <h1 class="text-dark-grey font-bold text-sm w-fit m-auto mt-2" v-if="users.length === 0">
               Aucun utilisateur
            </h1>
            <h1 class="text-dark-grey font-bold text-sm w-fit m-auto mt-2" v-else-if="noMatch">
               Aucune correspondance
            </h1>
            <transition-group
               v-else
               tag="div"
               style="max-height: calc(100% - 40px); overflow-y: scroll"
               name="fade"
            >
               <div
                  v-for="(user, index) in users" :key="index"
                  class="user relative w-full h-[32px] bg-white flex outline-none cursor-pointer transition-[all] z-10 border-b-[1px] border-light-grey"
               >
                  <div class="w-[30%] h-full flex items-center px-3 border-r-[1px] border-r-light-grey">
                     <span class="text-sm text-dark-grey overflow-clip text-ellipsis">{{ user.username }}</span>
                  </div>
                  <div class="w-[55%] h-full flex items-center px-3 border-r-[1px] border-r-light-grey">
                     <span class="text-sm text-dark-grey overflow-clip text-ellipsis">{{ user.email }}</span>
                  </div>
                  <div class="w-[15%] h-full flex items-center justify-between px-3">
                     <img class="h-[20px] aspect-square" v-if="user.roles?.includes('ADMIN')" src="@/assets/crown.png" alt="Admin">
                     <img class="h-[20px] aspect-square" v-if="user.roles?.includes('MODERATOR')" src="@/assets/pen.png" alt="Moderator">
                  </div>
                  <div @click="selectUser($event, user)" class="absolute inset-0"></div>
               </div>
            </transition-group>
         </div>
      </div>

      <div class="settings h-full w-[49%] flex flex-col justify-between">
         <div class="boxes w-full h-[100px] flex justify-between">
            <button @click="showPopUp('email')">
               <img src="@/assets/email.png" alt="Email" class="opacity__animation">
               <h1 class="opacity__animation">
                  Envoyer un email
               </h1>
            </button>
            <button @click="showPopUp('userCreate')">
               <img src="@/assets/plus.png" alt="Créer utilisateur" class="opacity__animation">
               <h1 class="opacity__animation">
                  Créer un utilisateur
               </h1>
            </button>
            <button @click="showPopUp('events')">
               <img src="@/assets/folder.png" alt="Thèmes" class="opacity__animation">
               <h1 class="opacity__animation">
                  Thèmes d'évènements
               </h1>
            </button>
         </div>
         <div class="stats w-full h-[calc(100%-110px)] flex flex-col justify-between">
            <div class="request__stats w-full h-[49%] bg-white rounded shadow p-4">
               <BarChart class="opacity__animation" v-bind="userBarChartProps" />
            </div>
            <div class="user__stats w-full h-[49%] bg-white rounded shadow p-4">
               <BarChart class="opacity__animation" v-bind="requestBarChartProps" />
            </div>
         </div>
      </div>
   </div>

   <Transition
      mode="out-in"
      name="fade"
   >
      <div v-if="popUpEnabled" @click="unShowPopUp" class="popUpBackground fixed inset-0 popUp h-full w-full bg-glass-black z-20 flex items-center justify-center">
         <div v-if="currentPopUp === 'userModify'" class="w-[280px] bg-white rounded p-6 flex flex-col items-center">
            <div class="w-full mb-2">
               <h1 class="text-dark-grey font-semibold">Pseudo :</h1>
               <h2 class="text-dark-grey text-sm">{{ selectedUser.username }}</h2>
            </div>
            <div class="w-full mb-2">
               <h1 class="text-dark-grey font-semibold">Email :</h1>
               <h2 class="text-dark-grey text-sm">{{ selectedUser.email }}</h2>
            </div>
            <div class="w-full mb-2">
               <h1 class="text-dark-grey font-semibold">Roles :</h1>
               <form @submit.prevent="updateUser" class="w-full flex flex-col items-center">
                  <div :key="index" v-for="{ name }, index in roles.filter(r => r.name !== 'USER')" class="w-full">
                     <label class="flex items-center h-[32px] cursor-pointer text-dark-grey w-full">
                        <input 
                           :id="index === 0 ? 'admin' : 'moderator'"
                           type="checkbox" 
                           :checked="selectedUser.roles.includes(name)" 
                           :name="name"
                           class="mr-1"
                        >
                        <div class="checkbox h-[14px] aspect-square rounded-[3px] shadow mr-2"></div>
                        {{ name }}
                     </label>
                  </div>
                  <input type="submit" value="Valider" class="bg-purple text-white rounded-[4px] px-4 py-1 mt-5 cursor-pointer">
               </form>
            </div>
         </div>

         <div v-if="currentPopUp === 'email'">
            <div class="w-[400px] bg-white rounded p-6 flex flex-col items-center">
               <h1 class="text-dark-grey font-semibold">Envoyer un email à tous les utilisateurs</h1>
               <form @submit.prevent="sendMail" class="w-full flex flex-col items-center">
                  <div class="w-full mb-2">
                     <h1 class="text-dark-grey font-semibold">Sujet :</h1>
                     <input name="mailSubject" type="text" autocomplete="off" required class="w-full bg-white2 rounded p-2">
                  </div>
                  <div class="w-full mb-2">
                     <h1 class="text-dark-grey font-semibold">Message :</h1>
                     <textarea name="mailContent" required autocomplete="off" class="w-full min-h-[200px] bg-white2 rounded p-2 text-sm"></textarea>
                  </div>
                  <input type="submit" value="Envoyer" class="bg-purple text-white rounded-[4px] px-4 py-1 mt-5 cursor-pointer">
               </form>
            </div>
         </div>

         <div v-if="currentPopUp === 'userCreate'">
            <div class="w-[400px] bg-white rounded p-6 flex flex-col items-center">
               <h1 class="text-dark-grey font-semibold">Créer un utilisateur</h1>
               <!-- Créer un utilisateur avec username, email, mot de passe, confirmation, rôles -->
               <form @submit.prevent="createUser" class="flex flex-col items-center">
                  <div class="mb-3">
                     <h1 class="text-dark-grey font-semibold">Pseudo :</h1>
                     <input name="username" type="text" autocomplete="off" required class="w-full bg-white2 rounded p-2 shadow">
                  </div>
                  <div class="mb-3">
                     <h1 class="text-dark-grey font-semibold">Email :</h1>
                     <input name="email" type="email" autocomplete="off" required class="w-full bg-white2 rounded p-2 shadow">
                  </div>
                  <div class="mb-3">
                     <h1 class="text-dark-grey font-semibold">Mot de passe :</h1>
                     <input name="password" type="password" autocomplete="off" required class="w-full bg-white2 rounded p-2 shadow">
                  </div>
                  <div class="mb-3">
                     <h1 class="text-dark-grey font-semibold">Confirmation :</h1>
                     <input name="passwordConfirm" type="password" autocomplete="off" required class="w-full bg-white2 rounded p-2 shadow">
                  </div>
                  <div class="w-full">
                     <h1 class="text-dark-grey font-semibold">Rôles :</h1>
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
         </div>

         <div v-if="currentPopUp === 'events'">
            <div class="w-[400px] bg-white rounded p-6 flex flex-col items-center">
               <h1 class="text-dark-grey font-semibold">Evènements en attente</h1>
               
            </div>
         </div>
      </div>
   </Transition>
</template>

<style lang="scss" scoped>
* {
   outline: none;
}

.fade-enter-from,
.fade-leave-to {
   opacity: 0;
}

.fade-move,
.fade-enter-active,
.fade-leave-active {
   transition: opacity .2s ease-in-out;
}

.modify {
   color: #C5C5C5;
   background: #F7F7F7;

   &.active {
      color: white;
      background: #7061E4;
   }
}

.user {
   &.active {
      background: #7061E4;
      
      & span {
         color: #FFFFFF;
      }
   }
}

.container > div:nth-child(1) {
   border-radius: 8px 8px 0 0;
}

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

.boxes > button {
   background: #FFFFFF;
   color: #4D4D4D;
   font-weight: 600;
   border-radius: 11px;
   width: 32%;
   height: 100%;
   box-shadow: 0px 2px 6px -3px rgba(0, 0, 0, 0.25);
   transition: all .3s;

   &:hover {
      background: #7061E4;
      color: #FFFFFF;
   }

   & > img {
      height: 35%;
      margin: 0 auto 5px auto;
   }
}

.stats > div > div {
   height: 100%;
}
</style>