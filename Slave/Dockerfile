# Use vinsdocker base image
FROM navithu/base

# Ports to be exposed from the container for JMeter Slaves/Server
EXPOSE 1099 50000

COPY entrypoint.sh /

RUN chmod +x ./entrypoint.sh

# Application to run on starting the container
ENTRYPOINT ["/entrypoint.sh"]