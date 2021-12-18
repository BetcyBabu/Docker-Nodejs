FROM alpine:latest
RUN mkdir /var/NodejsApp
WORKDIR /var/NodejsApp
COPY . .
RUN apk update
RUN apk add --no-cache nodejs npm
RUN npm install
EXPOSE 8080
CMD ["node","server.js"]
