FROM node:20.9.0-alpine AS build
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:1.23.1-alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/vue-app /usr/share/nginx/html
