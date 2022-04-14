<script lang="ts">
import Event from '@/router/model/event';
import { defineComponent, onMounted, ref } from 'vue';
import { useRoute } from 'vue-router'
import { useSettingsStore } from '@/store/settings';
import { Loader } from '@googlemaps/js-api-loader';

const settingsStore = useSettingsStore();

const fetchEvent = (event_id, city_id) => {
   return new Promise<Event>(resolve => {
      fetch(`/api/event/fetchEvent?event_id=${event_id}&city_id=${city_id}`)
            .then(res => {
               const status = res.status;
               if (status === 200) {
                  res.json().then(res => {
                     resolve(res);
                  })
               } else {
                  throw new Error();
                  resolve(null);
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
      let event;
      if (props.event) {
         event = JSON.parse(props.event);
      } else {
         const { event_id, city_id } = useRoute().query;
         const eventFromStore = 
            settingsStore.events.find(e => e.event_id === event_id) 
            || settingsStore.savedEvents.find(e => e.event_id === event_id);
         event = eventFromStore 
            ? eventFromStore 
            : await fetchEvent(event_id, city_id);
      }

      const loader = new Loader({ apiKey: import.meta.env.VITE_MAPS_API_KEY });
      const mapDiv = ref(null);
      onMounted(async () => {
         await loader.load();
         // TODO Handle if latlon is not an array
         const coordinates = {
            lat: event.latlon[0],
            lng: event.latlon[1]
         };
         const map = new google.maps.Map(mapDiv.value, {
            center: coordinates,
            zoom: 15,
         });
         new google.maps.Marker({
            position: coordinates,
            title: event.title,
            map
         })
      })

      const parseTimings = (timings) => {
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
      
      return {
         ...event,
         parseTimings,
         mapDiv
      }
   }
})
</script>

<template>
   <div class="w-full h-[42px] mb-5 flex items-center">
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
   </div>
   <div class="event__content flex justify-between">
      <div class="left__event flex flex-col">
         <img :src="image" :alt="title" class="rounded-sm shadow mb-5 w-full aspect-video">
         <h1 class="font-semibold text-lg mb-5">Description</h1>
         <p class="event__description" v-html="description"></p>
      </div>
      <div class="right__event">
         <h1 class="font-semibold text-lg mb-4">{{ title }}</h1>
         <a target="_blank" :href="url" class="text-purple font-semibold mb-4">{{ url }}</a>

         <div ref="mapDiv" class="w-full aspect-video rounded-sm shadow border-2 border-purple my-4" />
         
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
                  <li :key="time" v-for="time in parseTimings(timing)" class="text-sm">
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