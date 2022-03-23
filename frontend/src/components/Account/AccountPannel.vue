<script lang="ts">
import { defineComponent, ref, computed } from 'vue'
import { useSettingsStore } from '@/store/settings'

import PannelDropdown from './PannelDropdown.vue'
import Switcher from '../common/Switcher.vue'

export default defineComponent({
   components: {
      PannelDropdown,
      Switcher
   },
   setup() {
      const settingsStore = useSettingsStore();

      const unshowAccount = () => {
         settingsStore.togglePannel(false);
      }
      
      const setRecommandations = (val: Boolean) => {
         settingsStore.setUserRecommandations(val);
      }

      const setEmailNotifications = (val: Boolean) => {
         settingsStore.setUserEmailNotifications(val);
      }

      const disconnect = () => {
         settingsStore.disconnectUser();
      }

      return {
         user: computed(() => settingsStore.user),
         userRecommandations: computed(() => settingsStore.userRecommandations),
         userNotifications: computed(() => settingsStore.userEmailNotifications),
         setRecommandations,
         setEmailNotifications,
         disconnect,
         unshowAccount,
      }
   },
})
</script>

<template>
   <button @click="disconnect" class="absolute top-6 left-6 h-[30px] bg-white rounded-sm shadow px-3 text-dark-grey">
      Se déconnecter
   </button>

   <h1 class="font-bold text-xl mb-10">Votre compte :</h1>
   <PannelDropdown title="Evènements enregistrés">
      <p class="font-medium text-md">Vous n'avez pas encore enregistré d'évènement</p>
   </PannelDropdown>
   <PannelDropdown title="Vos paramètres">
      <h1 class="text-lg mb-2 w-full">Vos informations :</h1>
      <ul class="w-full">
         <li class="flex items-center justify-between"><span>Pseudo :</span><span>{{ user.username }}</span></li>
         <li class="flex items-center justify-between my-2"><span>Email :</span><span>{{ user.email }}</span></li>
      </ul>
      <div class="w-full flex justify-between items-center">
         <span>Recommandations personnalisées</span>
         <Switcher @switched="setRecommandations" :default="userRecommandations" />
      </div>
      <div class="w-full flex justify-between items-center">
         <span>Nouveaux évènements par email</span>
         <Switcher @switched="setEmailNotifications" :default="userNotifications" />
      </div>
   </PannelDropdown>

   <router-link 
      to="/admin"
      v-if="user.roles.includes('ADMIN')"  
      class="bg-purple w-full h-[42px] rounded shadow flex items-center justify-center text-white font-semibold text-base"
      @click="unshowAccount"
   >
      Accéder au dashboard
   </router-link>
</template>

<style lang="scss" scoped>
.param__section {
   width: 100%;
}
</style>
