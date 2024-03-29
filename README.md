# Jmeter-Testing with Docker (Distributed Testing)

---

## Tools Used

- apache-jmeter-5.3
- openjdk-8-jdk
- docker

## File Structure

|       File        |                                                                     Description                                                                      |
| :---------------: | :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| Jmeter base image |                                               used as the foundation for both master and slave images                                                |
|   Master image    |                                             used to run master container. It populates with base image.                                              |
|    Slave image    |                                              used to run slave container. It populates with base image.                                              |
|   entrypoint.sh   | This script file used to configure heap size of JVM to run jmeter. Also configure slaves(with server public IP). This executes when container starts |

**entrypoint.sh file always need to be formatted as LF. Not CRLF**
![note](https://raw.githubusercontent.com/NavithuSriyananda/Jmeter-Testing/master/note.png)

---

# Getting started

![EC2 Instances](https://raw.githubusercontent.com/NavithuSriyananda/Jmeter-Testing/master/Architecture.png)

## 1. Build images

- Example
  ```bash
  docker build -t navithu/base .
  ```

## 2. Push images to dockerhub

- Example
  ```bash
  docker push navithu/base
  ```

## 3. Run containers from images

- ### EC2 #1

  - Master

    ```bash
    docker run -dit --name master --network host navithu/master /bin/bash
    ```

- ### EC2 #2

  - Slave

    ```bash
    docker run -dit -e PublicIP='0.0.0.2' --name slave --network host navithu/slave /bin/bash
    ```

- ### EC2 #3

  - Slave

    ```bash
    docker run -dit -e PublicIP='0.0.0.3' --name slave --network host navithu/slave /bin/bash
    ```

---

## 4. Testing with distributed nodes

- ### EC2 #1 - Master

  - execute from master container

    ```bash
    jmeter -n -t test.jmx -Djava.rmi.server.hostname=0.0.0.1 -Dclient.rmi.localport=60000 -Jserver.rmi.ssl.disable=true -R0.0.0.2,0.0.0.3
    ```

  - export report

    **Add 'Aggregate Report' to test.jmx file and define the save location**

    ![Export-the-report](https://raw.githubusercontent.com/NavithuSriyananda/Jmeter-Testing/master/reportExport.png)

---

# Plugin Manager

## 1. Install

### > /apache-jmeter-5.3/lib>

1. `wget https://repo1.maven.org/maven2/kg/apc/cmdrunner/2.2/cmdrunner-2.2.jar`

### > /apache-jmeter-5.3/lib/ext>

1. `wget -O jmeter-plugins-manager-1.4.jar https://repo1.maven.org/maven2/kg/apc/jmeter-plugins-manager/1.4/jmeter-plugins-manager-1.4.jar`

2. `java -cp jmeter-plugins-manager-1.4.jar org.jmeterplugins.repository.PluginManagerCMDInstaller`

3. Add to path `PATH="$PATH:$HOME/jmeter/apache-jmeter-5.3/bin/PluginsManagerCMD.sh"`

## 2. Sample commands

```
PluginsManagerCMD.sh help

PluginsManagerCMD.sh status

PluginsManagerCMD.sh upgrades

PluginsManagerCMD.sh available

PluginsManagerCMD.sh install jpgc-fifo,jpgc-json=2.2

PluginsManagerCMD.sh install-all-except jpgc-casutg,jpgc-autostop

PluginsManagerCMD.sh uninstall jmeter-tcp,jmeter-ftp,jmeter-jdbc

PluginsManagerCMD.sh install-for-jmx /home/username/jmx/testPlan.jmx
```

---

# -Docker cheatsheet-

### -Global-

|         Description          |                       Command                       |
| :--------------------------: | :-------------------------------------------------: |
|   Install docker in linux    | `sudo apt-get update && sudo apt install docker.io` |
|      Login to dockerhub      |                   `docker login`                    |
| Set docker socket permission |        `sudo chmod 777 /var/run/docker.sock`        |
|         System reset         |              `docker system prune -a`               |
|  Create test file and save   |           `cat > test.jmx > sample text`            |

### -Images-

|       Description        |               Command               |
| :----------------------: | :---------------------------------: |
| **Build** image and tag  | `docker build -t navithu/MyImage .` |
|  **Push** to dockerhub   |   `docker push navithu/MyImage .`   |
| **Pull** from docker hub |   `docker pull navithu/MyImage .`   |
|         View all         |           `docker images`           |
|           Tag            | `docker tag 123456 navithu/MyImage` |
|          Remove          |    `docker rmi navithu/MyImage`     |
|        Remove all        |       `docker image prune -a`       |

### -Containers-

|   Description    |                            Command                             |
| :--------------: | :------------------------------------------------------------: |
|       Run        | `docker run -dit --name MyContainer navithu/MyImage /bin/bash` |
|      Start       |                   `docker start MyContainer`                   |
|       Stop       |                   `docker stop MyContainer`                    |
| Access Container |            `docker exec -it MyContainer /bin/bash`             |
|     View all     |                         `docker ps -a`                         |
|      Remove      |                    `docker rm MyContainer`                     |
|    Remove all    |                    `docker container prune`                    |
