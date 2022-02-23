import { defineStore } from "pinia";

// Create a new store instance.
export const useSettingsStore = defineStore("settings", {
   state: () => {
      return {
         pannelVisible: false,
         user: null,
         notification: {
            show: false,
            code: 200,
            message: "",
         },
      }
   },
   actions: {
      togglePannel(payload: boolean) {
         this.pannelVisible = payload;
      },
      setNotification(payload: { show: boolean, code: number, message: string }) {
         this.notification = payload;
      },
      showNotification() {
         this.notification.show = true;
      },
      hideNotification() {
         this.notification.show = false;
      },

      sendNotification(payload: { code: number, message: string }, delay: number) {
         this.setNotification({
            show: true,
            code: payload.code,
            message: payload.message
         });
         setTimeout(() => {
            this.hideNotification();
         }, delay || 5_000);
      },
   },
   getters: {
      userConnected: (state) => state.user !== null,
   }
});