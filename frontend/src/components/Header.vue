<script lang="ts">
import {defineComponent, ref} from "vue";
import {useSettingsStore} from "@/store/settings";

import Input from "@/components/common/Input.vue";
import Event from "@/store/model/event";
import router from "@/router/router";

export default defineComponent({
   name: "Header",
   components: {
      Input,
   },
   setup(_props) {
      const settingsStore = useSettingsStore();

      const searchContent = ref<Array<Event>>([]);

      const showAccount = () => {
         settingsStore.togglePannel(true);
      }

      const hideSearch = () => {
         searchContent.value = [];
      }

      const handleSearch = (value: string) => {
         // TODO Améliorer l'algorithme de recherche
         // regex for alphanumerics, spaces, dashes, special characters, french accents and numbers
         const regex = /[a-zA-Z\dàâäéèêëîïôöùûüçÀÂÄÉÈÊËÎÏÔÖÙÛÜÇ'\-\s]+/g;
         if (value.length === 0 || !value.match(regex)) {
            hideSearch();
            return;
         }
         // TODO: Appel récursive plus intéressante ??
         searchContent.value = settingsStore.searchAnything(value).slice(0, 10);
      }

      const showEvent = (event: Event) => {
         console.log(event)
         router.push({
            name: 'Event',
            query: {
               event_id: event.event_id,
               city_id: event.city_id
            },
            params: {
               event: JSON.stringify(event)
            }
         })
      }

      return {
         showAccount,
         handleSearch,
         searchContent,
         hideSearch,
         showEvent,
      }
   }
})
</script>

<template> 
   <header class="mt-[132px] sticky top-0 z-30">
      <div class="absolute bottom-0 overflow-hidden h-[220px] w-full bg-gradient-to-r from-[#7162E5] to-[#9566E4] flex flex-col items-center justify-center">
         <div class="navigation w-full h-[88px] fixed top-0 flex items-center justify-between px-5 z-[3]">
            <button @click="showAccount()" class="aspect-square mr-3 h-[42px] bg-white flex items-center justify-center rounded shadow-md">
               <svg width="18" height="18" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1 15C1 11.25 2.16667 10 8 10C13.8333 10 15 11.25 15 15" stroke="#7061E4" stroke-width="2" stroke-linecap="round"/>
                  <circle cx="8" cy="4" r="3" stroke="#7061E4" stroke-width="2"/>
               </svg>
            </button>
            <Input
               nav
               placeholder="Rechercher un évènement"
               class="relative"
               shadow
               :width="300"
               @change="handleSearch"
               @blur="hideSearch"
               @focus="handleSearch"
            >
               <button class="aspect-square absolute right-[6px] h-[30px] flex items-center justify-center bg-purple rounded-sm">
                  <svg width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <circle cx="7" cy="7" r="6" stroke="white" stroke-width="2"/>
                     <rect x="11.562" y="10.1478" width="8.04218" height="2" rx="1" transform="rotate(45 11.562 10.1478)" fill="white"/>
                  </svg>
               </button>
               <div v-if="searchContent.length > 0" class="searchContent absolute w-full bottom-0 translate-y-full bg-white rounded-sm">
                  <button
                     :key="event.event_id"
                     v-for="event in searchContent"
                     class="w-full h-[80px] hover:bg-white2 z-50 cursor-pointer flex p-2 rounded-sm"
                     @click="showEvent(event)"
                  >
                     <span class="image h-full aspect-square object-cover mr-2">
                        <img :src="event.image" :alt="event.title" class="h-full object-cover rounded-[4px]">
                     </span>
                     <span class="infos h-full font-semibold text-sm">
                        {{ event.title }}
                     </span>
                  </button>
               </div>
            </Input>
         </div>

         <svg class="absolute w-[105%] z-[1]" viewBox="0 0 1504 336" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M1 148.585C27.3602 99.6276 103.588 12.3248 192.264 1.71265C333.874 -15.2341 363.299 275.686 596.862 275.686C830.425 275.686 892.954 138.699 1082.38 138.699C1321.46 138.699 1323.3 335 1441 335" stroke="#8A6CDF" stroke-width="2"/>
            <circle cx="1417.5" cy="87.5" r="86.5" fill="#8A6CDF"/>
            <circle cx="56.5" cy="261.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="289.5" cy="115.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="289.5" cy="115.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="289.5" cy="115.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="876.5" cy="157.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="876.5" cy="157.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <circle cx="876.5" cy="157.5" r="9" stroke="#8A6CDF" stroke-width="3"/>
            <rect x="221" y="264.148" width="13" height="13" rx="3" transform="rotate(-14.0155 221 264.148)" fill="#8A6CDF"/>
            <rect x="657.73" y="104.679" width="13" height="13" rx="3" transform="rotate(18.1572 657.73 104.679)" fill="#8A6CDF"/>
            <rect x="468.69" y="192.026" width="10" height="10" rx="1.5" transform="rotate(27.796 468.69 192.026)" stroke="#8A6CDF" stroke-width="3"/>
            <rect x="134.69" y="119.026" width="10" height="10" rx="1.5" transform="rotate(27.796 134.69 119.026)" stroke="#8A6CDF" stroke-width="3"/>
            <rect x="870.782" y="286.789" width="10" height="10" rx="1.5" transform="rotate(-53.1995 870.782 286.789)" stroke="#8A6CDF" stroke-width="3"/>
            <rect x="1067.1" y="88.1069" width="10" height="10" rx="1.5" transform="rotate(-53.1995 1067.1 88.1069)" stroke="#8A6CDF" stroke-width="3"/>
         </svg>

         <router-link to="/home" class="text-white sticky top-0 font-bold font-sans z-[2] text-[25px]">MOOV</router-link>
      </div>
   </header>
</template>

<style scoped>
header {
   height: var(--header-height);
}
</style>
