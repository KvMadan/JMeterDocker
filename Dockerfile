# Java 8 JRE
FROM openjdk:8-jre-slim
LABEL MAINTAINER="Madan Kavarthapu"

# JMeter Version 
ARG JMETER_VERSION=3.3

# Install dependencies

RUN apt-get clean && \
	apt-get update && \
	apt-get -qy install \
				wget \
				telnet \
				iputils-ping \
				unzip

# Install JMeter
RUN mkdir /jmeter \
	&& cd /jmeter/ \
	&& wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-$JMETER_VERSION.tgz \
	&& tar -xzf apache-jmeter-$JMETER_VERSION.tgz \
	&& rm apache-jmeter-$JMETER_VERSION.tgz

# Set JMeter Home 
ENV JMETER_HOME /jmeter/apache-jmeter-$JMETER_VERSION/

ENV PATH $JMETER_HOME/bin:$PATH
