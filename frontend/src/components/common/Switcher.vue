<script lang="ts">
import { defineComponent, ref } from 'vue'

export default defineComponent({
   emits: ["switched"],
   props: {
      default: {
         type: Boolean,
         default: false
      }
   },
   setup(props, { emit }) {
      const toggled = ref<boolean>(props.default);

      const switchButton = () => {
         toggled.value = !toggled.value;
         emit("switched", toggled.value);
      }

      return {
         toggled,
         switchButton,
      }
   },
})
</script>

<template>
   <button @click="switchButton" :class="toggled ? 'bg-purple' : 'bg-white'" class="flex items-center relative rounded-[100px] shadow w-[36px] h-[20px] p-[2px] cursor-pointer">
      <div :class="toggled ? 'bg-white active' : 'bg-black'" class="h-full aspect-square rounded"></div>
   </button>
</template>

<style lang="scss" scoped>
button, div {
   transition: all .2s ease-in-out;
}

div.active {
   transform: translateX(100%);
}
</style>