#!/bin/bash

# Sends a JS bundle reload signal via Metro's HTTP API.
# Equivalent to pressing Cmd+R in the simulator or 'r' in Metro terminal.
# Requires Metro bundler to be running (yarn start / npx react-native start).

METRO_PORT="${METRO_PORT:-8081}"
METRO_URL="http://localhost:$METRO_PORT/reload"

STATUS=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$METRO_URL" 2>&1)

if [ "$STATUS" = "200" ]; then
  echo "React Native bundle reloaded."
else
  echo "Failed to reach Metro at $METRO_URL (status: $STATUS). Is Metro running?"
  exit 1
fi
