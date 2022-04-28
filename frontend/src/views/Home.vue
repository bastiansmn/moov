<script lang="ts" setup>
import EventListing from '@/components/Home/EventsListing.vue'
import EventLoader from '@/components/Home/EventsLoader.vue'
</script>

<template>
   <Suspense>
      <template #default>
         <EventListing />
      </template>
      <template #fallback>            
         <EventLoader />
      </template>
   </Suspense>
</template>