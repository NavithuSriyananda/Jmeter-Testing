# Jmeter-Testing
Distributed node testing with jmeter 

## Tools Used
- apache-jmeter-5.3
- openjdk-8-jdk
- docker

## Build Image from Docker File

```bash
###Base image
cd jmeter-base/
docker build --tag navithu/jmbase:latest .

###Server/slave image
cd jmeter-master/
docker build --tag navithu/slave:latest .

###Master image
cd jmeter-server/
docker build --tag navithu/master:latest .
```