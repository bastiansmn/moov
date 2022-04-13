<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
   props: {
      cats: {
         type: Array,
         required: true,
      }
   },
   setup(props) {
      const getBgColor = (cat) => {         
         switch (cat) {
            case "Musique":
               return "#5BE3E3";
            case "Lecture":
               return "#53F350";
            case "Plein-air":
               return "#ECEF67";
            case "Cinéma": 
               return "#E35B5B";
            case "Humour":
               return "#4661EB";
            case "Exposition": 
               return "#D05BE3";
            case "Enfants":
               return "#FFA1CE";
            case "Spectacle": 
               return "#E3AD5B";
            default:
               return '#FFFFFF';
         }
      }

      return {
         ...props,
         getBgColor
      }
   },
})
</script>

<template>
   <div v-for="tag in cats" :key="tag" class="w-[22px] aspect-square rounded-[4px] mr-1 flex items-center justify-center" :style="`background: ${getBgColor(tag)}`">
      <svg v-if="tag === 'Musique'" width="12" height="12" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg">
         <path d="M1 6.88235H2.25C3.1875 6.88235 3.5 7.35294 3.5 8.05882V9.82353C3.5 10.5294 3.1875 11 2.25 11C1.3125 11 1 10.7059 1 9.82353V6.88235ZM1 6.88235V5.11765C1 2.76471 2.68666 1 5.6875 1C8.8125 1 11 2.76471 11 5.11765V6.88235M11 6.88235V9.82353C11 10.7059 10.6875 11 9.75 11C8.8125 11 8.5 10.5294 8.5 9.82353C8.5 9.11765 8.5 8.35294 8.5 8.05882C8.5 7.34749 9 6.88235 9.75 6.88235C10.5 6.88235 10.8958 6.88235 11 6.88235Z" stroke="white" stroke-width="1.5"/>
      </svg>
      <svg v-if="tag === 'Lecture'" width="11" height="13" viewBox="0 0 11 13" fill="none" xmlns="http://www.w3.org/2000/svg">
         <path d="M1 11C1 12 2.2 12 3.4 12H9C9.55229 12 10 11.5523 10 11V10M1 11C1 11 1 2.62556 1 2C0.999995 1.37444 1.42362 1 2.2 1C2.79335 1 7.03562 1 9.00284 1C9.55512 1 10 1.44772 10 2V10M1 11C1 10 2.2 10 3.4 10C4.6 10 10 10 10 10" stroke="white" stroke-width="1.5"/>
      </svg>
      <svg v-if="tag === 'Plein-air'" width="17" height="17" viewBox="0 0 17 17" fill="none" xmlns="http://www.w3.org/2000/svg">
         <circle cx="8.48529" cy="8.48529" r="3" stroke="white" stroke-width="1.2"/>
         <path d="M8.48529 3.48529V2.48529M13.4853 8.48529H14.4853M8.48529 13.4853V14.4853M3.48529 8.48529H2.48529" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
         <path d="M12.0208 4.94975L12.7279 4.24264M12.0208 12.0208L12.7279 12.7279M4.94976 12.0208L4.24265 12.7279M4.94976 4.94975L4.24265 4.24264" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      <svg v-if="tag === 'Cinéma'" width="13" height="13" viewBox="0 0 13 13" fill="none" xmlns="http://www.w3.org/2000/svg">
         <path d="M3.80376 3.65825L2 4.5L3 6.5L3.80376 6.12491L5.48558 5.34006M3.80376 3.65825L5.48558 5.34006M3.80376 3.65825L5.48558 2.8734M5.48558 5.34006L7.1674 4.55522M5.48558 2.8734L7.1674 4.55522M5.48558 2.8734L7.1674 2.08855M7.1674 4.55522L8.84921 3.77037M7.1674 2.08855L8.84921 3.77037M7.1674 2.08855L8.84921 1.3037L9.5 1L10.5 3L8.84921 3.77037M3 9.5C3 10.5 4 11.5 5 11.5H10C11 11.5 12 10.5 12 9.5C12 9.5 12 8.25663 12 7.5C12 6.74337 11.7675 6.5 11 6.5C10.2325 6.5 4.8 6.5 4 6.5C3 6.5 3 6.5 3 7.5V9.5Z" stroke="white" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      <!-- TODO: Ajouter les icônes -->
   </div>
</template>
