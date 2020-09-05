#!/bin/bash

$JMETER_HOME/bin/jmeter-server \
    -Dserver.rmi.localport=50000 \
    -Dserver_port=1099 \
    -Jserver.rmi.ssl.disable=true \
    -Djava.rmi.server.hostname=$PublicIP

exec "$@"