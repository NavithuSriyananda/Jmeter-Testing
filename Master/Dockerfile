# Use base image
FROM navithu/base

# Ports to be exposed from the container for JMeter Master
EXPOSE 60000

COPY entrypoint.sh /

RUN chmod +x ./entrypoint.sh

# Application to run on starting the container
ENTRYPOINT ["/entrypoint.sh"]