FROM ghcr.io/amutake/satysfi-base-image:opam-2.1.3-ocaml-4.14.0

ENV SATYSFI_VERSION=0.0.7-26-g9f4b68ec
ENV SATYROGRAPHOS_VERSION=0.0.2.11
ENV SATYSFI_PACKAGES="satysfi-fss \
                      satysfi-azmath \
                      satysfi-easytable \
                      satysfi-enumitem \
                      satysfi-colorbox \
                      satysfi-figbox \
                      satysfi-image \
                      satysfi-latexcmds \
                      satysfi-quotation \
                      satysfi-ruby \
                      satysfi-siunitx \
                      satysfi-uline \
                      satysfi-class-coins-shinkan23-pamphlet"
ENV SATYSFI_CLASS_COINS_SHINKAN23_PAMPHLET_URL="https://github.com/coins-shinkan23/satysfi-class-coins-shinkan23-pamphlet.git"
ENV SATYROGRAPHOS_EXPERIMENTAL=1

RUN opam update && \
    apt-get update && \
    apt-get install -y poppler-utils && \
    opam pin satysfi-class-coins-shinkan23-pamphlet ${SATYSFI_CLASS_COINS_SHINKAN23_PAMPHLET_URL} && \
    opam install satysfi.${SATYSFI_VERSION} \
                 satysfi-dist.${SATYSFI_VERSION} \
                 satyrographos.${SATYROGRAPHOS_VERSION} \
                 ${SATYSFI_PACKAGES} && \
    rm -rf /var/lib/apt/lists/* && \
    opam exec -- satyrographos install

RUN mkdir /workspace
WORKDIR /workspace
ENTRYPOINT ["opam", "exec", "--"]