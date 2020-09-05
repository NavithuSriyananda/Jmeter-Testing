#! /bin/bash
# Run command to allocate the default or custom system resources (memory) to JMeter at 'docker run'
sed -i 's/\("${HEAP:="\)\(.*\)\("}"\)/\1-Xms'512m' -Xmx'1024m' -XX:MaxMetaspaceSize='2048m'\3/' ${JMETER_BIN}/jmeter

exec "$@"