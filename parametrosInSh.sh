#!/bin/bash

function show_help {
  echo "Usage: $0 -n [name] -a [age]"
  exit 1
}

# Check if any arguments were passed
if [ $# -eq 0 ]; then
  show_help
fi

while getopts "n:a:h" opt; do
  case $opt in
    n)
      name=$OPTARG
      ;;
    a)
      age=$OPTARG
      ;;
    h)
      show_help
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      show_help
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      show_help
      ;;
  esac
done

# Validate input
if [ -z "$name" ] || [ -z "$age" ]; then
  show_help
fi

echo "Name: $name"
echo "Age: $age"
