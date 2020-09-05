#! /bin/bash
# Run command to allocate the default or custom system resources (memory) to JMeter at 'docker run'
sed -i 's/\("${HEAP:="\)\(.*\)\("}"\)/\1-Xms'256m' -Xmx'512m' -XX:MaxMetaspaceSize='1024m'\3/' ${JMETER_BIN}/jmeter

exec "$@"