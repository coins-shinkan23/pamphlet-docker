FROM amutake/satysfi:latest
ENV SATYROGRAPHOS_EXPERIMENTAL 1
RUN apt-get update -y && apt-get install -y poppler-utils
ENTRYPOINT ["./entrypoint.sh"]
