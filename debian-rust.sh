#!/usr/bin/env bash
set -x

 # 1. Remove the distro Rust if installed via apt (optional but clean)
sudo apt remove --purge rustc cargo

# 2. Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# 3. Follow the prompts (default install is fine), then reload your shell
source "$HOME/.cargo/env"

# 4. Verify you now have a current version
cargo --version   # should be 1.85+
rustc --version
