<script lang="ts">
import { defineComponent, ref, computed } from 'vue';
import { useSettingsStore } from '@/store/settings';
import EventPreview from '@/components/common/EventPreview.vue';
import { FreeMode, Navigation } from 'swiper';
import { Swiper, SwiperSlide as Slide } from "swiper/vue";
import "swiper/css";
import "swiper/css/free-mode";
import "swiper/css/navigation";

export default defineComponent({
   components: {
      EventPreview,
      Swiper,
      Slide,
   },
   setup() {
      const settingsStore = useSettingsStore();
      const tags = ref<Array<String>>([]);
      
      const getTags = () => {
         fetch("/api/tags/getTags")
            .then(res => res.json())
            .then(res => {
               tags.value = res;
            })
            .catch(err => {
               console.error(err);
               tags.value = [];
            });
      };

      const filterEvents = ($event, tag) => {
         const getParentButton = (el: HTMLElement) => {
            let temp = el;
            while (!temp.tagName !== "BUTTON" && !temp.classList.contains("filterer")) {
               temp = temp.parentElement;
            }
            return temp;
         };
         const button = getParentButton($event.target);
         if (button.classList.contains("active")) {
            button.classList.remove("active");
            console.log(settingsStore.backups.themes);
            settingsStore.themes = settingsStore.backups.themes;
            settingsStore.events = settingsStore.backups.events;
         } else {
            button.classList.add("active");
            settingsStore.themes = settingsStore.backups.themes.map(theme => {
               return {
                  ...theme,
                  themed_events: theme.themed_events.filter(event => 
                     event.tags.includes(tag)
                  ),
               };
            })
            settingsStore.events = settingsStore.backups.events.filter(event => event.tags.includes(tag));
         }
      };

      const onSlideChange = (e) => {
         console.log("slide changed", e);
         
      }

      getTags();

      return {
         settingsStore,
         modules: [Navigation],
         tags,
         filterEvents,
         onSlideChange,

         events: computed(() => settingsStore.events),
         themes: computed(() => settingsStore.themes),
      };
   },
});
</script>

<template>
   <div class="category__filter overflow-x-hidden">
      <h1>Catégories</h1>
      <Swiper
         class="flex h-[90px] items-center"
         slidesPerView="auto"
         :spaceBetween="2"
         :freeMode="true"
      >
         <Slide 
            :key="tag" 
            v-for="tag in tags"
            style="width: unset"
            class="flex items-center"
         >
            <button class="filterer min-w-fit h-1/2 flex items-center mx-3 px-4 bg-white rounded-[999px]"  @click="filterEvents($event, tag)">
               <svg v-if="tag === 'Musique'" width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1 6.88235H2.25C3.1875 6.88235 3.5 7.35294 3.5 8.05882V9.82353C3.5 10.5294 3.1875 11 2.25 11C1.3125 11 1 10.7059 1 9.82353V6.88235ZM1 6.88235V5.11765C1 2.76471 2.68666 1 5.6875 1C8.8125 1 11 2.76471 11 5.11765V6.88235M11 6.88235V9.82353C11 10.7059 10.6875 11 9.75 11C8.8125 11 8.5 10.5294 8.5 9.82353C8.5 9.11765 8.5 8.35294 8.5 8.05882C8.5 7.34749 9 6.88235 9.75 6.88235C10.5 6.88235 10.8958 6.88235 11 6.88235Z" stroke="#7061E4" stroke-width="1.5"/>
               </svg>
               <svg v-else-if="tag === 'Lecture'" width="11" height="13" viewBox="0 0 11 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1 11C1 12 2.2 12 3.4 12H9C9.55229 12 10 11.5523 10 11V10M1 11C1 11 1 2.62556 1 2C0.999995 1.37444 1.42362 1 2.2 1C2.79335 1 7.03562 1 9.00284 1C9.55512 1 10 1.44772 10 2V10M1 11C1 10 2.2 10 3.4 10C4.6 10 10 10 10 10" stroke="#7061E4" stroke-width="1.5"/>
               </svg>
               <svg v-else-if="tag === 'Plein-air'" width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <circle cx="8.48529" cy="8.48529" r="3" stroke="#7061E4" stroke-width="1.2"/>
                  <path d="M8.48529 3.48529V2.48529M13.4853 8.48529H14.4853M8.48529 13.4853V14.4853M3.48529 8.48529H2.48529" stroke="#7061E4" stroke-width="1.5" stroke-linecap="round"/>
                  <path d="M12.0208 4.94975L12.7279 4.24264M12.0208 12.0208L12.7279 12.7279M4.94976 12.0208L4.24265 12.7279M4.94976 4.94975L4.24265 4.24264" stroke="#7061E4" stroke-width="1.5" stroke-linecap="round"/>
               </svg>
               <svg v-else-if="tag === 'Cinéma'" width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M3.80376 3.65825L2 4.5L3 6.5L3.80376 6.12491L5.48558 5.34006M3.80376 3.65825L5.48558 5.34006M3.80376 3.65825L5.48558 2.8734M5.48558 5.34006L7.1674 4.55522M5.48558 2.8734L7.1674 4.55522M5.48558 2.8734L7.1674 2.08855M7.1674 4.55522L8.84921 3.77037M7.1674 2.08855L8.84921 3.77037M7.1674 2.08855L8.84921 1.3037L9.5 1L10.5 3L8.84921 3.77037M3 9.5C3 10.5 4 11.5 5 11.5H10C11 11.5 12 10.5 12 9.5C12 9.5 12 8.25663 12 7.5C12 6.74337 11.7675 6.5 11 6.5C10.2325 6.5 4.8 6.5 4 6.5C3 6.5 3 6.5 3 7.5V9.5Z" stroke="#7061E4" stroke-width="1.5" stroke-linecap="round"/>
               </svg>
               <svg v-else-if="tag === 'Exposition'" width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M1 11.1053V2.89474C1 1.63158 1.76471 1 3.29412 1H11.7059C13.2353 1 14 1.63158 14 2.89474V11.1053C14 12.3684 13.2353 13 11.7059 13H3.29412C1.76471 13 1 12.3684 1 11.1053Z" stroke="#7061E4" stroke-width="1.5"/>
                  <path d="M1 8.2C1.38179 7.66667 2.52717 6.6 4.81792 6.6C7.10866 6.6 8.12677 7.4 9.01762 8.2C9.52668 8.73333 10.163 9.8 12.4537 9.8C13.5991 9.8 14.1082 9.26667 13.9809 9" stroke="#7061E4" stroke-width="1.5"/>
                  <path d="M11.875 4.6C11.875 5.42115 11.1968 6.1 10.3438 6.1C9.49073 6.1 8.8125 5.42115 8.8125 4.6C8.8125 3.77885 9.49073 3.1 10.3438 3.1C11.1968 3.1 11.875 3.77885 11.875 4.6Z" stroke="#7061E4"/>
               </svg>
               <svg v-else-if="tag === 'Enfants'" width="15" height="15" viewBox="0 0 15 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <rect x="0.75" y="0.75" width="13.5" height="13.5" rx="2.25" stroke="#7061E4" stroke-width="1.5"/>
                  <circle cx="7.5" cy="7.5" r="1.5" fill="#7061E4"/>
                  <circle cx="4.5" cy="10.5" r="1.5" fill="#7061E4"/>
                  <circle cx="10.5" cy="4.5" r="1.5" fill="#7061E4"/>
               </svg>
               <svg v-else-if="tag === 'Spectacle'" width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5 12V14M3 14H7" stroke="#7061E4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
                  <path d="M0.675676 7C0.30251 7 -0.00470181 7.3039 0.0455697 7.67366C0.192036 8.75098 0.687019 9.75809 1.46447 10.5355C2.40215 11.4732 3.67392 12 5 12C6.32608 12 7.59785 11.4732 8.53553 10.5355C9.31298 9.75809 9.80796 8.75098 9.95443 7.67367C10.0047 7.3039 9.69749 7 9.32432 7V7C8.95116 7 8.65499 7.30507 8.58627 7.67185C8.45179 8.38969 8.10372 9.05625 7.57998 9.57998C6.89573 10.2642 5.96768 10.6486 5 10.6486C4.03232 10.6486 3.10427 10.2642 2.42002 9.57998C1.89628 9.05625 1.54821 8.38969 1.41373 7.67185C1.34501 7.30507 1.04884 7 0.675676 7V7Z" fill="#7061E4"/>
                  <rect x="2.75" y="0.75" width="4.5" height="8.5" rx="2.25" stroke="#7061E4" stroke-width="1.5"/>
               </svg>
               <h1 v-else-if="tag==='Humour'">😂</h1>
               
               <h1 class="ml-2">{{ tag }}</h1>
            </button>
         </Slide>
      </Swiper>
   </div>
   <!-- TODO: Catégories d'évènements -->
   <div :key="th.theme_id" class="category" v-for="th in themes">
      <h1 class="font-medium">{{ th.name }}</h1>
      <Swiper 
         class="events h-[220px] w-full overflow-x-auto py-3"
         slidesPerView="auto"
         :spaceBetween="10"
         navigation
         :freeMode="true"
         :modules="modules"
         style="overflow: hidden;"
      >
         <Slide style="width: unset" :key="`event-${event.event_id}`" v-for="event in th.themed_events">
            <EventPreview
               :event="event"
            />
         </Slide>
      </Swiper>
   </div>
   <div class="category">
      <h1 class="font-medium">Evènements</h1>
      <Swiper 
         class="events h-[220px] w-full overflow-x-auto py-3"
         slidesPerView="auto"
         :spaceBetween="10"
         navigation
         :freeMode="true"
         :modules="modules"
         style="overflow: hidden;"
      >
         <Slide style="width: unset" :key="`event-${event.event_id}`" v-for="event in events">
            <EventPreview
               :event="event"
            />
         </Slide>
      </Swiper>
   </div>
</template>

<style lang="scss" scoped>
.filterer {
   box-shadow: 0px 2px 8px -3px rgba(0, 0, 0, 0.25);
   --timing: .2s;
   transition: background var(--timing) ease-in-out;
   
   & > h1 {
      transition: color var(--timing) ease-in-out;
   }

   & > svg * {
      transition: stroke var(--timing) ease-in-out;
   }

   &:hover, &.active {
      background: #7061E4;

      & > h1 {
         color: #FFFFFF;
      }

      & > svg * {
         stroke: #FFFFFF;
      }
   }
}
</style>