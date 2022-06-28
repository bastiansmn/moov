<script lang="ts">
import Event from '@/store/model/event';
import { defineComponent, onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import { useSettingsStore } from '@/store/settings';
import { Loader } from '@googlemaps/js-api-loader';
import clean from "@/utils/fetchCleaner";

const settingsStore = useSettingsStore();

const fetchEvent = (event_id: String, city_id: String) => {
   return new Promise<Event>(resolve => {
      fetch(clean(`/api/event/fetchEvent?event_id=${event_id}&city_id=${city_id}`))
            .then(res => {
               const status = res.status;
               if (status === 200) {
                  res.json().then(res => {
                     resolve(res);
                  })
               } else {
                  throw new Error();
               }
            }).catch(err => {
               console.error(err);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Impossible de récupérer l'événement"
               });
               resolve(null);
            })
   })
}

export default defineComponent({
   props: {
      event: {
         type: String,
         required: false,
      }
   },
   async setup(props) {
      onMounted(async () => {
         await loader.load();
         // TODO Handle if latlon is not an array
         const coordinates = {
            lat: event.latlon.lat,
            lng: event.latlon.lng
         };
         
         if (coordinates.lat && coordinates.lng) {
            const map = new google.maps.Map(mapDiv.value, {
               center: coordinates,
               zoom: 15,
            });
            new google.maps.Marker({
               position: coordinates,
               title: event.title,
               map
            });
         }

         renderMap.value = !!coordinates.lat && !!coordinates.lng;
      });
      let event: Event;
      if (props.event) {
         event = JSON.parse(props.event);
      } else {
         const { event_id, city_id } = useRoute().query;
         const eventFromStore = 
            settingsStore?.events.find(e => e.event_id === event_id) 
            || settingsStore?.savedEvents.find(e => e.event_id === event_id);
         event = eventFromStore 
            ? eventFromStore 
            : await fetchEvent(<String> event_id, <String> city_id);
      }

      const loader = new Loader({ apiKey: import.meta.env.VITE_MAPS_API_KEY });
      const mapDiv = ref(null);
      const renderMap = ref(false);


      const parseTimings = () => {
         const timings = event.timing;

         if (!timings || timings === 'Non renseigné') return ['Non renseigné'];
         const dates = timings.split(";");
         const res = dates.map(date => {
            const [start, end] = date.split(" ");
            const res = {
               start: new Date(start).toLocaleString(),
               end: new Date(end).toLocaleString()
            };
            return `- Du ${res.start} au ${res.end}`;
         });
         return res;
      }

      const saveEvent = () => {
         settingsStore.saveEvent(event);
      }
      
      return {
         ...event,
         parseTimings,
         mapDiv,
         saveEvent,
         renderMap,
      }
   }
})
</script>

<template>
   <div class="w-full h-[42px] mb-5 flex items-center justify-between">
      <router-link to="/home" class="flex items-center">
         <div class="h-[30px] w-[30px] bg-purple rounded hover:rounded-sm flex items-center justify-center transition-[border-radius] mr-4">
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
         <h1 class="font-semibold">Retour à l'accueil</h1>
      </router-link>
      <button @click="saveEvent" class="rounded h-3/4 aspect-square bg-purple flex items-center justify-center">
         <svg width="10" height="14" viewBox="0 0 12 16" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M3.14286 1C1.71429 1 1 1.83333 1 3.5V13.5858C1 14.4767 2.07714 14.9229 2.70711 14.2929L5.29289 11.7071C5.68342 11.3166 6.31658 11.3166 6.70711 11.7071L9.29289 14.2929C9.92286 14.9229 11 14.4767 11 13.5858V3.5C11 1.83333 10.2857 1 8.85714 1H6H3.14286Z" stroke="white" stroke-width="2"/>
         </svg>
      </button>
   </div>
   <div class="event__content flex justify-between">
      <div class="left__event flex flex-col">
         <img :src="image" :alt="title" class="rounded-sm shadow mb-5 w-full aspect-video object-cover">
         <h1 class="font-semibold text-lg mb-5">Description</h1>
         <p class="event__description" v-html="description"></p>
      </div>
      <div class="right__event">
         <h1 class="font-semibold text-lg mb-4">{{ title }}</h1>
         <div class="tags flex items-center h-[32px] mb-4">
            <span class="h-full rounded-sm bg-dark-grey text-white flex items-center justify-center px-2 mr-1" :key="tag" v-for="tag in tags">{{ tag }}</span>
         </div>
         <a target="_blank" :href="url" class="text-purple font-semibold mb-4">{{ url }}</a>

         <div ref="mapDiv" v-show="renderMap" class="w-full aspect-video rounded-sm shadow border-2 border-purple my-4" />
         
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Lieu:</h1>
               <p class="text-sm">{{ placename }}</p>
            </div>
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Département:</h1>
               <p class="text-sm">{{ district }}</p>
            </div>
         </div>
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Occurences:</h1>
               <ul>
                  <li :key="time" v-for="time in parseTimings()" class="text-sm">
                     {{ time }}
                  </li>
               </ul>
            </div>
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Ville:</h1>
               <p class="text-sm">{{ city }}</p>
            </div>
         </div>
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Date de début:</h1>
               <p class="text-sm">{{ new Date(date_start).toLocaleDateString() }}</p>
            </div>
            <div class="w-[49%] h-full">
               <h1 class="font-semibold text-lg">Date de fin:</h1>
               <p class="text-sm">{{ new Date(date_end).toLocaleDateString() }}</p>
            </div>
         </div>
      </div>
   </div>
</template>

<style lang="scss" scoped>
.event__description {
   &:deep(p) {
      margin-bottom: 2px;
   }
   &:deep(a) {
      color: #7061E4;
   }
}

.left__event {
   width: 53%;
   min-width: 500px;
}

.right__event {
   width: 45%;
   max-width: calc(100% - 500px);
}
</style>
