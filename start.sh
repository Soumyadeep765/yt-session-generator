#!/bin/bash

set -e  # Exit on error
set -x  # Print each command

echo "🔧 Installing Chromium and dependencies..."

# Update and install dependencies
apt-get update && apt-get install -y \
    chromium-browser \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libgdk-pixbuf2.0-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    wget \
    curl

# Optional: define Chromium path explicitly for nodriver
CHROMIUM_PATH=$(which chromium-browser || which chromium || echo "/usr/bin/chromium-browser")

if [ ! -f "$CHROMIUM_PATH" ]; then
  echo "❌ Chromium installation failed or path not found!"
  exit 1
fi

echo "✅ Chromium installed at $CHROMIUM_PATH"

# Run your Python script with the correct path
echo "🚀 Running potoken-generator..."
python3 potoken-generator.py
