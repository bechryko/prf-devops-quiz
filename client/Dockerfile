# ---------- Build Angular ----------
FROM node:22 AS build

WORKDIR /app
COPY package*.json ./
RUN npm install -g @angular/cli
RUN npm install
COPY . .
RUN npm run build --configuration=production

# ---------- Nginx ----------
FROM nginx:stable-alpine AS run

RUN rm -f /usr/share/nginx/html/*
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/prf-quiz-frontend/browser /usr/share/nginx/html

EXPOSE 80
