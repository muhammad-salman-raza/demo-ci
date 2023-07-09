# Dockerfile for backend
# Development stage
FROM node:16-alpine as development

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install -g @nestjs/cli && npm ci

CMD ["npm", "run", "start:dev"]

# Production stage
FROM node:16-alpine as production

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install -g @nestjs/cli && npm ci --only=production

COPY . .

CMD ["npm", "run", "start:prod"]
