#!/bin/bash

echo "Nome do script: $0"
echo "Primeiro argumento: $1"
echo "Segundo argumento: $2"
echo "Número de argumentos: $#"

# Verificando se um argumento foi fornecido
if [ $# -lt 1 ]; then
  echo "Nenhum argumento foi fornecido."
  exit 1
fi

# Iterar sobre todos os argumentos
for arg in "$@"; do
  echo "Argumento: $arg"
done
