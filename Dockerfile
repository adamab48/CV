FROM node:lts-alpine3.18 as build-stage
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.21.1-alpine as production-stage
COPY --from=build-stage /dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]