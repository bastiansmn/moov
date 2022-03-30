<script lang="ts" setup>
const props = defineProps<{
   image: string,
   title: string,
   date: Date,
   placename: string,
}>()

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
   <div class="min-w-[190px] h-full rounded shadow bg-white overflow-clip mr-3">
      <div class="image__container relative w-full h-2/3">
         <!-- TODO: Catégorie de l'évènement -->
         <img class="image w-full h-full" :src="props.image" />
         <div class="date absolute bottom-2 left-2 w-[32px] aspect-square rounded-[4px] bg-white flex flex-col items-center justify-center p-1">
            <span class="text-xs font-semibold text-dark-grey h-[12px] flex items-center">{{ props.date.getDate() }}</span>
            <span class="text-xs font-semibold text-dark-grey h-[12px] flex items-center">{{ shortenMonth[props.date.getMonth()] }}</span>
         </div>
      </div>
      <div class="infos__container w-full h-1/3 p-2">
         <h1 class="w-full text-black text-sm font-semibold h-1/2">{{ props.title }}</h1>
         <div class="placename w-full h-1/2 flex items-center justify-between">
            <svg class="aspect-square h-[15px]" viewBox="0 0 10 13" fill="none" xmlns="http://www.w3.org/2000/svg">
               <path d="M1 5.23077C1 7.53017 3.34433 10.2153 4.63531 11.609C4.83193 11.8213 5.16807 11.8213 5.36469 11.609C6.65567 10.2153 9 7.53017 9 5.23077C9 2.41026 7.57143 1 5 1C2.42857 1 1 2.5197 1 5.23077Z" stroke="#7061E4" stroke-width="1.5"/>
               <circle cx="5" cy="5" r="1.75" stroke="#7061E4" stroke-width="1.5"/>
            </svg>
            <span class="text-sm">{{ props.placename }}</span>
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
</style>
