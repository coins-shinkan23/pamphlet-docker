FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
COPY docker-entrypoint.sh /tmp/
RUN mv /tmp/docker-entrypoint.sh /usr/bin/docker-entrypoint.sh; \
    chmod +x /usr/bin/docker-entrypoint.sh;
RUN apt-get update -y && apt-get install -y poppler-utils
RUN opam update && \
    opam install satysfi-fss
RUN eval $(opam env) && \
    satyrographos install
RUN echo "eval $(opam env)" >> ~/.bashrc
ENTRYPOINT ["bash"]
