#!/bin/bash

# install.sh — sets up the Raycast script command in one step.
# Run from the repo root: bash install.sh

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
RAYCAST_SCRIPTS_DIR="$HOME/raycast-scripts"

echo "Setting up rn-simulator-scripts..."

# 1. Create ~/raycast-scripts if it doesn't exist
if [ ! -d "$RAYCAST_SCRIPTS_DIR" ]; then
  mkdir -p "$RAYCAST_SCRIPTS_DIR"
  echo "Created $RAYCAST_SCRIPTS_DIR"
fi

# 2. Symlink reload-sim.sh so updates from git pull are picked up automatically
RELOAD_SCRIPT_TARGET="$RAYCAST_SCRIPTS_DIR/reload-sim.sh"
if [ -L "$RELOAD_SCRIPT_TARGET" ] || [ -f "$RELOAD_SCRIPT_TARGET" ]; then
  rm "$RELOAD_SCRIPT_TARGET"
fi
ln -s "$REPO_DIR/scripts/reload-sim.sh" "$RELOAD_SCRIPT_TARGET"
echo "Linked scripts/reload-sim.sh -> $RELOAD_SCRIPT_TARGET"

# 3. Symlink the Raycast script command
RAYCAST_SCRIPT_TARGET="$RAYCAST_SCRIPTS_DIR/reload-ios-simulator.sh"
if [ -L "$RAYCAST_SCRIPT_TARGET" ] || [ -f "$RAYCAST_SCRIPT_TARGET" ]; then
  rm "$RAYCAST_SCRIPT_TARGET"
fi
ln -s "$REPO_DIR/raycast/reload-ios-simulator.sh" "$RAYCAST_SCRIPT_TARGET"
echo "Linked raycast/reload-ios-simulator.sh -> $RAYCAST_SCRIPT_TARGET"

# 4. Ensure scripts are executable
chmod +x "$REPO_DIR/scripts/reload-sim.sh"
chmod +x "$REPO_DIR/raycast/reload-ios-simulator.sh"

echo ""
echo "Done! One manual step remaining:"
echo ""
echo "  1. Raycast will open → go to Extensions > Script Commands"
echo "  2. Click 'Add Directory' and select: $RAYCAST_SCRIPTS_DIR"
echo "  3. Search 'Reload iOS Simulator' in Raycast — you're done."
echo ""

# 5. Open Raycast script commands settings
open "raycast://extensions/raycast/script-commands/index" 2>/dev/null \
  || open -a Raycast 2>/dev/null \
  || echo "Open Raycast manually and add the directory above."
