import { defineStore } from "pinia";
import User, { Role } from "./model/user";
import Theme from "./model/theme";
import { codeIsOK } from "../utils/statusCodes";
import { useSettingsStore } from "./settings";
const settingsStore = useSettingsStore();

export const useBackofficeStore = defineStore("backoffice", {
   state: () => ({
      users: [] as Array<User>,
      roles: [] as Array<Role>,
      pendingThemes: [] as Array<Theme>,
      requests: [] as Array<Request>,
   }),
   actions: {
      fetchUsers() {
         return new Promise<Array<User>>(resolve => {
            const username = localStorage.getItem('username');
            const user_uuid = localStorage.getItem('user_uuid');
            const accessToken = localStorage.getItem('accessToken');
      
            if (!username || !user_uuid || !accessToken) {
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: 'Vous devez être connecté pour accéder à cette page.',
               });
               localStorage.clear();
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
               localStorage.clear();
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
               localStorage.clear();
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
      fetchPendingThemes() {
         return new Promise<Array<Theme>>((resolve) => {
            const user_uuid = localStorage.getItem('user_uuid');
            const accessToken = localStorage.getItem('accessToken');

            if (!user_uuid || !accessToken) {
               resolve([]);
               settingsStore.sendNotification({
                  code: 400,
                  message: "Impossible de récupérer les thèmes"
               });
               localStorage.clear();
               return;
            }

            fetch(`/api/theme/fetchPendingThemes?access_token=${accessToken}`)
               .then(response => {
                  const status = response.status;
                  if (codeIsOK(status)) {
                     response.json().then(response => {
                        resolve(response);
                     });
                  } else {
                     settingsStore.sendNotification({
                        code: status,
                        message: "Erreur dans la récupération des thèmes"
                     });
                     resolve([]);
                  }
               })
         });
      },
      async loadBackoffice() {
         // TODO: Vérifier si ceci ne créé pas de bugs
         if (this.backofficeLoaded) return;
         
         this.users = await this.fetchUsers();
         this.roles = await this.fetchRoles();
         this.requests = await this.fetchRequests();
         this.pendingThemes = await this.fetchPendingThemes();
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