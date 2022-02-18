<script lang="ts">
import { defineComponent, ref, computed } from "vue";
import { useSettingsStore } from "@/store/settings";

import Connection from "./Connection.vue";

export default defineComponent({
   name: "Account",
   components: {
      Connection,
   },
   setup(_props) {
      const settingsStore = useSettingsStore();

      const unshowAccount = () => {
         settingsStore.togglePannel(false);
      };

      return {
         unshowAccount,
         pannelVisible: computed(() => settingsStore.pannelVisible),
      };
   },
});
</script>

<template>
   <div
      :class="pannelVisible ? 'account active' : 'account'"
      @click="unshowAccount"
      class="fixed inset-0 w-[100vw] h-[100vh] bg-glass-black"
   ></div>
   <div
      :class="pannelVisible ? 'pannel active' : 'pannel'"
      class="fixed inset-0 bg-white2 h-full max-w-[400px] p-6 flex items-center flex-col-reverse"
   >
      <button @click="unshowAccount" class="close_pannel absolute top-6 right-6 w-[30px] aspect-square rounded hover:rounded-sm transition-[border-radius] bg-purple text-white2 font-bold text-md">
         X
      </button>

      <Connection />
   </div>
</template>

<style lang="scss" scoped>
.account {
   opacity: 0;
   pointer-events: none;
   transition: opacity 0.5s;
   
   &.active {
      opacity: 1;
      pointer-events: all;
      transition: opacity 0.2s;
   }
}

.pannel {
   transform: translate3d(-100%, 0, 0);
   transition: transform 0.2s;


   &.active {
      box-shadow: 1px 0px 5px 2px rgba(0, 0, 0, 0.25);
      transform: translate3d(0, 0, 0); 
      transition: transform 0.5s;
   }
}
</style>
