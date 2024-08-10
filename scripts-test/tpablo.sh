#!/bin/bash

# Ejecutar el comando y capturar la salida y el código de salida
output=$(docker images --format "{{.Repository}}" | tail -n +2)
exit_code=$?

# Comprobar el código de salida
if [ $exit_code -ne 0 ]; then
  echo "Error al obtener la lista de imágenes Docker."
  exit $exit_code
fi

# Mostrar la salida si no hay error
echo "$output"
