# Dockerfile

# Stage 1 - development environment
FROM node:14-alpine as development
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .

# Stage 2 - build the Vue project
FROM development as build-stage
RUN yarn build

# Stage 3 - production environment
FROM nginx:1.19.0-alpine
COPY --from=build-stage /usr/src/app/dist /usr/share/nginx/html


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
