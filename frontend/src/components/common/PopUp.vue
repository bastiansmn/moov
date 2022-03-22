<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
   setup(props) {
      return {
         props
      }
   },
})
</script>

<template>
   <slot></slot>   
</template>