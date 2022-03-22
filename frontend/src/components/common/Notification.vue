<script lang="ts">
import { defineComponent, computed } from 'vue';
import { useSettingsStore } from '@/store/settings';

export default defineComponent({
   setup() {
      const settingsStore = useSettingsStore();

      return {
         notificationVisible: computed(() => settingsStore.notification.show),
         notificationCode: computed(() => Math.floor(settingsStore.notification.code / 100) * 100),
         notificationMessage: computed(() => settingsStore.notification.message),
      }
   },
})
</script>

<template>
   <Transition>
      <div v-if="notificationVisible" :class="`code-${notificationCode}`" class="Notification fixed bottom-10 left-2/4 -translate-x-1/2 h-[42px] px-5 flex items-center justify-center rounded z-50 shadow">
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