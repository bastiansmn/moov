<script lang="ts" setup>
import { defineEmits, ref } from "vue";
import { useSettingsStore } from "@/store/settings";
import { useBackofficeStore } from "@/store/backoffice";

import { RoleEnum } from "@/store/model/user";
import Input from "@/components/common/Input.vue"

const emits = defineEmits<{
   (e: "showPopUp", popUp: string): void,
   (e: "selectUser", target: HTMLElement, user: User): void,
}>();

const settingsStore = useSettingsStore();
const backofficeStore = useBackofficeStore();

const noMatch = ref<boolean>(false);
const users = ref<User[]>(backofficeStore.users);
const backupUsers = users.value;
const modifyActive = ref<boolean>(false);

const filterSearch = (payload) => {
   payload = payload.trim();
   const filtered = backupUsers.filter(u =>
         u.username.includes(payload) 
      || u.email.includes(payload) 
      || u.roles.find(e => e.includes(payload.toUpperCase()))
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

const selectUser = ($event, user: User) => {
   const classList = $event.target.classList;
   modifyActive.value = !classList.contains("active");
   emits("selectUser", $event.target, user);
}

const showPopUp = (popUpName) => {
   emits("showPopUp", popUpName);
}
</script>


<template>
   <div class="users h-full w-[49%] p-5 bg-white rounded shadow">
      <div class="header w-full h-[24px] mb-4 flex items-center justify-between opacity__animation">
         <div class="title h-full">
            <h1>Utilisateurs du site</h1>
         </div>
         <div class="buttons w-[270px] h-full flex items-center justify-between">
            <Input 
               @change="filterSearch" 
               placeholder="Chercher" 
               :width="200" 
               :height="24" 
               background="#F7F7F7" 
               :radius="8" 
               shadow
            >
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
         <h1 class="font-bold text-sm w-fit m-auto mt-2" v-if="users.length === 0">
            Aucun utilisateur
         </h1>
         <h1 class="font-bold text-sm w-fit m-auto mt-2" v-else-if="noMatch">
            Aucune correspondance
         </h1>
         <TransitionGroup
            v-else
            tag="div"
            style="max-height: calc(100% - 40px); overflow-y: scroll"
            name="fade"
         >
            <div
               v-for="(user, index) in users" :key="index"
               class="relative user w-full h-[32px] bg-white flex outline-none cursor-pointer transition-[all] z-10 border-b-[1px] border-light-grey"
            >
               <div class="w-[30%] h-full flex items-center px-3 border-r-[1px] border-r-light-grey">
                  <span class="text-sm text-dark-grey overflow-clip text-ellipsis">{{ user.username }}</span>
               </div>
               <div class="w-[55%] h-full flex items-center px-3 border-r-[1px] border-r-light-grey">
                  <span class="text-sm text-dark-grey overflow-clip text-ellipsis">{{ user.email }}</span>
               </div>
               <div class="w-[15%] h-full flex items-center justify-between px-3">
                  <img class="h-[20px] aspect-square" v-if="user.roles?.includes(RoleEnum.ADMIN)" src="@/assets/crown.png" alt="Admin">
                  <img class="h-[20px] aspect-square" v-if="user.roles?.includes(RoleEnum.MODERATOR)" src="@/assets/pen.png" alt="Moderator">
               </div>
               <div @click="selectUser($event, user)" class="absolute inset-0"></div>
            </div>
         </TransitionGroup>
      </div>
   </div>
</template>

<style lang="scss" scoped>
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
</style>