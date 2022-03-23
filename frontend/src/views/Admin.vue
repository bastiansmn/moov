<script lang="ts">
import { defineComponent, computed } from 'vue'

import { useSettingsStore } from "@/store/settings";
import { Roles } from "@/store/model/user";

export default defineComponent({
   setup() {
      const settingsStore = useSettingsStore();

      return {
         isAdmin: computed(() => settingsStore.userConnected && settingsStore.user.roles.includes(Roles.ADMIN)),
         isModerator: computed(() => settingsStore.userConnected && settingsStore.user.roles.includes(Roles.MODERATOR)),
      }
   },
})
</script>

<template>
   <nav class="w-full h-[90px] sticky top-[88px] flex items-center p-8">
      <router-link to="/home">
         <div class="h-[30px] w-[30px] bg-purple rounded hover:rounded-sm flex items-center justify-center transition-[border-radius]">
            <svg xmlns="http://www.w3.org/2000/svg" width="14px" height="14px" viewBox="-5 0 25.618 25.618">
               <g transform="translate(-8.191 -3.191)">
                  <g>
                     <rect width="18.141" height="3.947" rx="1.954" transform="translate(8.191 16.019) rotate(-45)" fill="#ffffff"/>
                  </g>
                  <g>
                     <rect width="3.947" height="18.141" rx="1.954" transform="translate(8.191 15.981) rotate(-45)" fill="#ffffff"/>
                  </g>
               </g>
            </svg>
         </div>
      </router-link>
      <router-link v-if="isAdmin" to="/admin/application" class="text-light-grey">
         Application
      </router-link>
      <router-link v-if="isAdmin || isModerator" to="/admin/catalog" class="text-light-grey">
         Catalogue
      </router-link>
      <router-link v-if="isAdmin || isModerator" to="/admin/themes" class="text-light-grey">
         Création de thèmes
      </router-link>
   </nav>
   <div class="admin__content w-full">
      <router-view v-slot="{ Component }">
         <transition 
            name="fade"
            mode="out-in"
         >
            <keep-alive>
               <div key="admin-router" class="w-full h-full p-6">
                  <!-- TODO Define the chunk that contains all Admin sub-routes -->
                  <component :is="Component" />
               </div>
            </keep-alive>
         </transition>
      </router-view>
   </div>
</template>

<style lang="scss" scoped>
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity .4s ease-out;
}

a.router-link-active {
   color: #4D4D4D;
   position: relative;

   &:before {
      content: "";
      position: absolute;
      height: 2px;
      width: 100%;
      bottom: 0;
      background: #4D4D4D;
      animation: widthProgress .7s ease-in-out
   }
}

nav > a {
   margin-inline: 15px;
   transition: color .5s ease-in-out;
}

.admin__content {
   height: calc(100% - 90px);
}
</style>