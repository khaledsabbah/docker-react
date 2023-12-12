FROM node:latest as node_builder
LABEL authors="Khaled Gamal"

WORKDIR /app
COPY ./package.json .

RUN npm i

COPY . .

RUN npm run build

# Nginx Step

FROM nginx:latest

COPY --from=node_builder /app/build /usr/share/nginx/html