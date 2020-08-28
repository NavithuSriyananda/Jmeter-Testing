# Jmeter-Testing with Docker




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

 - Public IP - 0.0.0.1

```bash
docker run -dit --name master --network host navithu/master /bin/bash
```

### EC2 #02 - Slave

 - Public IP - 0.0.0.2

```bash
docker run -dit -e PublicIP='0.0.0.2' --name slave --network host navithu/slave /bin/bash
```

### EC2 #03 - Slave

 - Public IP - 0.0.0.1

```bash
docker run -dit -e PublicIP='0.0.0.3' --name slave --network host navithu/slave /bin/bash
```

---

## Testing with distributed nodes

### EC2-01 - Master

```bash
jmeter -n -t test.jmx -Djava.rmi.server.hostname=0.0.0.1 -Dclient.rmi.localport=60000 -R0.0.0.2,0.0.0.3
```

---

# Plugin Manager 

## Install

### ..apache-jmeter-5.3/lib>

1. `wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar`

### ..apache-jmeter-5.3/lib/ext>

1. `wget -O jmeter-plugins-manager-1.4.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar`

2. `java -cp jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller`

3. Add to path `PATH="$PATH:$HOME/jmeter/apache-jmeter-5.3/bin/PluginsManagerCMD.sh"`

## Sample commands

```
PluginsManagerCMD.sh help

PluginsManagerCMD.sh status

PluginsManagerCMD.sh upgrades

PluginsManagerCMD.sh available

PluginsManagerCMD.sh install jpgc-fifo,jpgc-json=2.2

PluginsManagerCMD.sh install-all-except jpgc-casutg,jpgc-autostop

PluginsManagerCMD.sh uninstall jmeter-tcp,jmeter-ftp,jmeter-jdbc

PluginsManagerCMD.sh install-for-jmx /home/username/jmx/testPlan.jmx
````

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

