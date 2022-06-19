<script lang="ts">
import { defineComponent, computed } from 'vue'
import { useBackofficeStore } from '@/store/backoffice';
import { useSettingsStore } from '@/store/settings';

export default defineComponent({
   setup() {
      const backofficeStore = useBackofficeStore();
      const settingsStore = useSettingsStore();

      return {
         publicThemes: computed(() => settingsStore.getThemes),
         pendingThemes: computed(() => backofficeStore.getPendingThemes),
      }
   },
})
</script>

<template>
   <div class="w-[85vw] bg-white rounded p-6 flex flex-col">
      <div class="pending__events">
         <h1 class="font-semibold">Evènements en attente</h1>
         <div
            :key="theme.theme_id"
            v-for="theme in pendingThemes"
         >
            <h2>{{ theme.name }}</h2>
         </div>
      </div>
      <div class="public__events">
         <h1 class="font-semibold">Evènements publiés</h1>
         <div
            :key="theme.theme_id"
            v-for="theme in publicThemes"
         >
            <h2>{{ theme.name }}</h2>
         </div>
      </div>
   </div>
</template>
