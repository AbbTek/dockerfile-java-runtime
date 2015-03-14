# Alpine Linux with OpenJDK Java Runtime Environment 7 and Bash

FROM gliderlabs/alpine:3.1

MAINTAINER Nick Zahn <nick@cloudunder.io>

RUN apk-install bash openjdk7-jre-base
