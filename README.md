# Home Assistant Matter Hub

!["Home-Assistant-Matter-Hub"](./packages/docs/assets/hamh-logo-small.png)

---

## 🌐 Language / 语言
- [English (Current)](#english)
- [简体中文](#简体中文)

---

<a name="english"></a>

## English

### About
This project simulates bridges to publish your entities from Home Assistant to any Matter-compatible controller like Alexa, Apple Home, or Google Home. Using Matter, those can be connected easily using local communication without the need for port forwarding.

### Documentation
Please see the [official documentation](https://t0bst4r.github.io/home-assistant-matter-hub) for detailed instructions.

### Docker Deployment
1. **Quick Start**:
   ```bash
   docker run -d \
     --name ha-matter-hub \
     --network host \
     -v /DATA/AppData/ha-matter-hub:/data \
     -e HAMH_HOME_ASSISTANT_URL="http://YOUR_HA_IP:8123" \
     -e HAMH_HOME_ASSISTANT_ACCESS_TOKEN="YOUR_TOKEN" \
     ghcr.io/symi-daguo/home-assistant-matter-hub:latest
   ```

2. **Environment Variables**:
   - `HAMH_HOME_ASSISTANT_URL`: Your Home Assistant URL.
   - `HAMH_HOME_ASSISTANT_ACCESS_TOKEN`: Long-lived access token from HA.
   - `HAMH_STORAGE_LOCATION`: Path for persistent data (default: `/data`).

---

<a name="简体中文"></a>

## 简体中文

### 项目简介
本项目通过模拟 Matter 桥接器，将 Home Assistant 中的实体发布到任何兼容 Matter 的控制器（如 Alexa、Apple Home 或 Google Home）。通过 Matter 协议，可以实现完全本地化的通信，无需配置端口转发。

### 相关文档
详细的安装指引、已知问题和限制请参考 [官方文档](https://t0bst4r.github.io/home-assistant-matter-hub)。

### Docker 部署指南
1. **快速启动**:
   ```bash
   docker run -d \
     --name ha-matter-hub \
     --network host \
     -v /DATA/AppData/ha-matter-hub:/data \
     -e HAMH_HOME_ASSISTANT_URL="http://你的HA_IP:8123" \
     -e HAMH_HOME_ASSISTANT_ACCESS_TOKEN="你的长期令牌" \
     ghcr.io/symi-daguo/home-assistant-matter-hub:latest
   ```

2. **环境变量**:
   - `HAMH_HOME_ASSISTANT_URL`: Home Assistant 访问地址。
   - `HAMH_HOME_ASSISTANT_ACCESS_TOKEN`: HA 长期访问令牌（在 HA 用户个人资料页生成）。
   - `HAMH_STORAGE_LOCATION`: 数据持久化路径（默认 `/data`）。

---

## CasaOS 一键部署 (CasaOS One-Click)
本项目已针对 CasaOS 优化。您可以直接导入 `casaos-app.yml` 文件进行安装。

**注意：** 必须使用 `host` 网络模式以确保 Matter 协议的 mDNS 发现功能正常工作。

---

## 主项目同步更新 (Sync with Upstream)
为了跟进原作者的更新，请按照以下步骤操作：

1. **添加原作者仓库为上游：**
   ```bash
   git remote add upstream https://github.com/t0bst4r/home-assistant-matter-hub.git
   ```

2. **拉取更新并合并：**
   ```bash
   git fetch upstream
   git merge upstream/main
   ```

3. **推送至个人仓库触发自动构建：**
   ```bash
   git push origin main
   ```

---

## 注意事项 (Important Notes)
- **NPM 发布已禁用**：本项目已禁用自动向 npm 官方仓库发布包的功能，专注于通过 Docker 提供服务。
- **GitHub Pages / Addon Repository**: 已禁用 GitHub Pages 部署和 Addon 仓库同步，以避免因权限不足导致的构建失败。
- **镜像命名**: 所有的镜像现在都将推送到 `ghcr.io/symi-daguo/home-assistant-matter-hub` 命名空间下。

---
