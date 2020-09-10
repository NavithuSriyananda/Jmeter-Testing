#!/bin/bash
# Run command to allocate the default or custom system resources (memory) to JMeter at 'docker run'
sed -i 's/\("${HEAP:="\)\(.*\)\("}"\)/\1-Xmn'${Xmn}' -Xmx'${Xmx}' -XX:MaxMetaspaceSize='${MaxMetaspaceSize}'\3/' ${JMETER_BIN}/jmeter &&
$JMETER_HOME/bin/jmeter-server \
    -Dserver_port=$p1 \
    -Dserver.rmi.localport=$p2 \
    -Jserver.rmi.ssl.disable=true \
    -Djava.rmi.server.hostname=$PublicIP

exec "$@"