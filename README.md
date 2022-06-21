# Moov
Moov est une application qui permet de visualiser les évènements des API OpendataSoft, Opendata Paris, Opendata MEL (Lille et sa métropole), et d'autres encore. Le but est de permettre aux utilisateurs de trouver des évènements proches de chez eux, et ce, peu importe où ils se trouvent (prochainement). 

# Déploiement

Un déploiement est disponible à cette URL : 

### Lancement en local:

Il est possible de dockeriser l'application pour avoir l'aperçu tel qu'il est en production, mais le plus simple reste de lancer l'application via les scripts npm dédiés.

**Prérequis:** 
- node 
- psql

Dans un terminal:
```
> psql -d postgres postgres

postgres=# CREATE DATABASE moov;
```

Dans `frontend`:
```
npm i
npm run devhost
```

Dans `backend`:
```
npm i
npm start
```

Grâce à l'ORM, les tables devrait se créer seules. Cependant, aucune donnée n'est créée au démarrage, vous devez en effet exécuter le script `sql/inserts.sql`

```
> psql -d postgres postgres

postgres=# \c moov
postgres=# \i sql/inserts.sql
```

Pour son bon fonctionnement, l'application a besoin de variables d'environnements. 
Chaque module (`frontend` et `backend`) a en effet besoin de son propre fichier `.env`.

**Pour `backend/.env`**
```
DB_HOST=localhost
DB_USER=postgres
DB_PASSWORD=root
DB_PORT=5432
DB_NAME=moov

EMAIL=some.email@gmail.com
EMAIL_PASSWORD=somePasswrd

JWT_SECRET=mysupersecret
JWT_REFRESH_SECRET=myothersupersecret

PG_EMAIL=myAdminEmail
PG_PASSWORD=mySuperStrongPassword
PG_PORT=16543
```

**Pour `frontend/.env`**:
Étant donné que le frontend utilise l'api Google Maps, vous devez créer votre propre clé d'API pour que les cartes fonctionnent.
Par exemple : 
```
VITE_MAPS_API_KEY=mySuperGoogleMapsAPIKEY
VITE_BACKEND_URL=http://localhost:3000
```

`VITE_BACKEND_URL` est optionnel et sert uniquement si vous souhaitez modifier le host du backend. Si vous ne modifiez pas cette valeur, elle sera par défaut à `http://localhost:3000`.

### Lancement avec Docker

Ce dernier utilise aussi les variables d'environnement du fichier `.env`.
Attention cependant à ne pas mettre n'importe quelle valeur. Par exemple, sauf cas particuliers, la valeur de DB_HOST doit être postgres. Pour éviter tout problème, il est conseillé de ne rien toucher à la configuration actuelle qui devrait en partie fonctionner. Il faut uniquement modifier les valeurs comme PG_EMAIL, PG_PASSWORD et toutes les valeurs n'ayant pas de valeurs par défaut dans le fichier `docker-compose.yml`.

Une fois cette configuration effectuée, vous pouvez lancer les containers via :
```
docker-compose up -d --build
```
Et pour éteindre l'application :
```
docker-compose down 
```
