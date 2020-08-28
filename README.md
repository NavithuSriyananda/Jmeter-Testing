# Jmeter-Testing

---

## -Docker cheatsheet-

### -Images-

|       Description        |                  Command                   |
| :----------------------: | :----------------------------------------: |
| **Build** image and tag  | `docker build -t navithu/MyImage:latest .` |
|  **Push** to dockerhub   |   `docker push navithu/MyImage:latest .`   |
| **Pull** from docker hub |   `docker pull navithu/MyImage:latest .`   |
|         View all         |              `docker images`               |
|           Tag            |    `docker tag 123456 navithu/MyImage`     |
|          Remove          |        `docker rmi navithu/MyImage`        |
|        Remove all        |          `docker image prune -a`           |

### -Containers-

| Description |                            Command                             |
| :---------: | :------------------------------------------------------------: |
|     Run     | `docker run -dit --name MyContainer navithu/MyImage /bin/bash` |
|    Start    |                   `docker start MyContainer`                   |
|    Stop     |                   `docker stop MyContainer`                    |
|  View all   |                         `docker ps -a`                         |
|   Remove    |                    `docker rm MyContainer`                     |
| Remove all  |                    `docker container prune`                    |

### -Global-

|         Description          |               Command                |
| :--------------------------: | :----------------------------------: |
|      Login to dockerhub      |            `docker login`            |
| Set docker socket permission | `sudo chmod 777 /var/run/docker.sock` |
|         System reset         |       `docker system prune -a`       |
|  Create test file and save   |    `cat > test.jmx > sample text`    |

---

## Tools Used

- apache-jmeter-5.3
- openjdk:8-jre-slim
- docker

## File Structure

|       File        |                                                   Description                                                   |
| :---------------: | :-------------------------------------------------------------------------------------------------------------: |
| Jmeter base image |                      This image is used as the foundation for both master and slave images                      |
|   Master image    |                    This image is used to run master container. It populates with base image.                    |
|    Slave image    |                    This image is used to run slave container. It populates with base image.                     |
|   entrypoint.sh   | This script file used to configure jmeter in a slave(with server public IP). This execute when container starts |

---

## Run containers from images

### EC2 #01 - Master

```bash
docker run -dit --name master -p 60000:60000 navithu/master /bin/bash
```

### EC2 #02 - Slave

```bash
docker run -dit -e PublicIP='52.10.0.2' --name slave --network host navithu/slave /bin/bash
```

### EC2 #03 - Slave

```bash
docker run -dit -e PublicIP='52.10.0.3' --name slave --network host navithu/slave /bin/bash
```

---

## Testing with distributed nodes

### EC2-01 - Master

```bash
jmeter -n -t test.jmx -Djava.rmi.server.hostname=52.10.0.1 -Dclient.rmi.localport=60000 -R52.10.0.2,52.10.0.3
```

---
#Plugin manage

### apache-jmeter-5.3/lib

`wget http://search.maven.org/remotecontent?filepath=kg/apc/cmdrunner/2.0/cmdrunner-2.0.jar -o cmdrunner-2.0.jar`

### apache-jmeter-5.3/lib/ext 

`wget https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar -o jmeter-plugins-manager-1.4.jar `

`java -cp jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller`
