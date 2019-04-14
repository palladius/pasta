#!/bin/bash
set -e # Exit on fail
echo "===== BEGINNING API SETUP ====="

# Change to rails project directory
cd /root/api

# Ensure all gems installed.
echo "===== CHECKING STATUS OF BUNDLE ====="
bundle check || bundle install --binstubs="$BUNDLE_BIN"

