<script lang="ts" setup>
import EventDisplay from './EventDisplay.vue'
import EventLoader from './EventLoader.vue'

const props = defineProps<{
   event?: string,
}>();
</script>

<template>
   <Suspense>
      <template #default>
         <EventDisplay :event="event" />
      </template>
      <template #fallback>
         <EventLoader />
      </template>
   </Suspense>
</template>