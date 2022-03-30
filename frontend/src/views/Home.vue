<script lang="ts">
import { defineComponent } from 'vue'
import { useSettingsStore } from '@/store/settings'
import EventPreview from '@/components/common/EventPreview.vue'

export default defineComponent({
   components: {
      EventPreview,
   },
   setup() {
      const settingsStore = useSettingsStore()

      return {
         settingsStore,
      }
   },
})
</script>

<template>
   <div class="category p-6" v-for="i in [0,1,2,3,4,5,6,7,8,9]">
      <h1>Evènements</h1>
      <div class="events h-[220px] flex overflow-x-auto py-3">
         <EventPreview
            v-for="event in settingsStore.getEvents.slice(i*10, (i+1)*10)"
            :key="event.id"
            :image="event.image"
            :title="event.title"
            :date="new Date(event.date_start)"
            :placename="event.placename"
         />
      </div>
   </div>
</template>
