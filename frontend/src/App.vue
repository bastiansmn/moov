<script lang="ts" setup>
import { ref, onMounted } from 'vue';

import Header from '@/components/Header.vue';
import Account from '@/components/Account/Account.vue';
import Notification from '@/components/common/Notification.vue';

import { useSettingsStore } from '@/store/settings';

const settingsStore = useSettingsStore();

onMounted(() => {
  // Fetch the user according to the username in localStorage
  const user_uuid = localStorage.getItem('user_uuid');
  const accessToken = localStorage.getItem('accessToken');

  if (!user_uuid || !accessToken) {
    return;
  }

  fetch(`/api/user/getUserByUUID?user_uuid=${user_uuid}`, {
    method: "GET",
    headers: new Headers({
      "Content-Type": "application/json",
      "x-access-token": accessToken,
    }),
  }).then(response => {
    const status = response.status;
    response.json().then(data => {
      settingsStore.connectUser({
        user_uuid: data.user_uuid,
        email: data.email,
        username: data.username,
        roles: data.roles,
      }, {
        userRecommandations: data.recommandationsEnabled,
        userEmailNotifications: data.emailNotificationEnabled,
        accessToken: accessToken,
      })
    });
  }).catch(_err => {
    settingsStore.sendNotification({
      code: 400,
      message: "Impossible de récupérer l'utilisateur demandé",
    });
  });
});
</script>

<template>
  <Header />

  <Account />

  <div style="height: 300vh;">

  </div>

  <Notification />
</template>