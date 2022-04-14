<script lang="ts">
import { defineComponent, ref } from 'vue'
import { useSettingsStore } from '@/store/settings'
import EventPreview from '@/components/common/EventPreview.vue'
import { FreeMode, Navigation } from 'swiper'
import { Swiper, SwiperSlide as Slide } from "swiper/vue"
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
      }

      const filterEvents = (tag) => {
         console.log("filtering", tag);
         // TODO
      }

      getTags();

      return {
         settingsStore,
         modules: [FreeMode, Navigation],
         tags,
         filterEvents
      }
   },
})
</script>

<template>
   <div class="category__filter">
      <h1>Catégories</h1>
      <div class="flex h-[90px] items-center">
         <button class="filterer h-1/2 flex items-center mx-3 px-4 bg-white rounded-[999px]" :key="tag" v-for="tag in tags" @click="filterEvents(tag)">
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



            <h1 class="ml-2">{{ tag }}</h1>
         </button>
      </div>
   </div>
   <div class="category" v-for="i in 10">
      <h1>Evènements</h1>
      <Swiper 
         class="events h-[220px] w-full overflow-x-auto py-3"
         slidesPerView="auto"
         :spaceBetween="10"
         navigation
         :freeMode="true"
         :modules="modules"
         style="overflow: hidden;"
      >
         <!-- TODO: Catégories d'évènements -->
         <Slide style="width: unset" :key="`event-${i}`" v-for="event in settingsStore.getEvents.slice((i-1)*10, i*10)">
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

   &:hover {
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