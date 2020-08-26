# Jmeter-Testing

## -Docker cheatsheet-

### Images

|       Description        |                  Command                   |
| :----------------------: | :----------------------------------------: |
| **Build** image and tag  | `docker build -t navithu/MyImage:latest .` |
|  **Push** to dockerhub   |   `docker push navithu/MyImage:latest .`   |
| **Pull** from docker hub |   `docker pull navithu/MyImage:latest .`   |
|         View all         |              `docker images`               |
|           Tag            |    `docker tag 123456 navithu/MyImage`     |
|          Remove          |        `docker rmi navithu/MyImage`        |
|        Remove all        |          `docker image prune -a`           |

### Containers

| Description |                            Command                             |
| :---------: | :------------------------------------------------------------: |
|  View all   |                         `docker ps -a`                         |
|     Run     | `docker run -dit --name MyContainer navithu/MyImage /bin/bash` |
|    Start    |                   `docker start MyContainer`                   |
|    Stop     |                   `docker stop MyContainer`                    |
|   Remove    |                         `docker ps -a`                         |
| Remove all  |                    `docker container prune`                    |

### Global

|      Description       |            Command             |
| :--------------------: | :----------------------------: |
|   Login to dockerhub   |         `docker login`         |
|      System reset      |    `docker system prune -a`    |
| Create a file and save | `cat > test.jmx > sample text` |

---

## Tools Used

- apache-jmeter-5.3
- openjdk-8-jdk
- docker

---

## Run containers from images

### EC2-01 - Master

```bash
docker run -dit --name master -p 60000:60000 navithu/master /bin/bash
```

### EC2-02 - Slave

```bash
docker run -dit -e PublicIP='52.10.0.2' -p 1099:1099 -p 50000:50000 navithu/slave /bin/bash
```

### EC2-03 - Slave

```bash
docker run -dit -e PublicIP='52.10.0.3' -p 1099:1099 -p 50000:50000 navithu/slave /bin/bash
```

---

## Testing with distributed nodes

### EC2-01 - Master

```bash
jmeter -n -t test.jmx -Djava.rmi.server.hostname=52.10.0.1 -Dclient.rmi.localport=60000 -R52.10.0.2,52.10.0.3
```

---
