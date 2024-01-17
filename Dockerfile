FROM node:20.5.0-alpine
WORKDIR /src
COPY package*.json .
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]