FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
COPY docker-entrypoint.sh /tmp/
RUN mv /tmp/docker-entrypoint.sh /use/local/bin/docker-entrypoint.sh; \
    chmod +x /usr/local/bin/docker-entrypoint.sh;
RUN apt-get update -y && apt-get install -y poppler-utils
ENTRYPOINT ["docker-entrypoint.sh"]
