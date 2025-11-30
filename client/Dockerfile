FROM node:22

WORKDIR /app
RUN npm install -g @angular/cli
COPY client/package.json .
COPY client/package-lock.json .
RUN npm install
COPY client/ .

# TODO
