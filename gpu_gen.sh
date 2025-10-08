#!/bin/bash

# Usage: ./gpu_fkcc_gen.sh <robot_name>

if [ -z "$1" ]; then
    echo "Usage: ./gpu_fkcc_gen.sh <robot_name>"
    exit 1
fi

build/fkcc_gen "resources/${1}_approx.json"
build/fkcc_gen "resources/${1}_main.json"

touch "${1}.cuh"
echo 'namespace ppln::collision {' > "${1}.cuh"
cat "${1}_prrtc_approx.hh" >> "${1}.cuh"
cat "${1}_prrtc_main.hh" >> "${1}.cuh"
echo -e "\n}" >> "${1}.cuh"

echo "Generated ${1}.cuh"