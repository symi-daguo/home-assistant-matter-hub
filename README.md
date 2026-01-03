# Home Assistant Matter Hub

![Home-Assistant-Matter-Hub](https://t0bst4r.github.io/home-assistant-matter-hub/build/hamh-logo-small-8718e963b2820b8f0b0515e2d9b78182.png)

---

## 🌐 Language / 语言
- **English**
- [简体中文](./README_zh.md)

---

## About
This project simulates bridges to publish your entities from Home Assistant to any Matter-compatible controller like Alexa, Apple Home, or Google Home. Using Matter, those can be connected easily using local communication without the need for port forwarding.

## Documentation
Please see the [official documentation](https://t0bst4r.github.io/home-assistant-matter-hub) for detailed instructions.

## Docker Deployment

### 1. Quick Start
Run the following command to start the container:

```bash
docker run -d \
  --name ha-matter-hub \
  --network host \
  -v /DATA/AppData/ha-matter-hub:/data \
  -e HAMH_HOME_ASSISTANT_URL="http://YOUR_HA_IP:8123" \
  -e HAMH_HOME_ASSISTANT_ACCESS_TOKEN="YOUR_TOKEN" \
  ghcr.io/symi-daguo/home-assistant-matter-hub:latest
```

### 2. Environment Variables
- `HAMH_HOME_ASSISTANT_URL`: Your Home Assistant URL.
- `HAMH_HOME_ASSISTANT_ACCESS_TOKEN`: Long-lived access token from HA.
- `HAMH_STORAGE_LOCATION`: Path for persistent data (default: `/data`).

---

## CasaOS One-Click Deployment
This project is optimized for CasaOS. You can import the `casaos-app.yml` file for a one-click installation.

**Important:**
- **Network Mode**: Must be set to `Host` to ensure Matter mDNS discovery works correctly.
- **Storage**: Ensure the mounted `/data` directory has appropriate permissions.

---

## Sync with Upstream
To keep your fork up to date with the original [t0bst4r](https://github.com/t0bst4r/home-assistant-matter-hub) repository:

1. **Add upstream remote:**
   ```bash
   git remote add upstream https://github.com/t0bst4r/home-assistant-matter-hub.git
   ```

2. **Fetch and merge updates:**
   ```bash
   git fetch upstream
   git merge upstream/main
   ```

3. **Push to your repository to trigger auto-build:**
   ```bash
   git push origin main
   ```

---

## Important Notes
- **NPM Publish Disabled**: Automatic publishing to npm has been disabled to focus on Docker distribution.
- **GitHub Actions**: All builds and image pushes are handled automatically by GitHub Actions.
- **Image Namespace**: Images are hosted at `ghcr.io/symi-daguo/home-assistant-matter-hub`.
