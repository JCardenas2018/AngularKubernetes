# Paso 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Paso 2
FROM nginx:alpine
COPY --from=node /app/dist/AngularFront /usr/share/nginx/html
