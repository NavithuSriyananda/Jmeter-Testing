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
	apt-get install -y ant

# Install dos2unix
RUN apt-get install dos2unix && \
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

# Install Plugin-Manager
RUN cd $JMETER_HOME/lib/ \
	&& wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar \
	&& cd $JMETER_HOME/lib/ext \
	&& wget -O jmeter-plugins-manager-1.4.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar \
	&& java -cp jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# Add Plugin-Manager to the Path
ENV PATH $JMETER_BIN/PluginsManagerCMD.sh:$PATH

# Install 22 plugins
# 3 Basic Graphs
RUN PluginsManagerCMD.sh install jpgc-graphs-basic=2.0
# 5 Additional Graphs
RUN  PluginsManagerCMD.sh install jpgc-graphs-additional
# Custom JMeter Functions
RUN  PluginsManagerCMD.sh install jpgc-functions
# Custom Thread Groups
RUN  PluginsManagerCMD.sh install jpgc-casutg
# Dummy Sampler
RUN  PluginsManagerCMD.sh install jpgc-dummy
# Merge Results
RUN  PluginsManagerCMD.sh install jpgc-mergeresults
# Random CSV Data Set
RUN  PluginsManagerCMD.sh install bzm-random-csv
# Selenium/WebDriver Support
RUN  PluginsManagerCMD.sh install jpgc-webdriver
# Throughput Shaping Timer
RUN  PluginsManagerCMD.sh install jpgc-tst
# WebSocket Samplers by Peter Doornbosch
RUN  PluginsManagerCMD.sh install websocket-samplers
# jmeter - FTP Protocol Support
RUN  PluginsManagerCMD.sh install jmeter-ftp
# jmeter - HTTP Protocol Support
RUN  PluginsManagerCMD.sh install jmeter-http
# jmeter - JDBC Support
RUN  PluginsManagerCMD.sh install jmeter-jdbc
# jmeter - JMS Support
RUN  PluginsManagerCMD.sh install jmeter-jms
# jmeter - JUnit Support
RUN  PluginsManagerCMD.sh install jmeter-junit
# jmeter - Java Components ( Not tested )
RUN  PluginsManagerCMD.sh install jmeter-java
# jmeter - LDAP Protocol Support ( Not tested )
RUN  PluginsManagerCMD.sh install jmeter-ldap
# jmeter - Mail/SMTP Support
RUN  PluginsManagerCMD.sh install jmeter-mail
# jmeter - MongoDB Support (DEPRECATED)
RUN  PluginsManagerCMD.sh install jmeter-mongodb
# jmeter - OS Process Support
RUN  PluginsManagerCMD.sh install jmeter-native
# jmeter - TCP Protocol Support
RUN  PluginsManagerCMD.sh install jmeter-tcp
# jmeter - Various Core Components ( Not tested )
RUN  PluginsManagerCMD.sh install jmeter-components