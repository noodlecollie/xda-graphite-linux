#! /usr/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd "$SCRIPT_DIR"

# Make sure buildroot is cloned and on the correct tag
git submodule update --init --recursive

# Symlink the config we will use for buildroot (we track this)
ln -s "$SCRIPT_DIR/config/buildroot_config" "$SCRIPT_DIR/buildroot/.config"
