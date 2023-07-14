FROM ubuntu
MAINTAINER Fernandez Octavio - Carrizo Bello Virginia

RUN apt-get update && apt-get install -y imagemagick-6.q16
RUN apt-get update && apt-get install -y tar
RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y gzip

COPY menu.sh /menu.sh
COPY generar.sh /generar.sh
COPY descomprimir.sh /descomprimir.sh
COPY procesar.sh /procesar.sh
COPY comprimir.sh /comprimir.sh

ENTRYPOINT ["sh","/menu.sh"]
