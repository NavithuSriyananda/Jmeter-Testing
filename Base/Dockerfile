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
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean

# Install jmeter
RUN   mkdir /jmeter \
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

# Install Plugin-Manager
RUN cd $JMETER_HOME/lib/ \
	&& wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar \
	&& cd $JMETER_HOME/lib/ext \
	&& wget -O jmeter-plugins-manager-1.4.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar \
	&& java -cp jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller

# Add Plugin-Manager to the Path
ENV PATH $JMETER_HOME/bin/PluginsManagerCMD.sh:$PATH