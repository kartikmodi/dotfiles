#!/usr/bin/env bash
set -e

git clone https://github.com/ggml-org/llama.cpp.git
cd llama.cpp
/usr/bin/cmake -B llama.cpp/build -DGGML_CUDA=on -DCMAKE_CUDA_ARCHITECTURES=86
/usr/bin/cmake --build llama.cpp/build/ --config Release -j$(nproc)

mkdir -p ~/.local/bin/llama-cpp
cp llama.cpp/build/bin/* ~/.local/bin/llama-cpp

./llama-server -hf unsloth/gemma-3-12b-it-GGUF:Q4_K_M --n-gpu-layers 48  --threads 2  --ctx-size 8192 --host 0.0.0.0 --port 7000