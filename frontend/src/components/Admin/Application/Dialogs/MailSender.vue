<script lang="ts">
import {defineComponent} from 'vue'
import {codeIsOK} from "@/utils/statusCodes"
import {useSettingsStore} from '@/store/settings'

export default defineComponent({
   setup(_props, { emit }) {

      const settingsStore = useSettingsStore();

      const sendMail = ($event) => {
         const mailSubject = $event.target.querySelector("input[name=mailSubject]").value;
         const mailContent = $event.target.querySelector("textarea[name=mailContent]").value;
         const user_uuid = localStorage.getItem('user_uuid');
         const accessToken = localStorage.getItem('accessToken');

         if (!user_uuid || !accessToken) {
            settingsStore.sendNotification({
               code: 400,
               message: "Impossible d'envoyer le mail"
            });
            return;
         }

         fetch("/api/mail/send", {
            method: "POST",
            headers: {
               'Content-Type': 'application/json',
               'x-access-token': accessToken
            },
            body: JSON.stringify({
               user_uuid,
               mailSubject,
               mailContent
            })
         }).then(response => {
            const status = response.status;
            
            response.json().then(response => {
               if (codeIsOK(status)) {
                  settingsStore.sendNotification({
                     code: status,
                     message: response.message
                  });
               } else {
                  settingsStore.sendNotification({
                     code: status,
                     message: response.message
                  });
               }
               emit("close");
            })
         }).catch(err => {
            console.error(err);
            settingsStore.sendNotification({
               code: 400,
               message: "Une erreur est survenue lors de l'envoi du mail"
            });
            emit("close");
         });
      }

      return {
         sendMail,
      }
   },
})
</script>

<template>
   <div class="w-[400px] bg-white rounded p-6 flex flex-col items-center">
      <h1 class="font-semibold">Envoyer un email à tous les utilisateurs</h1>
      <form @submit.prevent="sendMail" class="w-full flex flex-col items-center">
         <div class="w-full mb-2">
            <h1 class="font-semibold">Sujet :</h1>
            <input name="mailSubject" type="text" autocomplete="off" required class="w-full bg-white2 rounded p-2">
         </div>
         <div class="w-full mb-2">
            <h1 class="font-semibold">Message :</h1>
            <textarea name="mailContent" required autocomplete="off" class="w-full min-h-[200px] bg-white2 rounded p-2 text-sm resize-none"></textarea>
         </div>
         <input type="submit" value="Envoyer" class="bg-purple text-white rounded-[4px] px-4 py-1 mt-5 cursor-pointer">
      </form>
   </div>
</template>
