# Alpine - lighweight linux distro
FROM alpine

# install packages
RUN apk update && \
    apk add wget \
    busybox-extras \
    iputils \
    unzip

# Install OpenJDK-8
RUN apk add openjdk8 && \
    apk add apache-ant

# Install Jmeter & plugins
RUN mkdir /jmeter \
    && cd /jmeter/ \
    && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.3.tgz \
    && tar -xzf apache-jmeter-5.3.tgz \
    && rm apache-jmeter-5.3.tgz \
    && mkdir /jmeter-plugins \
    && cd /jmeter-plugins/ \
    && wget https://jmeter-plugins.org/downloads/file/JMeterPlugins-ExtrasLibs-1.4.0.zip \
    && unzip -o JMeterPlugins-ExtrasLibs-1.4.0.zip -d /jmeter/apache-jmeter-5.3/

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-5.3/

# Add Jmeter to the Path
ENV PATH $JMETER_HOME/bin:$PATH