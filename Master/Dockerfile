# Use base image
FROM navithu/base

# Ports to be exposed from the container for JMeter Master
EXPOSE 60000

# Set default values for allocation of system resources (memory) which will be used by JMeter
# xmn - Minimum java heap size.
# xmx - Maximum java heap size.
# MaxMetaspaceSize - Maximum size of the Metaspace.
ENV Xmn 512m
ENV Xmx 512m
ENV MaxMetaspaceSize 1024m

COPY entrypoint.sh /
RUN dos2unix entrypoint.sh
RUN chmod +x ./entrypoint.sh

# Application to run on starting the container
ENTRYPOINT ["/entrypoint.sh"]