FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
RUN apt-get update -y && apt-get install -y poppler-utils
RUN opam update && \
    opam install satysfi-fss
RUN eval $(opam env) && \
    satyrographos install
RUN echo "eval $(opam env)" >> ~/.bashrc
RUN echo '#!/bin/bash\nexec /bin/bash -l -c "$*"' > /entrypoint.sh && \
    chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
