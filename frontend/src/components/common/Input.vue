<script>
import { defineComponent, ref } from 'vue';

export default defineComponent({
   emits: ["submit", "change"],
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
      required: {
         type: Boolean,
         default: false,
      },
      name: {
         type: String,
      },
      width: {
         type: Number,
         default: 300
      },
      height: {
         type: Number,
         default: 42
      },
      background: {
         type: String,
         default: "#FFFFFF",
      },
      radius: {
         type: Number,
         default: 11,
      }
   },
   setup(props, { emit }) {
      
      const input = ref(null);

      const changeInput = () => {
         emit("change", (input.value).value);
      }

      const submitInput = () => {
         emit("submit", (input.value).value);
      }

      return {
         input,
         props,
         changeInput,
         submitInput,
      }
   }
})
</script>

<template>
   <form @submit.prevent="submitInput" :class="props.shadow
      ? `shadow search relative w-[${props.width}px] h-[${props.height}px] flex items-center justify-between overflow-hidden`
      : `search relative w-[${props.width}px] h-[${props.height}px] flex items-center justify-between overflow-hidden`"
      :style="{ background: props.background, borderRadius: props.radius + 'px' }"
   >
      <input @change="changeInput" ref="input" :name="name" :required="required" :type="props.type" :placeholder="props.placeholder" autocomplete="off" spellcheck="false" :class="`outline-none w-full h-full pl-[8px]  text-dark-grey bg-transparent`">    
      <span class="absolute bottom-0 h-[7%] transition-[width]" :style="`background: ${props.color}`"></span>
      <slot>
         <!-- Icon goes here if present -->
      </slot>
   </form>
</template>

<style scoped>
.search > input:focus + span {
   width: 100%;
}

.search > input:not(:focus) + span {
   width: 0;
}   
</style>