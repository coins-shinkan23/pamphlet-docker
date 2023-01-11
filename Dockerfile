FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
COPY docker-entrypoint.sh /tmp/
RUN pwd
RUN ls /tmp/
RUN ls /tmp/docker-entrypoint.sh
RUN ls /use/bin/
RUN mv /tmp/docker-entrypoint.sh /use/bin/docker-entrypoint.sh; \
    chmod +x /usr/bin/docker-entrypoint.sh;
RUN apt-get update -y && apt-get install -y poppler-utils
ENTRYPOINT ["docker-entrypoint.sh"]
