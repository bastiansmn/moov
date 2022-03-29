<script lang="ts" setup>
import { ref } from "vue";
import { capitalizeFirstLetter } from "@/utils/typos";

const props = defineProps({
   placeholder: {
      type: String,
      required: true,
   },
   shadow: {
      type: Boolean,
      default: false,
   },
   required: {
      type: Boolean,
      default: false,
   },
   name: {
      type: String,
      required: true,
   },
   width: {
      type: String,
      default: "100%"
   },
   height: {
      type: String,
      default: "42px"
   },
   background: {
      type: String,
      default: "#FFFFFF",
   },
   radius: {
      type: Number,
      default: 11,
   },
   options: {
      type: Array,
      required: true,
   },
   defaultValue: {
      type: String,
      default: "Entrez une valeur..."
   }
});

const emit = defineEmits(["change"]);

const select = ref(null);

const changeInput = () => {
   emit("change", select.value.value);
}
</script>

<template>
   <div 
      class="search relative flex items-center justify-between overflow-hidden"
      :style="{ 
         background: background, 
         borderRadius: radius + 'px', 
         width: width, 
         height: height, 
         boxShadow: shadow ? '0px 2px 5px -3px rgba(0, 0, 0, 0.25)' : 'none',
      }"
   >
      <select ref="select" @change="changeInput" :name="name" :required="required" autocomplete="off" spellcheck="false" class="outline-none w-full h-full text-dark-grey bg-transparent">
         <option :key="k" v-for="v, k  in options" :disabled="v === '...'" :selected="v === placeholder" :value="v">{{ capitalizeFirstLetter(v) }}</option>
      </select>
   </div>
</template>