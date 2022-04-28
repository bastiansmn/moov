import { defineStore } from "pinia";
import router from "@/router/router";
import User from "./model/user";
import Event from "./model/event";
import Theme from "./model/theme";

// Create a new store instance.
export const useSettingsStore = defineStore("settings", {
   state: () => ({
      pannelVisible: false,
      user: {} as User,
      accessToken: "",
      notification: {
         show: false,
         code: 200,
         message: "",
      },
      themes: [] as Array<Theme>,
      events: [] as Array<Event>,
      savedEvents: [] as Array<Event>,
      filter: [] as Array<string>,

      slidesPerLoad: 15,
   }),
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

      connectUser(user: User) {         
         this.user = user;

         // TODO : ne pas enregistrer le token dans le localStorage
         localStorage.setItem("accessToken", user.accessToken);
         localStorage.setItem("user_uuid", user.user_uuid);
         localStorage.setItem("username", user.username);

         this.sendNotification({ code: 200, message: "Vous êtes connecté" });
      },
      disconnectUser() {
         this.user = {} as User;

         localStorage.removeItem("accessToken");
         localStorage.removeItem("user_uuid");
         localStorage.removeItem("username");

         this.sendNotification({ code: 300, message: "Vous êtes déconnecté" });

         if (router.currentRoute.value.meta.requiresLog)
            router.push({ name: "Home" });
      },
      setUserRecommandations(val: boolean) {
         fetch("/api/user/setRecommandations", {
            method: "PUT",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               user_uuid: this.user.user_uuid,
               recommandationsVal: val,
            }),
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300)
                  this.user.userRecommandations = val;
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
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               user_uuid: this.user.user_uuid,
               notificationsVal: val,
            }),
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300)
                  this.user.userEmailNotifications = val;
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
      },
      setUserCity(val: string) {
         fetch("/api/user/setCity", {
            method: "PUT",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               city_id: val,
            })
         }).then(response => {
            const status = response.status;
            response.json().then(data => {
               if (status >= 200 && status < 300) {
                  this.user.city_id = val;
                  this.fetchEvents(true);
               }
               this.sendNotification({
                  code: status, 
                  message: data.message 
               });
            });
         }).catch(err => {
            console.error(err);
            this.sendNotification({
               code: 400,
               message: "Une erreur est survenue"
            });
         });
      },
      setUserRadius(val: string) {
         // Convert val to number
         const preferedRadius = parseInt(val.replace("km", "").trim());
         console.log(preferedRadius);
         
         fetch("/api/user/setPreferedRadius", {
            method: "PUT",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               user_uuid: this.user.user_uuid,
               preferedRadius,
            })
         }).then(response => {
            const status = response.status;
            response.json().then(data => {
               if (status >= 200 && status < 300)
                  this.user.preferedRadius = preferedRadius;
               this.sendNotification({
                  code: status, 
                  message: data.message 
               });
            });
         }).catch(err => {
            console.error(err);
            this.sendNotification({
               code: 400,
               message: "Une erreur est survenue"
            });
         });
      },
      fetchThemes(update=false) {
         return new Promise<Array<Theme>>(resolve => {
            fetch(`/api/theme/fetchThemes?city_id=${this.user.city_id ?? 'paris'}`)
               .then(res => {
                  const status = res.status;
                  res.json().then(data => {
                     if (status >= 200 && status < 300) {
                        if (update) {
                           if (this.filter.length > 0) {
                              data.filter((e: Theme) => {
                                 console.log(e);
                                 
                                 return e.themed_events.some((e: Event) => {
                                    return this.filter.some((filter: string) => {
                                       return e.tags.includes(filter);
                                    });
                                 });
                              }).forEach((e: Theme) => {
                                 this.themes.push(e);
                              });
                           } else {
                              data.forEach((e: Theme) => {
                                 this.themes.push(e);
                              });
                           }
                        };
                        resolve(data);
                     } else {
                        this.sendNotification({
                           code: status, 
                           message: data.message 
                        });
                        resolve([]);
                     }
                  });
               }).catch(err => {
                  console.error(err);
                  this.sendNotification({
                     code: 400,
                     message: "Une erreur est survenue"
                  });
                  resolve([]);
               });
         });
      },
      fetchEvents(update=false) {
         return new Promise<Array<Event>>(resolve => {
            fetch(`/api/cities/fetchData?city_id=${this.userConnected ? this.user.city_id : 'paris'}&rows=${this.slidesPerLoad}&start=${this.events.length}`)
               .then(response => {
                  if (response.status < 200 || response.status >= 300) {
                     this.sendNotification({
                        code: response.status,
                        message: "Une erreur est survenue"
                     });
                     resolve([]);
                  } else {
                     response.json().then(data => {
                        if (update) {
                           data.forEach((e: Event) => {
                              this.events.push(e);
                           });
                        }
                        resolve(data);
                     });
                  }
               })
               .catch(err => {
                  console.error(err);
                  resolve([]);
                  this.sendNotification({
                     code: 400,
                     message: "Une erreur est survenue"
                  });
               });
         })
      },
      fetchSavedEvents(update=false) {
         return new Promise<Array<Event>>(resolve => {
            fetch("/api/user/getSavedEvents", {
               method: "GET",
               headers: new Headers({
                  "Content-Type": "application/json",
                  "x-access-token": this.user.accessToken,
               }),
            })
               .then(res => res.json())
               .then(res => {
                  resolve(res);
                  if (update) this.savedEvents = res;
               });
         })
      },
      saveEvent(event: Event) {
         fetch("/api/user/saveEvent", {
            method: "POST",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               event_id: event.event_id,
               city_id: event.city_id
            }),
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300) {
                  this.sendNotification({
                     code: status, 
                     message: data.message 
                  });
                  this.fetchSavedEvents(true);
               }
            });
         });
      },
      unsaveEvent(event: Event) {
         fetch("/api/user/unsaveEvent", {
            method: "DELETE",
            headers: new Headers({
               "Content-Type": "application/json",
               "x-access-token": this.user.accessToken,
            }),
            body: JSON.stringify({
               event_id: event.event_id,
            })
         }).then(res => {
            const status = res.status;
            res.json().then(data => {
               if (status >= 200 && status < 300) {
                  this.sendNotification({
                     code: status, 
                     message: data.message 
                  });
                  this.savedEvents = this.savedEvents.filter(e => e.event_id !== event.event_id);
               }
            });
         }).catch(err => {
            console.error(err);
            this.sendNotification({
               code: 400,
               message: "Une erreur est survenue"
            });
         });
      },
   },
   getters: {
      userConnected: (state) => {
         return JSON.stringify(state.user) !== JSON.stringify({});
      },
      getEvents: (state) => {
         return state.events.filter((e: Event) => {
            if (state.filter.length > 0)
               return state.filter.some((filter: string) => {
                  return e.tags.includes(filter);
               });
            return true;
         });
      },
      getThemes: (state) => {
         return state.themes.map((e: Theme) => {
            const { themed_events, ...rest } = e;
            return {
               themed_events: themed_events.filter((e: Event) => {
                  if (state.filter.length > 0)
                     return state.filter.some((filter: string) => {
                        return e.tags.includes(filter);
                     });
                  return true;
               }),
               ...rest
            }
         });
      }
   }
});