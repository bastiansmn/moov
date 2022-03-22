import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'
import "./index.css"
import router from "./router/router.js";

createApp(App)
   .use(createPinia())
   .use(router)
   .mount('#app')
