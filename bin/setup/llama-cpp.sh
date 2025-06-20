#!/usr/bin/env bash
set -e

git clone https://github.com/ggml-org/llama.cpp.git
/usr/bin/cmake -B llama.cpp/build -DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=86
/usr/bin/cmake --build llama.cpp/build/ --config Release -j$(nproc)
mkdir -p ~/.local/bin/llama-cpp
cp llama.cpp/build/bin/* ~/.local/bin/llama-cpp