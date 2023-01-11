FROM ghcr.io/amutake/satysfi-base-image:opam-2.1.3-ocaml-4.14.0
ENV SATYSFI_VERSION=0.0.7-26-g9f4b68ec
ENV SATYROGRAPHOS_VERSION=0.0.2.11
ENV SATYSFI_PACKAGES="satysfi-fss"
ENV SATYROGRAPHOS_EXPERIMENTAL=1
RUN opam update && \
    apt-get update && \
    apt-get install -y poppler-utils && \
    opam install satysfi.${SATYSFI_VERSION} satysfi-dist.${SATYSFI_VERSION} satyrographos.${SATYROGRAPHOS_VERSION} ${SATYSFI_PACKAGES} && \
    rm -rf /var/lib/apt/lists/* && \
    opam exec -- satyrographos install
RUN mkdir /workspace
WORKDIR /workspace
ENTRYPOINT ["opam", "exec", "--"]