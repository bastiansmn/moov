<script lang="ts" setup>
import Header from '@/components/Header.vue';
import Account from '@/components/Account/Account.vue';
import Notification from '@/components/common/Notification.vue';
</script>

<template>
  <Header />

  <Account />

  <main class="w-full bg-white2">
    <router-view v-slot="{ Component }">
      <transition
        name="fade"
        mode="out-in"
      >
        <div key="app-router" class="w-full h-full p-6 pt-12 sm:pt-6">
          <component :is="Component" />
        </div>
      </transition>
    </router-view>
  </main>

  <Notification />
</template>

<style lang="scss" scoped>
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity .4s ease-out;
}

main {
  min-height: calc(100vh - var(--header-height));
}
</style>