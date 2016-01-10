# Minimal Java Runtime Environment

Good to go for Play Framework apps and other stuff, of course.

## Latest addition: OpenJDK JRE 8

Less than 150 MB. Image: `cloudunder/java-runtime:openjdk8`

## JRE 7

A very small Docker image with a Java Runtime Environment (OpenJDK 7) based on [Alpine Linux](https://registry.hub.docker.com/u/gliderlabs/alpine/). We also installed the Bash shell, because we want to use this as a base image for [Play Framework](https://www.playframework.com) web applications and the standard start script of a Play app is a Bash script.

Of course, this image is not limited to Play apps, but that’s what we use it for.

* [Image on Docker Hub](https://registry.hub.docker.com/u/cloudunder/java-runtime/)
* [Source on GitHub](https://github.com/CloudUnder/dockerfile-java-runtime)

## JRE 8

Unfortunately a not quite so small Docker image with a Java Runtime Environment 8 (Oracle JRE) on CentOS 7.

Of course, this image is not limited to Play apps, but that’s what we use it for.

* [Image on Docker Hub](https://registry.hub.docker.com/u/cloudunder/java-runtime/)
* [Source on GitHub](https://github.com/CloudUnder/dockerfile-java-runtime)

## Size comparison

```
REPOSITORY                  TAG               IMAGE ID         VIRTUAL SIZE
cloudunder/java-runtime     openjdk8          5f6d87db84a4     146.5 MB
cloudunder/java-runtime     7                 dc871d857866     123.5 MB
cloudunder/java-runtime     8                 e0cde27ac86a     441.5 MB
jeanblanchard/busybox-java  7                 f36e3fd69366     146.5 MB
java                        openjdk-7-jre     44faa7b2809f     332.3 MB
dockerfile/java             openjdk-7-jre     d97696b2fb1b     684.4 MB
```

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
# If you want Java 7:
# FROM cloudunder/java-runtime:7
# Or if you want Java 8:
FROM cloudunder/java-runtime:8

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

## Experimental

All this is still experimental, so use with care. Any suggestions are also welcome!
