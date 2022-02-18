import { defineStore } from "pinia";

// Create a new store instance.
export const useSettingsStore = defineStore("settings", {
   state: () => {
      return {
         pannelVisible: false,
         userConnected: false,
      }
   },
   actions: {
      togglePannel(payload: boolean) {
         this.pannelVisible = payload;
      }
   }
});