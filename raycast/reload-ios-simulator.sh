#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Reload iOS Simulator
# @raycast.mode silent
# @raycast.icon 📱
# @raycast.packageName React Native Dev

# Optional parameters:
# @raycast.description Reloads the React Native JS bundle via Metro's HTTP API.

SCRIPTS_DIR="$HOME/raycast-scripts"

bash "$SCRIPTS_DIR/reload-sim.sh"
