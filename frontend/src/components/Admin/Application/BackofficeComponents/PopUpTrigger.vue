<script lang="ts" setup>
import { defineProps, defineEmits } from "vue";

const props = defineProps<{
   popUpName: string,
   buttonTitle: string,
   image: string,
   alt?: string
}>();

const emits = defineEmits<{
   (e: "showPopUp", popUpName: string): void
}>();

const showPopUp = () => {
   emits("showPopUp", props.popUpName);
}
</script>


<template>
   <button @click="showPopUp">
      <img :src="props.image" :alt="alt" class="opacity__animation">
      <h1 class="opacity__animation">
         {{ props.buttonTitle }}
      </h1>
   </button>
</template>

<style lang="scss" scoped>
.boxes > button {
   background: #FFFFFF;
   color: #4D4D4D;
   font-weight: 600;
   border-radius: 11px;
   width: 32%;
   height: 100%;
   box-shadow: 0px 2px 6px -3px rgba(0, 0, 0, 0.25);
   transition: all .3s;

   &:hover {
      background: #7061E4;
      & > h1 {
         color: #FFFFFF;
      }
   }

   & > img {
      height: 35%;
      margin: 0 auto 5px auto;
   }
}
</style>