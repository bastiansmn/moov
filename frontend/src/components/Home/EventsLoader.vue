<script lang="ts" setup>
const getRandomInt = (min, max) => {
   min = Math.ceil(min);
   max = Math.floor(max);
   return Math.floor(Math.random() * (max - min)) + min;
}
</script>

<template>
   <div class="fake__category__filter">
      <div class="fake__category__title h-[24px] w-[70px] loader"></div>
      <div class="fake__swiper flex h-[90px] items-center">
         <div class="fake__filter loader h-1/2 w-[110px] mx-3" :key="i" v-for="i in 6" style="border-radius: 999px"></div>
      </div>
   </div>

   <div class="fake__themes" :key="i" v-for="i in 6">
      <div class="fake__title h-[24px] w-[170px] loader"></div>
      <div class="fake__events flex h-[220px] w-full py-3 overflow-x-hidden">
         <div 
            class="fake__event shadow relative h-full min-w-[190px] mr-[10px] overflow-hidden loader"
            :key="j" 
            v-for="j in 8"
         >
            <div class="absolute bottom-0 h-1/3 w-full bg-white flex flex-col justify-between p-2">
               <div class="fake__event__title h-1/2 flex items-center">
                  <div class="h-[14px] w-[90px] loader"></div>
               </div>
               <div class="fake__event__placename h-1/2 flex items-center">
                  <div class="h-[14px] w-[130px] loader"></div>
               </div>
            </div>
         </div>
      </div>
   </div>
</template>