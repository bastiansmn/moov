<script lang="ts">
import { defineComponent, ref, computed } from 'vue'
import { useSettingsStore } from '@/store/settings'

import PannelDropdown from './PannelDropdown.vue'
import Switcher from '../common/Switcher.vue'

import { Roles } from '@/store/model/user'
import Select from '../common/Select.vue'

const fetchCities = () => {
   return new Promise(resolve => {
      fetch("/api/cities/getCities")
         .then(res => res.json())
         .then(res => {
            resolve(res);
         });
   })
}

export default defineComponent({
   components: {
      PannelDropdown,
      Switcher,
      Select
   },
   async setup() {
      const settingsStore = useSettingsStore();

      const cities = ref(await fetchCities());

      const unshowAccount = () => {
         settingsStore.togglePannel(false);
      }  
      
      const setRecommandations = (val: boolean) => {
         settingsStore.setUserRecommandations(val);
      }

      const setEmailNotifications = (val: boolean) => {
         settingsStore.setUserEmailNotifications(val);
      }

      const setCity = (val: string) => {
         settingsStore.setUserCity(val.toLowerCase());
      }

      const setRadius = (val: number) => {
         settingsStore.setUserRadius(val);
      }

      const disconnect = () => {
         settingsStore.disconnectUser();
      }

      return {
         user: computed(() => settingsStore.user),
         userRecommandations: computed(() => settingsStore.user.userRecommandations),
         userNotifications: computed(() => settingsStore.user.userEmailNotifications),
         setRecommandations,
         setEmailNotifications,
         setCity,
         setRadius,
         disconnect,
         unshowAccount,
         
         cities,

         Roles
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
      <div class="w-full flex justify-between items-center">
         <span>Votre ville :</span>
         <!-- TODO: Ajouter les coordonnées personnelles -->
         <Select 
            @change="setCity"
            :placeholder="user.city_id ?? '...'" 
            name="city"
            :options="['...'].concat(cities.map(e => e.city_id))" 
            pointer
            shadow
            height="28px"
            width="120px"
            :radius="6"
         />
      </div>
      <div class="w-full flex justify-between items-center">
         <span>Rayon maximal</span>
         <Select 
            @change="setRadius"
            :placeholder="user.preferedRadius.toString() + 'km' ?? '...'" 
            name="radius" 
            :options="['...'].concat([...Array(11).keys()].slice(1).map(x => x*5 + 'km'))" 
            pointer
            shadow
            height="28px"
            width="120px"
            :radius="6"
         />
      </div>
   </PannelDropdown>

   <router-link 
      to="/admin"
      v-if="user.roles.includes(Roles.ADMIN)"  
      class="bg-purple w-full h-[42px] rounded shadow flex items-center justify-center text-white font-semibold text-base"
      @click="unshowAccount"
   >
      Accéder au dashboard
   </router-link>
</template>
