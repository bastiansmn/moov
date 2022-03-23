import { defineStore } from "pinia";
import User from "./model/user";
import { useSettingsStore } from "./settings";
const settingsStore = useSettingsStore();

interface UserWithNotifications extends User {
   recommandationsEnabled: boolean;
   emailNotificationEnabled: boolean;
}

interface Role {
   name: String;
   role_id: Number
}

export const useBackofficeStore = defineStore("backoffice", {
   state: () => ({
      users: [] as Array<UserWithNotifications>,
      roles: [] as Array<Role>,
      requests: [] as Array<Request>,
   }),
   actions: {
      fetchUsers() {
         return new Promise<Array<UserWithNotifications>>(resolve => {
            const username = localStorage.getItem('username');
            const user_uuid = localStorage.getItem('user_uuid');
            const accessToken = localStorage.getItem('accessToken');
      
            if (!username || !user_uuid || !accessToken) {
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: 'Vous devez être connecté pour accéder à cette page.',
               });
               return;
            }
      
            fetch("/api/user/getUsers", {
               method: 'GET',
               headers: {
                  'Content-Type': 'application/json',
                  'x-access-token': accessToken
               }
            }).then(
               response => response.json()   
            ).then(response => {
               resolve(response);
            }).catch(error => {
               console.error(error);
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: 'Une erreur est survenue lors de la récupération des utilisateurs.',
               });
            });
         });
      },
      fetchRoles() {
         return new Promise<Array<Role>>(resolve => {
            const user_uuid = localStorage.getItem('user_uuid');
            const accessToken = localStorage.getItem('accessToken');
      
            if (!user_uuid || !accessToken) {
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Impossible de récupérer les rôles"
               });
               return;
            }
      
            fetch("/api/role/getAllRoles", {
               method: "GET",
               headers: {
                  'Content-Type': 'application/json',
                  'x-access-token': accessToken
               }
            }).then(response => 
               response.json()
            ).then(response => 
               resolve(response)
            ).catch(err => {
               console.error(err);
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Erreur dans la récupération des rôles"
               });
            })
         });
      },
      fetchRequests() {
         return new Promise<Array<Request>>((resolve) => {
            const user_uuid = localStorage.getItem('user_uuid');
            const accessToken = localStorage.getItem('accessToken');
      
            if (!user_uuid || !accessToken) {
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Impossible de récupérer les demandes"
               });
               return;
            }
      
            fetch(`/api/request/getAllRequests`, {
               method: "GET",
               headers: {
                  'Content-Type': 'application/json',
                  'x-access-token': accessToken
               }
            }).then(response => 
               response.json()
            ).then(response => 
               resolve(response)
            ).catch(err => {
               console.error(err);
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Erreur dans la récupération des demandes"
               });
            });
         })
      },

      async loadBackoffice() {
         // TODO: Vérifier si ceci ne créé pas de bugs
         if (this.backofficeLoaded) return;

         const users = await this.fetchUsers();
         const roles = await this.fetchRoles();
         const requests = await this.fetchRequests();
         
         this.users = users;
         this.roles = roles;
         this.requests = requests;
      }
   },
   getters: {
      getUsers: (state) => state.users,
      getRoles: (state) => state.roles,
      getRequests: (state) => state.requests,
      backofficeLoaded: (state) => {
         return state.users.length !== 0 && state.roles.length !== 0 && state.requests.length !== 0;
      }
   },
});