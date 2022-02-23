<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useSettingsStore } from '@/store/settings';

export default defineComponent({
   setup() {
      const settingsStore = useSettingsStore();

      return {
         notificationVisible: computed(() => settingsStore.notification.show),
         notificationType: computed(() => {
            if (settingsStore.notification.code >= 200 && settingsStore.notification.code < 300) {
               return 'bg-success';
            } else if (settingsStore.notification.code >= 300 && settingsStore.notification.code < 400) {
               return 'bg-server-error';
            } else if (settingsStore.notification.code >= 400 && settingsStore.notification.code < 500) {
               return 'bg-error';
            } else {
               return 'bg-info';
            }
         }),
         notificationMessage: computed(() => settingsStore.notification.message),
      }
   },
})
</script>

<template>
   <Transition>
      <div v-if="notificationVisible" :class="notificationType" class="Notification fixed bottom-10 left-2/4 -translate-x-1/2 h-[42px] px-5 flex items-center justify-center rounded z-50 shadow">
         <span class="text-white font-bold text-lg">{{ notificationMessage }}</span>
      </div>
  </Transition>
</template>

<style scoped>
.v-enter-active,
.v-leave-active {
   transition: all 0.5s ease;
}

.v-enter-from,
.v-leave-to {
   opacity: 0;
   bottom: -100px;
}
</style>