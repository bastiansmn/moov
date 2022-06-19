<script lang="ts" setup>
import { codeIsOK } from "@/utils/statusCodes";
import { useSettingsStore } from '@/store/settings';

import Input from "@/components/common/Input.vue";
import clean from "@/utils/fetchCleaner";

const settingsStore = useSettingsStore();

const testApi = (payload) => {
   // TODO : migre le test api côté back (+ tester existence ...)
   fetch(`${payload.api_base_link}/?dataset=${payload.dataset_name}&rows=1`)
      .then(response => response.json())
      .then(response => {
         const data = response.records[0].fields;
         const { api_base_link, city_id, dataset_name, name, ...requiredFields } = payload;
         for (let key in requiredFields) {
            if (!data.hasOwnProperty(requiredFields[key])) {
               settingsStore.sendNotification({
                  code: 400,
                  message: `API incompatible pour Moov (champ ${requiredFields[key]} manquant ou éronné)`
               });
               return null;
            }
         }
         settingsStore.sendNotification({
            code: 200,
            message: "API compatible pour Moov. Pensez à cliquer sur Créer"
         });
      });
}

const submitCity = ($event) => {
   const payload = Object.fromEntries(
      Array.from<HTMLInputElement>($event.target.querySelectorAll("input:not([type=submit])"))
         .map(e => ([e.name, e.value]))
   );
   
   if (Object.values(payload).includes("")) {
      settingsStore.sendNotification({
         code: 400,
         message: "Veuillez remplir tous les champs"
      });
      return;
   }
   
   testApi(payload);
   if (!codeIsOK(settingsStore.notification.code)) return;
   if ($event.submitter.name === "submit_api") {
      fetch(clean("/api/cities/create"), {
         method: "POST",
         headers: {
            'Content-Type': 'application/json',
            'x-access-token': localStorage.getItem('accessToken')
         },
         body: JSON.stringify(payload)
      }).then(response => {
         const status = response.status;
         response.json().then(response => {
            if (codeIsOK(status)) {
               settingsStore.sendNotification({
                  code: status,
                  message: "Ville créée"
               });
            } else {
               settingsStore.sendNotification({
                  code: status,
                  message: response.message
               });
            }
         });
      }).catch(err => {
         console.error(err);
         settingsStore.sendNotification({
            code: 400,
            message: "Une erreur est survenue lors de la création de la ville"
         });
      });
   }
}
</script>


<template>
   <div class="p-5 w-[49%] bg-white rounded shadow">
      <h1 class="mb-4">Ajouter une ville</h1>
      <form @submit.prevent="submitCity" class="flex flex-col opacity__animation">
         <Input
            placeholder="Identifiant Moov (ex: paris, lyon, ...)"
            name="city_id"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom affiché (ex: Paris, Lyon, ...)"
            name="name"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Liens vers l'API (ex: https://site.fr/api/search/)"
            name="api_base_link"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du dataset"
            name="dataset_name"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ titre"
            name="title_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ description"
            name="description_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ image"
            name="image_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ URL"
            name="url_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ lieu"
            name="placename_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ répétitions"
            name="timing_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ date de début"
            name="date_start_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ date de fin"
            name="date_end_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ lattiude/longitude"
            name="latlon_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ ville"
            name="city_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ département"
            name="district_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-2"
            required
         />
         <Input
            placeholder="Nom du champ prix"
            name="pricing_field"
            :height="32"
            background="#F7F7F7" 
            :radius="8" 
            shadow
            class="mb-4"
            required
         />
         <div class="self-end w-1/3 flex justify-between opacity__animation">
            <input 
               type="submit"
               name="test_api" 
               value="Tester"
               class="w-[46%] p-1 bg-white2 rounded shadow cursor-pointer"
            >
            <input 
               type="submit" 
               name="submit_api" 
               value="Créer"
               class="w-[46%] p-1 bg-purple rounded shadow text-white cursor-pointer"
            >
         </div>
      </form>
   </div>
</template>