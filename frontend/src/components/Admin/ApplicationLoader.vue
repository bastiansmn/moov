<template>
   <div class="h-full w-full flex items-center justify-between max-w-[1300px]">
      <div class="fake__users h-full w-[49%] p-5 bg-white rounded shadow">
         <div class="fake__header w-full h-[24px] mb-4 flex items-center justify-between">
            <div class="fake__title w-1/4 h-full loader"></div>
            <div class="fake__buttons w-1/2 h-full loader"></div>
         </div>

         <div class="fake__container w-full h-[91%] rounded-sm bg-white2 border-[1px] border-light-grey"></div>
      </div>

      <div class="fake__settings h-full w-[49%] flex flex-col justify-between">
         <div class="fake__boxes w-full h-[100px] flex justify-between">
            <div class="bg-white rounded w-[32%] h-full shadow flex flex-col items-center justify-evenly">
               <div class="loader h-[43%] aspect-square m-0"></div>
               <div class="loader h-[15px] w-1/2 m-0"></div>
            </div>
            <div class="bg-white rounded w-[32%] h-full shadow flex flex-col items-center justify-evenly">
               <div class="loader h-[43%] aspect-square m-0"></div>
               <div class="loader h-[15px] w-1/2 m-0"></div>
            </div>
            <div class="bg-white rounded w-[32%] h-full shadow flex flex-col items-center justify-evenly">
               <div class="loader h-[43%] aspect-square m-0"></div>
               <div class="loader h-[15px] w-1/2 m-0"></div>
            </div>
         </div>
         <div class="fake__stats w-full h-[calc(100%-110px)] flex flex-col justify-between">
            <div class="bg-white shadow rounded fake__request__stats h-[49%] p-4">
               <div class="loader fake__canvas w-full h-full"></div>
            </div>
            <div class="bg-white shadow rounded fake__user__stats h-[49%] p-4">
               <div class="loader fake__canvas w-full h-full"></div>
            </div>
         </div>
      </div>
   </div>
</template>