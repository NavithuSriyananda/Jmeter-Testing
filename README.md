# Jmeter-Testing

Distributed node testing with jmeter

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
