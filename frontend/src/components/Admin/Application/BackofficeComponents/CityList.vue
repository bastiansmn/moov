<script setup>
import {useSettingsStore} from '@/store/settings';
import {ref} from "vue";

const settingsStore = useSettingsStore();
const cities = ref();
</script>

<template>
   <div class="p-5 w-[49%] bg-white rounded shadow">
      <h1 class="mb-4">Liste des villes</h1>
      <table>
         <thead>
            <tr>
               <th >Id</th>
               <th >Lien d'API</th>
               <th >Dataset</th>
               <th >Statut</th>
            </tr>
         </thead>
         <tbody>
            <tr v-for="city in cities" :key="city.id">
               <td>{{city.city_id}}</td>
               <td class="truncate"><a target="_blank" class="text-purple" :href="city.api_base_link">{{ city.api_base_link }}</a></td>
               <td>{{city.dataset_name}}</td>
               <td>{{city.is_active}}</td>
            </tr>
         </tbody>
      </table>
   </div>
</template>

<style lang="scss">

</style>
