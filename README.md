# rn-simulator-scripts

Utility scripts to speed up React Native development on iOS simulator — including a Raycast command to reload the JS bundle without touching your keyboard.

## How it works

Instead of pressing `Cmd+R` in the simulator or `r` in the Metro terminal, these scripts call Metro's HTTP reload endpoint directly:

```
POST http://localhost:8081/reload
```

This reloads the **React Native JS bundle only** — it does not restart the simulator or rebuild native code. Metro must be running (`yarn start` or `npx react-native start`).

---

## Scripts

### `scripts/reload-sim.sh`

Reloads the JS bundle by hitting Metro's API.

```bash
bash scripts/reload-sim.sh
```

Supports a custom Metro port via env var:

```bash
METRO_PORT=8082 bash scripts/reload-sim.sh
```

### `raycast/reload-ios-simulator.sh`

Raycast script command that triggers the reload. Search **"Reload iOS Simulator"** in Raycast to run it.

---

## Setup

### 1. Clone the repo

```bash
git clone https://github.com/jhta/rn-simulator-scripts.git
```

### 2. Make scripts executable

```bash
chmod +x scripts/reload-sim.sh
chmod +x raycast/reload-ios-simulator.sh
```

### 3. Copy the reload script to your scripts folder

The Raycast script expects `reload-sim.sh` at `~/raycast-scripts/reload-sim.sh`:

```bash
mkdir -p ~/raycast-scripts
cp scripts/reload-sim.sh ~/raycast-scripts/reload-sim.sh
```

Or symlink it if you want to keep pulling updates:

```bash
ln -s "$(pwd)/scripts/reload-sim.sh" ~/raycast-scripts/reload-sim.sh
```

### 4. Add the Raycast script directory

1. Open Raycast → `Cmd+,` → **Extensions** → **Script Commands**
2. Click **Add Directory** → select `~/raycast-scripts`
3. Raycast will auto-discover `reload-ios-simulator.sh`

> If you prefer, you can point Raycast directly at the `raycast/` folder inside the cloned repo — no need to copy anything.

### 5. Use it

- Open Raycast (`Cmd+Space`) and search **"Reload iOS Simulator"**
- Or run `bash scripts/reload-sim.sh` directly from your terminal

---

## Requirements

- macOS
- [Raycast](https://www.raycast.com/) (for the script command)
- Metro bundler running (`yarn start` / `npx react-native start`)
