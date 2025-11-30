FROM node:22

WORKDIR /app
COPY server/package.json .
COPY server/package-lock.json .
RUN npm install
COPY server/ .
RUN npm run build

# TODO
