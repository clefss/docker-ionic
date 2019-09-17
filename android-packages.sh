#!/bin/bash
set -Eeuo pipefail

packages=("build-tools;29.0.2"
    "platforms;android-28")


for package in "${packages[@]}"; do
    echo "Installing $package"
    echo yes | $ANDROID_HOME/tools/bin/sdkmanager "$package"
done

exec "$@"
