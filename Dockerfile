FROM ubuntu
LABEL maintainer="Liquenson Ruben"
LABEL Team="DevOps"

RUN apt-get update -y && \
    apt-get install -y \
    git \
    jq \
    unzip \
    wget \
    apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip && \
    unzip carvilla.zip -d carvilla && \
    cp -rf carvilla/* /var/www/html && \
    rm carvilla.zip

RUN mkdir -p /pochi2
WORKDIR /pochi2

EXPOSE 80