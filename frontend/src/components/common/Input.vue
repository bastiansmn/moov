<script>
import { defineComponent, ref } from 'vue';

export default defineComponent({
   emits: ["submit", "change", "blur", "focus"],
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
      },
      nav: {
         type: Boolean,
         default: false
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

      const handleBlur = () => {
         // TODO: attendre que l'action soit terminée
         setTimeout(() => {
            emit("blur");
         }, 100);
      }

      const handleFocus = (e) => {
         emit("focus", e.target.value);
      }

      return {
         input,
         props,
         changeInput,
         submitInput,
         handleBlur,
         handleFocus,
      }
   }
})
</script>

<template>
   <form @submit.prevent="submitInput" class="search relative flex items-center justify-between"
      :style="{
         background: props.background,
         borderRadius: props.radius + 'px',
         width: props.width ? props.width + 'px' : '100%',
         height: props.height + 'px',
         boxShadow: props.shadow ? '0px 2px 5px -3px rgba(0, 0, 0, 0.25)' : 'none',
      }"
   >
      <input ref="input" @input="changeInput" :name="name" @blur="handleBlur" @focus="handleFocus" :required="required" :type="props.type" :placeholder="props.placeholder" autocomplete="off" spellcheck="false" class="outline-none w-full h-full pl-[8px]  text-dark-grey bg-transparent">
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
