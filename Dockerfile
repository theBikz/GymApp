FROM node:20.5.0-alpine
WORKDIR /src
COPY . .
RUN echo "process.setMaxListeners(15);" >> /src/app.js
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]