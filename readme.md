# Minimal Java Runtime Environment

A very small Docker image with a Java Runtime Environment (currently only OpenJDK 7) based on [Alpine Linux](https://registry.hub.docker.com/u/gliderlabs/alpine/). We also installed the Bash shell, because we want to use this as a base image for [Play Framework](https://www.playframework.com) web applications and the standard start script of a Play app is a Bash script.

Of course, this image is not limited to Play apps, but that’s what we use it for.

* [Image on Docker Hub](https://registry.hub.docker.com/u/cloudunder/java-runtime/)
* [Source on GitHub](https://github.com/CloudUnder/dockerfile-java-runtime)

## Size

```
REPOSITORY                  TAG               IMAGE ID         VIRTUAL SIZE
cloudunder/java-runtime     7                 dc871d857866     123.5 MB
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
docker run --rm cloudunder/java-runtime:7 /usr/lib/jvm/default-jvm/jre/bin/java -version
```

A sample `Dockerfile` for a Play Framework application:

```
FROM cloudunder/java-runtime:7
WORKDIR /app
COPY target/universal/stage/ .
EXPOSE 9000
CMD ["bin/appname"]
```

## Experimental

All this is still experimental, so use with care. Any suggestions are also welcome!
