#!/bin/bash

echo "== $0 =="
echo "# Showing you ruby relevant stuff.."

set -e
set -x

pwd
ruby --version
bundle --version
gem --version
gem list