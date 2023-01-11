FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
COPY docker-entrypoint.sh /tmp/
RUN mv /tmp/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh && \
    chmod +x /usr/bin/docker-entrypoint.sh && \
    apt-get update -y && \
    apt-get install -y poppler-utils && \
    opam update && \
    opam install satysfi-fss && \
    eval $(opam env) && \
    satyrographos install
ENTRYPOINT ["docker-entrypoint.sh"]