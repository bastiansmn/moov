import { defineStore } from "pinia";
import router from "@/router/router";
import User from "./model/user";

// Create a new store instance.
export const useSettingsStore = defineStore("settings", {
   state: () => {
      return {
         pannelVisible: false,
         user: {} as User,
         userRecommandations: true,
         userEmailNotifications: false,
         accessToken: "",
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

      sendNotification(payload: { code: number, message: string }, delay?: number) {
         this.setNotification({
            show: true,
            code: payload.code,
            message: payload.message
         });
         setTimeout(() => {
            this.hideNotification();
         }, delay || 5_000);
      },

      connectUser(user: User, preferences: { userRecommandations: boolean, userEmailNotifications: boolean, accessToken: string }) {         
         this.user = user;
         this.userRecommandations = preferences.userRecommandations ?? true;
         this.userEmailNotifications = preferences.userEmailNotifications ?? false;
         this.accessToken = preferences.accessToken;

         // TODO : ne pas enregistrer le token dans le localStorage
         localStorage.setItem("accessToken", preferences.accessToken);
         localStorage.setItem("user_uuid", user.user_uuid);
         localStorage.setItem("username", user.username);

         this.sendNotification({ code: 200, message: "Vous êtes connecté" });
      },
      disconnectUser() {
         this.user = {} as User;
         this.userRecommandations = true;
         this.userEmailNotifications = false;
         this.accessToken = "";

         localStorage.removeItem("accessToken");
         localStorage.removeItem("user_uuid");
         localStorage.removeItem("username");

         this.sendNotification({ code: 400, message: "Vous êtes déconnecté" });

         if (router.currentRoute.value.meta.requiresLog)
            router.push({ name: "Home" });
      },
      setUserRecommandations(val: boolean) {
         fetch("/api/user/setRecommandations", {
            method: "PUT",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.accessToken,
            }),
            body: JSON.stringify({
               user_uuid: this.user.user_uuid,
               recommandationsVal: val,
            }),
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300)
                  this.userRecommandations = val;
               this.sendNotification({
                  code: status, 
                  message: data.message 
               });
            });
         });
      },
      enableUserRecommandations() {
         this.setUserRecommandations(true);
      },
      disableUserRecommandations() {
         this.setUserRecommandations(false);
      },
      setUserEmailNotifications(val: boolean) {
         fetch("/api/user/setNotifications", {
            method: "PUT",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.accessToken,
            }),
            body: JSON.stringify({
               user_uuid: this.user.user_uuid,
               notificationsVal: val,
            }),
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300)
                  this.userEmailNotifications = val;
               this.sendNotification({
                  code: status, 
                  message: data.message 
               });
            });
         });
      },
      enableUserEmailNotifications() {
         this.setUserEmailNotifications(true);
      },
      disableUserEmailNotifications() {
         this.setUserEmailNotifications(false);
      }
   },
   getters: {
      userConnected: (state) => {
         return JSON.stringify(state.user) !== JSON.stringify({});
      },
   }
});