<script lang="ts">
import { defineComponent, ref } from 'vue'

export default defineComponent({
   props: {
      title: {
         type: String,
         required: true,
      }
   },
   setup(props) {
      const dropdown = ref(null);

      const toggleDropdown = () => {
         if (!dropdown.value) return;
         dropdown.value.classList.toggle('active');
      }

      return {
         dropdown,
         toggleDropdown,
         ...props,
      };
   },
})
</script>

<template>
   <div class="DropDown bg-white rounded shadow py-2 px-3 mb-3 flex flex-col-reverse">
      <div ref="dropdown" class="content">
         <slot></slot>
      </div>
      <button @click="toggleDropdown" class="title outline-none flex justify-between items-center w-full h-[42px]">
         <h1 class="font-medium text-lg">{{ title }}</h1>
         <svg class="w-6 h-6" viewBox="0 0 24 24">
            <path d="M7.41,8.58L12,13.17L16.59,8.58L18,10L12,16L6,10L7.41,8.58Z" />
         </svg>
      </button>
   </div>
</template>

<style lang="scss">
.content {
   width: 100%;
   height: 0;
   overflow: hidden;
   margin-top: 10px;
   display: none;
   flex-direction: column;
   align-items: center;
   padding-inline: 10px;

   & > * {
      margin-bottom: 10px;
   }

   & + button > svg {
      transition: transform 0.3s ease-in-out;
      transform: rotate(0);
   }

   &.active {
      height: auto;
      display: flex;

      & + button > svg {
         transition: transform 0.3s ease;
         transform: rotate(180deg);
      }
   }
}
</style>
