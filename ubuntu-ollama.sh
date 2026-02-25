#!/usr/bin/env bash
set -euo pipefail
set -x 
# Install Ollama (works on Ubuntu, Debian, Fedora, Arch, etc.)
curl -fsSL https://ollama.com/install.sh | sh
# download first, then run
ollama pull llama3.1:8b
ollama run llama3.1:8b
