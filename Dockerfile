FROM node:14
WORKDIR /usr/src/app
COPY package*.json server.js ./    
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN npm install
EXPOSE 8080 CMD ["node", "server.js"]
