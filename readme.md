# Minimal Java Runtime Environment

## REPOSITORY IS NO LONGER MAINTAINED

These days there is plenty of choice for Java Runtime Environments on Docker, most notably the official [openjdk](https://hub.docker.com/r/library/openjdk/) Docker repository, so there is no more need for this one.

Not all base images contain Bash, which is quite convenient if you want to launch Play Framework applications with its Bash launch script, but the `*-jre-slim` images do. For example, you could use a Dockerfile like this to dockerize your Play web application:

```
FROM openjdk:8u171-jre-slim
WORKDIR /app
COPY target/universal/stage/ .
COPY public/ ./public
EXPOSE 9000
CMD ["bin/name-of-launch-script"]
```

Good luck! This repository will now be archived.

If you need a helping hand with your web project, [get in touch](https://cloudunder.io). 😉


## General

Good to go for **Play Framework** apps and other stuff, of course.

> Since the [official Java repository on Docker Hub](https://hub.docker.com/_/java/) now also has minimal images based on Alpine Linux, there is not much point in maintaining this repository any longer.

* [Image on Docker Hub](https://registry.hub.docker.com/u/cloudunder/java-runtime/)
* [Source on GitHub](https://github.com/CloudUnder/dockerfile-java-runtime)

## OpenJDK JRE 8 (including Bash)

Less than 120 MB image: `cloudunder/java-runtime:openjdk8`

> The only difference to the official `java:8-jre-alpine` image is that this one has **bash** installed, which is handy to start a Play application using the bash script that comes with a build (e.g. `sbt stage`).

## JRE 7

> No longer maintained.

A very small Docker image with a Java Runtime Environment (OpenJDK 7) based on [Alpine Linux](https://registry.hub.docker.com/u/gliderlabs/alpine/). We also installed the Bash shell, because we want to use this as a base image for [Play Framework](https://www.playframework.com) web applications and the standard start script of a Play app is a Bash script.

## How to use this image

Examples:

```
# Pull the image from Docker Hub:
docker pull cloudunder/java-runtime:7

# Print the version and exit:
docker run --rm cloudunder/java-runtime:7 java -version
```

A sample `Dockerfile` for a Play Framework application:

```
FROM cloudunder/java-runtime:openjdk8

WORKDIR /app
COPY target/universal/stage/ .
EXPOSE 9000
CMD ["bin/appname"]
```

Containerise the Play app:

```
# Compile the app in stage mode
# In your Play app's directory:
./activator stage

# Build a container with the app
docker build -t yourappimagename .
```

Run the Play app in the Docker container:

```
# To make web application accessible with a random port:
docker run -P -t yourappimagename

# To bind public port 80 to the app's port 9000:
docker run -p 80:9000 -t yourappimagename
```

Now you should be able to open the app in your browser.
