<script lang="ts">
import {computed, defineComponent, ref} from 'vue'
import {useSettingsStore} from '@/store/settings'

import PannelDropdown from './PannelDropdown.vue'
import Switcher from '../common/Switcher.vue'
import EventPreview from '../common/EventPreview.vue'

import {RoleEnum} from '@/store/model/user'
import City from '@/store/model/city'
import Select from '../common/Select.vue'

const fetchCities = () => {
   return new Promise<Array<City>>(resolve => {      
      fetch("/api/cities/getCities")
         .then(res => res.json())
         .then(res => {
            resolve(res);
         });
   })
};

export default defineComponent({
   components: {
      PannelDropdown,
      Switcher,
      EventPreview,
      Select
   },
   async setup() {
      const settingsStore = useSettingsStore();

      const cities = ref<Array<City>>(await fetchCities());

      await settingsStore.fetchSavedEvents(true);

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

      const setRadius = (val: string) => {
         settingsStore.setUserRadius(val);
      }

      const disconnect = () => {
         settingsStore.disconnectUser();
      }

      const unsaveEvent = (event) => {
         settingsStore.unsaveEvent(event);
      }

      return {
         user: computed(() => settingsStore.user),
         userRecommandations: computed(() => settingsStore.user.userRecommandations),
         userNotifications: computed(() => settingsStore.user.userEmailNotifications),
         savedEvents: computed(() => settingsStore.savedEvents),
         setRecommandations,
         setEmailNotifications,
         setCity,
         setRadius,
         disconnect,
         unshowAccount,
         unsaveEvent,
         
         cities,
         RoleEnum
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
      <p v-if="savedEvents.length === 0" class="font-medium text-md">Vous n'avez pas encore enregistré d'évènement</p>
      <div v-else class="w-full flex flex-col  items-center">
         <!-- TODO: router link -->
         <div class="w-full mb-2 relative" :key="event.event_id" v-for="event in savedEvents">
            <EventPreview 
               :event="event" 
               height="100%"
               width="100%"
            />
            <button @click="unsaveEvent(event)" class="unsave_event absolute top-2 right-2 h-[22px] aspect-square rounded-[3px] bg-purple flex items-center justify-center">
               <svg width="10" height="14" viewBox="0 0 12 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M3.14286 1C1.71429 1 1 1.83333 1 3.5V13.5858C1 14.4767 2.07714 14.9229 2.70711 14.2929L5.29289 11.7071C5.68342 11.3166 6.31658 11.3166 6.70711 11.7071L9.29289 14.2929C9.92286 14.9229 11 14.4767 11 13.5858V3.5C11 1.83333 10.2857 1 8.85714 1H6H3.14286Z" stroke="white" stroke-width="2"/>
               </svg>
            </button>
         </div>
      </div>
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
      v-if="user.roles.includes(RoleEnum.ADMIN)"  
      class="bg-purple w-full min-h-[42px] rounded shadow flex items-center justify-center text-white font-semibold text-base"
      @click="unshowAccount"
   >
      Accéder au dashboard
   </router-link>
</template>
