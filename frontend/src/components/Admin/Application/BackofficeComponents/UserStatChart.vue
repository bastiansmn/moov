<script lang="ts">
import { defineComponent, computed, ref } from 'vue'

import { useBackofficeStore } from '@/store/backoffice'
import User from '@/store/model/user'

import { BarChart, useBarChart } from "vue-chart-3";
import { Chart, ChartData, ChartOptions, registerables } from "chart.js";
Chart.register(...registerables);

export default defineComponent({
   components: {
      BarChart,
   },
   setup() {

      const backofficeStore = useBackofficeStore();

      const users = ref<Array<User>>(backofficeStore.users);

      const userStatsData = computed<ChartData<"bar">>(() => ({
         labels: ["Rien", "Recomm.", "Email", "Tout"],
         datasets: [{
            data: [
               users.value.filter(user => !user.userEmailNotifications && !user.userRecommandations).length, 
               users.value.filter(user => user.userRecommandations && !user.userEmailNotifications).length,
               users.value.filter(user => user.userEmailNotifications && !user.userRecommandations).length,
               users.value.filter(user => user.userEmailNotifications && user.userRecommandations).length, 
            ],
            backgroundColor: 'rgb(112, 97, 228)',
            hoverBackgroundColor: 'rgb(149, 101, 227)',
            borderRadius: 8
         }]
      }));

      const userStatsChart = useBarChart({
         chartData: userStatsData,
         options: {
            plugins: {
               title: {
                  display: true,
                  text: "Utilisateurs abonnés aux email et/ou ayant les recommandations"
               },
               legend: {
                  display: false
               }
            }
         }
      });
      const userBarChartProps = userStatsChart.barChartProps;

      return {
         userBarChartProps,
      }
   },
})
</script>

<template>
   <div class="stats w-full h-[49%] bg-white rounded shadow p-4">
      <BarChart class="opacity__animation h-full" v-bind="userBarChartProps" />
   </div>
</template>