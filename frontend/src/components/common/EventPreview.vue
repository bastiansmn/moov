<script lang="ts" setup>
import Event from "@/store/model/event";
import Category from "./Category.vue";

const props = defineProps<{
   event: Event,
   height?: string,
   width?: string,
}>();

const shortenMonth = {
   0: "Jan",
   1: "Fév",
   2: "Mar",
   3: "Avr",
   4: "Mai",
   5: "Jun",
   6: "Jul",
   7: "Aoû",
   8: "Sep",
   9: "Oct",
   10: "Nov",
   11: "Déc"
}
</script>

<template>
   <!-- TODO: Router link vers évènement -->
   <div class="rounded shadow bg-white overflow-clip" :style="`height: ${props.height || '100%'}; width: ${props.width || '190px'}`">
      <div class="image__container relative w-full h-2/3">
         <div class="absolute top-2 left-2 flex items-center justify-center p-1">
            <Category :cats="props.event.tags" />
         </div>
         <img class="image w-full h-full" :src="props.event.image" alt="Image impossible à charger" />
         <div class="date absolute bottom-2 left-2 w-[32px] aspect-square rounded-[4px] bg-white flex flex-col items-center justify-center p-1">
            <span class="text-xs font-semibold text-dark-grey h-[12px] flex items-center">{{ new Date(props.event.date_start).getDate() }}</span>
            <span class="text-xs font-semibold text-dark-grey h-[12px] flex items-center">{{ shortenMonth[new Date(props.event.date_start).getMonth()] }}</span>
         </div>
      </div>
      <div class="infos__container w-full h-1/3 p-2">
         <h1 class="w-full text-black text-sm font-semibold h-1/2 ">{{ props.event.title }}</h1>
         <div class="placename w-full h-1/2 flex items-center justify-between">
            <svg class="aspect-square h-[15px]" viewBox="0 0 10 13" fill="none" xmlns="http://www.w3.org/2000/svg">
               <path d="M1 5.23077C1 7.53017 3.34433 10.2153 4.63531 11.609C4.83193 11.8213 5.16807 11.8213 5.36469 11.609C6.65567 10.2153 9 7.53017 9 5.23077C9 2.41026 7.57143 1 5 1C2.42857 1 1 2.5197 1 5.23077Z" stroke="#7061E4" stroke-width="1.5"/>
               <circle cx="5" cy="5" r="1.75" stroke="#7061E4" stroke-width="1.5"/>
            </svg>
            <span class="text-sm h-full">{{ props.event.placename }}</span>
         </div>
      </div>
   </div>
</template>

<style lang="scss" scoped>
.placename {
   & > span {
      width: calc(100% - 20px);
   }
}

h1, span {
   line-clamp: 1;
   -webkit-line-clamp: 1;
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}
</style>
