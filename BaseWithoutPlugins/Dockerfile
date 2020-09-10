# Use Ubuntu
FROM ubuntu

# Install wger & JRE
RUN apt-get clean && \
    apt-get update && \
    apt-get -qy install \
    wget \
    default-jre-headless \
    telnet \
    iputils-ping \
    unzip

# Install OpenJDK-8
RUN apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean

# Install jmeter
RUN   mkdir /jmeter \
    && cd /jmeter/ \
    && wget https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-5.3.tgz \
    && tar -xzf apache-jmeter-5.3.tgz \
    && rm apache-jmeter-5.3.tgz

# Set Jmeter Home
ENV JMETER_HOME /jmeter/apache-jmeter-5.3/

ENV JMETER_BIN $JMETER_HOME/bin

# Add Jmeter to the Path
ENV PATH $JMETER_BIN:$PATH