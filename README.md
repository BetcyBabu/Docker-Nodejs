# Dockerizing a Node.js web app

## Creating a Dockerfile

Create an empty file called Dockerfile:

```
touch Dockerfile
```

Open Dockerfile in your favorite text editor. We first need to define from which image we want to build the image, here I am using the latest version of Alpine.

Next we will create a directory to hold the application code inside the image, which will be your application's working directory directory:

```
RUN mkdir /var/NodejsApp
WORKDIR /var/NodejsApp
```

Copy the entire working directory.

```
COPY . .
```

Install Node.js, NPM and your app dependencies using the npm binary.

```
RUN apk update
RUN apk add --no-cache nodejs npm
RUN npm install
```

Finally, specify the command for starting the application:

```
CMD ["node","server.js"]
```

## Build the Docker Image

Now that the Docker file is complete, it is time to create the Docker image according to the instructions in the file. This is achieved through the Docker build command. 

```
docker image build -t betcybabu/node-web-app .
```

The -t flag lets you tag your image so it's easier to find later using the docker images command.
