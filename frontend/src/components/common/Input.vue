<script>
import { defineComponent } from 'vue';

export default defineComponent({
   props: {
      placeholder: {
         type: String,
         required: true,
      },
      color: {
         type: String,
         default: "#7061E4",
      }, 
      shadow: {
         type: Boolean,
         default: false,
      },
      type: {
         type: String,
         default: "text"
      },
      required: Boolean
   },
   setup(props) {
      return {
         props,
      }
   }
})
</script>

<template>
   <div class="search relative rounded w-[300px] min-h-[42px] bg-white flex items-center justify-between overflow-hidden" :class="props.shadow ? 'shadow' : ''">
      <input :required="required" :type="props.type" :placeholder="props.placeholder" autocomplete="off" spellcheck="false" class="outline-none w-full h-full rounded pl-[8px]  text-dark-grey">    
      <span class="absolute bottom-0 h-[3px] will-change-[transform]" :style="`background: ${props.color}`"></span>
      <slot>
         <!-- Icon goes here if present -->
      </slot>
   </div>
</template>

<style scoped>
.search > input:focus + span {
   animation: translateXLTR 0.5s ease-in-out;
   width: 100%;
}

.search > input:not(:focus) + span {
   animation: translateXLTR 0.5s ease-in-out reverse;
   width: 0;
}   
</style>