# rn-simulator-scripts

Utility scripts to speed up React Native development on iOS simulator — including a Raycast command to reload the JS bundle without touching your keyboard.

## How it works

Instead of pressing `Cmd+R` in the simulator or `r` in the Metro terminal, these scripts call Metro's HTTP reload endpoint directly:

```
POST http://localhost:8081/reload
```

This reloads the **React Native JS bundle only** — it does not restart the simulator or rebuild native code. Metro must be running (`yarn start` or `npx react-native start`).

---

## Install

```bash
git clone https://github.com/jhta/rn-simulator-scripts.git
cd rn-simulator-scripts
bash install.sh
```

The script will:
- Create `~/raycast-scripts/` if it doesn't exist
- Symlink both scripts there (so `git pull` keeps them up to date)
- Open Raycast's Script Commands settings automatically

**One manual step:** in the Raycast window that opens, click **Add Directory** and select `~/raycast-scripts`.

That's it. Search **"Reload iOS Simulator"** in Raycast and run it.

---

## Usage

**From Raycast:** search `Reload iOS Simulator` → press `Enter`

**From terminal:**
```bash
bash scripts/reload-sim.sh
```

Custom Metro port:
```bash
METRO_PORT=8082 bash scripts/reload-sim.sh
```

---

## Requirements

- macOS
- [Raycast](https://www.raycast.com/)
- Metro bundler running (`yarn start` / `npx react-native start`)
