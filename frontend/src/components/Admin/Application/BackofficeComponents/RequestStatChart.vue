<script lang="ts">
import { defineComponent, computed, ref } from 'vue'

import { useBackofficeStore } from '@/store/backoffice'
import Request from '@/store/model/request'

import { BarChart, useBarChart } from "vue-chart-3";
import { Chart, ChartData, ChartOptions, registerables } from "chart.js";

Chart.register(...registerables);

export default defineComponent({
   components: {
      BarChart,
   },
   setup() {

      const backofficeStore = useBackofficeStore();

      const requests = <Request[]><unknown> backofficeStore.getRequests;

      const requestStatsData = computed<ChartData<"bar">>(() => ({
         labels: ["Jour", "Semaine", "Mois", "Année"],
         datasets: [{
            data: [
               requests.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}-${reqDate.getDate()}` === `${today.getFullYear()}-${today.getMonth()}-${today.getDate()}`
               }).length,
               requests.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  // TODO: être plus précis sur le calcul de la semaine (actuellement on peut dépasser de qq jours)
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}` === `${today.getFullYear()}-${today.getMonth()}` && (reqDate.getDate() > (today.getDate() - 7) % 31);
               }).length,
               requests.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return `${reqDate.getFullYear()}-${reqDate.getMonth()}` === `${today.getFullYear()}-${today.getMonth()}`;
               }).length,
               requests.filter(e => {
                  const reqDate = new Date(e.date);
                  const today = new Date();
                  return reqDate.getFullYear() === today.getFullYear();
               }).length
            ],
            backgroundColor: 'rgb(112, 97, 228)',
            hoverBackgroundColor: 'rgb(149, 101, 227)',
            borderRadius: 8
         }]
      }));

      const requestStats = useBarChart({
         chartData: requestStatsData,
         options: {
            plugins: {
               title: {
                  display: true,
                  text: "Requêtes par période (jour/semaine/mois/année)"
               },
               legend: {
                  display: false
               }
            }
         }
      });
      const requestBarChartProps = requestStats.barChartProps;

      return {
         requestBarChartProps,
      }
   },
})
</script>

<template>
   <div class="stats w-full h-[49%] bg-white rounded shadow p-4">
      <BarChart class="opacity__animation" v-bind="requestBarChartProps" />
   </div>
</template>

<style scoped>
.stats > div {
   height: 100%;
}
</style>