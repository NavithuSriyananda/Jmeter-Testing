#!/bin/bash

$JMETER_HOME/bin/jmeter-server \
    -Dserver.rmi.localport=50000 \
    -Dserver_port=1099 \
    -Djava.rmi.server.hostname=$LOCALIP

exec "$@"