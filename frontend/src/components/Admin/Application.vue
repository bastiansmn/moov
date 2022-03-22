<script lang="ts">
import { defineComponent } from 'vue'
import ApplicationLoader from '@/components/Admin/ApplicationLoader.vue'
import ApplicationContent from '@/components/Admin/ApplicationContent.vue'

export default defineComponent({
   components: {
      ApplicationLoader,
      ApplicationContent,
   },
})
</script>

<template>
   <Suspense>
      <template #default>
         <ApplicationContent />
      </template>
      <template #fallback>
         <ApplicationLoader />
      </template>
   </Suspense>
</template>
