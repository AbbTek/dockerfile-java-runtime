# CentOS with Oracle Java Runtime Environment 8

FROM centos:7

MAINTAINER Nick Zahn <nick@cloudunder.io>

ENV JAVA_VERSION_MAJOR 8
ENV JAVA_VERSION_MINOR 45
ENV JAVA_VERSION_BUILD 14

RUN yum -y install tar && \
	yum clean all && \
	cd /opt && \
	curl -kLOH "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz" && \
	tar xvf jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
	chown root: jre1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} && \
	alternatives --install /usr/bin/java java /opt/jre1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/bin/java 1 && \
	rm jre-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
	java -version

ENV JAVA_HOME=/opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}
