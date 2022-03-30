import { useSettingsStore } from '@/store/settings';
import { RouteRecordRaw, createRouter, createWebHashHistory } from 'vue-router';
import Home from '../views/Home.vue'
import User, { RoleEnum } from '@/store/model/user';
import { codeIsOK } from '@/utils/statusCodes';

const routes: Array<RouteRecordRaw> = [
   {
      path: '/',
      redirect: '/home',
   },
   {
      path: '/home',
      name: 'Home',
      component: Home,
   },
   {
      path: '/admin',
      name: "Admin",
      component: () => import('../views/Admin.vue'),
      meta: {
         requiresLog: true,
         requiresAdminOrModerator: true,
      },
      children: [
         {
            path: '/admin',
            redirect: '/admin/application',
         },
         {
            path: 'application',
            name: 'Application',
            component: () => import('../components/Admin/Application/Application.vue'),
         },
         {
            path: 'catalog',
            name: 'Catalog',
            component: () => import('../components/Admin/Catalog.vue'),
         },
         {
            path: 'themes',
            name: 'Themes',
            component: () => import('../components/Admin/Themes.vue'),
         }
      ]
   }
];

const router = createRouter({
   history: createWebHashHistory(),
   routes
});

router.beforeEach(async (to, _from, next) => {
   const settingsStore = useSettingsStore();

   const user_uuid = localStorage.getItem('user_uuid');
   const accessToken = localStorage.getItem('accessToken');
   const username = localStorage.getItem('username');

   if (!user_uuid || !accessToken || !username) {
      localStorage.clear();
      if (to.meta.requiresLog) {
         next({ name: "Home" });
         return;
      } else {
         next();
         return;
      }
   }

   // Si le user n'est pas déjà connecté (arrivée sur le site ou reconnexion)
   if (!settingsStore.userConnected) {
      await fetch(`/api/user/getUserByUUID?user_uuid=${user_uuid}`, {
         method: "GET",
         headers: new Headers({
           "Content-Type": "application/json",
           "x-access-token": accessToken,
         }),
      }).then(async response => {
         if (codeIsOK(response.status)) {
            await response.json().then((data: User) => {
               settingsStore.connectUser(data);
            });
         } else {
            throw new Error();
         }
      }).catch(err => {  
         console.error(err);
         settingsStore.sendNotification({
            code: 400,
            message: "Connexion automatique impossible",
         });
      });
   }
   if (settingsStore.events.length === 0)
      await settingsStore.fetchEvents(true);

   
   if (to.matched.some(record => record.meta.requiresLog)) { // If route need log
      if (!settingsStore.userConnected) {         
         settingsStore.sendNotification({
            code: 400,
            message: "Vous n'êtes pas connecté"
         });
         next({ name: "Home" });
         return;
      }
   }   

   if (to.matched.some(record => record.meta.requiresAdminOrModerator)) { // If route need admin or moderator      
      if (!settingsStore.user.roles.includes(RoleEnum.ADMIN) && !settingsStore.user.roles.includes(RoleEnum.MODERATOR)) {
         settingsStore.sendNotification({
            code: 403,
            message: "Vous n'avez pas les droits nécessaires"
         });
         next({ name: "Home" });
         return;
      }
   }

   next();
});

export default router