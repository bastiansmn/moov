<script lang="ts">
import { defineComponent } from 'vue'
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
      Slide
   },
   setup() {
      const settingsStore = useSettingsStore()

      return {
         settingsStore,
         modules: [FreeMode, Navigation]
      }
   },
})
</script>

<template>
   <!-- TODO: Utiliser Swiper -->
   <div class="category p-6" v-for="i in 10">
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
         <Slide style="width: unset" :key="`event-${i}`" v-for="event in settingsStore.getEvents.slice((i-1)*10, i*10)">
            <EventPreview
               :image="event.image"
               :title="event.title"
               :date="new Date(event.date_start)"
               :placename="event.placename"
            />
         </Slide>
      </Swiper>
   </div>
</template>
