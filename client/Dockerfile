FROM node:22

WORKDIR /app
RUN npm install -g @angular/cli
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY . .

# TODO
