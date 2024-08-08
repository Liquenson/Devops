# Utilizar una imagen base oficial de Ubuntu más ligera
FROM ubuntu:22.04

# Añadir metadatos de la imagen
LABEL maintainer="Liquenson Ruben"
LABEL team="DevOps"

# Instalar paquetes necesarios y limpiar archivos temporales
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    jq \
    unzip \
    wget \
    apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Descargar, descomprimir y mover los archivos del template a la carpeta de Apache en un solo paso
RUN wget -qO- https://www.free-css.com/assets/files/free-css-templates/download/page296/carvilla.zip | \
    bsdtar -xvf- -C /tmp && \
    mv /tmp/carvilla/* /var/www/html/ && \
    rm -rf /tmp/carvilla

# Crear el directorio de trabajo y establecerlo como el directorio actual
WORKDIR /pochi2

# Exponer el puerto 80 para el servidor web
EXPOSE 80

# Comando para iniciar Apache en primer plano
CMD ["apache2ctl", "-D", "FOREGROUND"]
