<template>
   <div class="w-full h-[42px] mb-5 flex items-center">
      <router-link to="/home" class="mr-4">
         <div class="h-[30px] w-[30px] bg-purple rounded hover:rounded-sm flex items-center justify-center transition-[border-radius]">
            <svg xmlns="http://www.w3.org/2000/svg" width="14px" height="14px" viewBox="-5 0 25.618 25.618">
               <g transform="translate(-8.191 -3.191)">
                  <g>
                     <rect width="18.141" height="3.947" rx="1.954" transform="translate(8.191 16.019) rotate(-45)" fill="#ffffff"/>
                  </g>
                  <g>
                     <rect width="3.947" height="18.141" rx="1.954" transform="translate(8.191 15.981) rotate(-45)" fill="#ffffff"/>
                  </g>
               </g>
            </svg>
         </div>
      </router-link>
      <h1 class="font-semibold">Retour à l'accueil</h1>
   </div>
   <div class="event__content flex justify-between">
      <div class="left__event flex flex-col justify-between">
         <div class="loader rounded-sm shadow mb-5 w-full aspect-video"></div>
         <div class="loader h-[28px] w-1/4 mb-3"></div>
         <div class="loader h-[16px] mb-2"></div>
         <div class="loader h-[16px] mb-2 w-[90%]"></div>
         <div class="loader h-[16px] mb-2 w-3/4"></div>
         <div class="loader h-[16px] mb-2"></div>
         <div class="loader h-[16px] mb-2 w-2/3"></div>
         <div class="loader h-[16px] mb-2 w-3/4"></div>
         <div class="loader h-[16px] mb-2 w-1/2"></div>
      </div>
      <div class="right__event">
         <div class="loader h-[28px] mb-4 w-1/4"></div>
         <div class="loader h-[28px] w-2/3"></div>
         <div class="loader w-full aspect-video my-4"></div>
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
         </div>
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
         </div>
         <div class="flex justify-between mb-2">
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
            <div class="w-[49%] h-full">
               <div class="loader h-[20px] mb-2 w-1/4"></div>
               <div class="loader h-[12px] mb-2 w-2/3"></div>
            </div>
         </div>
      </div>
   </div>
</template>

<style lang="scss" scoped>
.left__event {
   width: 53%;
   min-width: 500px;
}

.right__event {
   width: 45%;
   max-width: calc(100% - 500px);
}   
</style>