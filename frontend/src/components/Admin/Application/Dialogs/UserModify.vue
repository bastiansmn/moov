<script lang="ts" setup>
import {defineEmits, defineProps} from 'vue'
import User from "@/store/model/user"
import {useBackofficeStore} from '@/store/backoffice';
import {codeIsOK} from "@/utils/statusCodes"
import {useSettingsStore} from '@/store/settings';

const props = defineProps<{
   selectedUser: User
}>();

const emit = defineEmits(['close']);

const backofficeStore = useBackofficeStore();
const settingsStore = useSettingsStore();

const updateUser = ($event) => {
   const adminRole = $event.target.querySelector("input[name=ADMIN]").checked;
   const moderatorRole = $event.target.querySelector("input[name=MODERATOR]").checked;

   const accessToken = localStorage.getItem('accessToken');
   const user_uuid = localStorage.getItem('user_uuid');
   const target_user_uuid = props.selectedUser.user_uuid;

   const roles = [];
   if (adminRole) 
      roles.push("ADMIN");
   if (moderatorRole) 
      roles.push("MODERATOR");
   
   fetch('/api/user/updateRoles', {
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
         backofficeStore.users = backofficeStore.users.map(user => {
            if (user.user_uuid === target_user_uuid) {
               user.roles = roles;
            }  
            return user;
         });
         emit("close");
      }
      response.json().then(response => {
         settingsStore.sendNotification({
            code: status,
            message: response.message
         });
      });
      
   });
}
</script>

<template>
   <div class="w-[280px] bg-white rounded p-6 flex flex-col items-center">
      <div class="w-full mb-2">
         <h1 class="font-semibold">Pseudo :</h1>
         <h2 class="text-sm">{{ props.selectedUser.username }}</h2>
      </div>
      <div class="w-full mb-2">
         <h1 class="font-semibold">Email :</h1>
         <h2 class="text-sm">{{ props.selectedUser.email }}</h2>
      </div>
      <div class="w-full mb-2">
         <h1 class="font-semibold">Roles :</h1>
         <form @submit.prevent="updateUser" class="w-full flex flex-col items-center">
            <div :key="index" v-for="({ name }, index) in backofficeStore.roles.filter(r => r.name !== 'USER')" class="w-full">
               <label class="flex items-center h-[32px] cursor-pointer text-dark-grey w-full">
                  <input 
                     :id="index === 0 ? 'admin' : 'moderator'"
                     type="checkbox" 
                     :checked="props.selectedUser.roles.includes(name)" 
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
