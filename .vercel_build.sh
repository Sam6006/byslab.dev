#!/bin/bash
set -e

echo "=== Installing Hugo v0.146.0 ==="
curl -sL "https://github.com/gohugoio/hugo/releases/download/v0.146.0/hugo_extended_0.146.0_linux-amd64.tar.gz" -o /tmp/hugo.tar.gz
tar xzf /tmp/hugo.tar.gz -C /tmp
mv /tmp/hugo /usr/local/bin/hugo
chmod +x /usr/local/bin/hugo
hugo version

echo "=== Initializing submodules ==="
git submodule update --init --recursive

echo "=== Building site ==="
hugo --gc --minify
echo "=== Build complete ==="
