<script lang="ts">
import { defineComponent, ref } from 'vue'

// Dialogs
import UserModify from "./Dialogs/UserModify.vue"
import MailSender from "./Dialogs/MailSender.vue"
import CreateUser from "./Dialogs/CreateUser.vue"
import PendingEvents from "./Dialogs/PendingEvents.vue"
// Components
import CitySubmit from "./BackofficeComponents/CitySubmit.vue"
import UsersList from "./BackofficeComponents/UsersList.vue"
import PopUpTrigger from "./BackofficeComponents/PopUpTrigger.vue"
import UserStatChart from "./BackofficeComponents/UserStatChart.vue"
import RequestStatChart from "./BackofficeComponents/RequestStatChart.vue"

import { useBackofficeStore } from '@/store/backoffice'
import { codeIsOK } from '@/utils/statusCodes'

const backofficeStore = useBackofficeStore();

export default defineComponent({
   components: {
      // Dialogs:
      UserModify,
      MailSender,
      CreateUser,
      PendingEvents,

      // BackofficeComponents:
      CitySubmit,
      UsersList,
      PopUpTrigger,
      UserStatChart,
      RequestStatChart,
   },
   async setup() {
      // TODO: handle le select d'un user et changer les stats
      await backofficeStore.loadBackoffice();

      const popUpEnabled = ref<boolean>(false);
      const currentPopUp = ref<string>("");

      const selectedUser = ref<User>({} as User);

      const selectUser = (target, user) => {
         const modifyButton = document.querySelector(".modify");
         const classList = target.parentElement.classList;
         if (classList.contains("active")) {
            document.querySelectorAll(".user").forEach(e => e.classList.remove("active"));
            selectedUser.value = undefined;
            modifyButton.classList.remove("active");
            classList.remove("active");
         } else {
            document.querySelectorAll(".user").forEach(e => e.classList.remove("active"));
            selectedUser.value = user;
            modifyButton.classList.add("active");
            classList.add("active");
         }
      }

      const showPopUp = (popUp) => {
         popUpEnabled.value = true;
         currentPopUp.value = popUp;
      }

      const unShowPopUp = ($event) => {
         if (!$event) {
            popUpEnabled.value = false;
            return;
         }
         if ($event.target.classList.contains("popUpBackground")) {
            popUpEnabled.value = false;
         }
      }

      return {
         // Users related: 
         selectUser,
         selectedUser,

         // Pop-up related: 
         popUpEnabled,
         showPopUp,
         unShowPopUp,
         currentPopUp,
      }
   },
})
</script>

<template>
   <div class="application__content h-full max-w-[1500px]">
      <div class="h-[70vh] flex justify-between mb-6">
         <UsersList 
            @showPopUp="showPopUp"
            @selectUser="selectUser"
         />

         <div class="settings h-full w-[49%] flex flex-col justify-between">
            <div class="boxes w-full h-[100px] flex justify-between">
               <PopUpTrigger 
                  popUpName="email"
                  buttonTitle="Envoyer un email"
                  image="/assets/email.png"
                  alt="Email"
                  @showPopUp="showPopUp"
               />
               <PopUpTrigger 
                  popUpName="userCreate"
                  buttonTitle="Créer un utilisateur"
                  image="/assets/plus.png"
                  alt="Créer utilisateur"
                  @showPopUp="showPopUp"
               />
               <PopUpTrigger 
                  popUpName="events"
                  buttonTitle="Thèmes d'évènements"
                  image="/assets/folder.png"
                  alt="Thèmes"
                  @showPopUp="showPopUp"
               />
            </div>
            <div class="w-full h-[calc(100%-110px)] flex flex-col justify-between">
               <UserStatChart />
               <RequestStatChart />
            </div>
         </div>
      </div>
      <div>
         <CitySubmit
            @selectUser="selectedUser"
          />
         <!-- TODO : Ajouter une liste des villes existantes (avec lien vers api) + stats de moyenne d'âge + ville plus utilisée -->
      </div>
   </div>

   <Transition
      mode="out-in"
      name="fade"
   >
      <div v-if="popUpEnabled" @click="unShowPopUp" class="popUpBackground fixed inset-0 popUp h-full w-full bg-glass-black flex items-center justify-center z-50">
         <UserModify :selectedUser="selectedUser" @close="unShowPopUp()" v-if="currentPopUp === 'userModify'" />
         <MailSender @close="unShowPopUp()" v-else-if="currentPopUp === 'email'" />
         <CreateUser @close="unShowPopUp()" v-else-if="currentPopUp === 'userCreate'" />
         <PendingEvents @close="unShowPopUp()" v-else-if="currentPopUp === 'events'" />
      </div>
   </Transition>
</template>

<style lang="scss" scoped>
.fade-enter-from,
.fade-leave-to {
   opacity: 0;
}

.fade-move,
.fade-enter-active,
.fade-leave-active {
   transition: opacity .2s ease-in-out;
}
</style>