# Home-Assistant-Matter-Hub

!["Home-Assistant-Matter-Hub"](./packages/docs/assets/hamh-logo-small.png)

---

> [!IMPORTANT]  
> ⚠️ **Maintainer Wanted**
>
> This project (*Home-Assistant-Matter-Hub*) is currently **looking for a new maintainer**.  
> Due to limited time, I can no longer actively maintain it.
>
> 👉 If you are interested in taking over or co-maintaining, please reach out via [GitHub Discussions](https://github.com/t0bst4r/home-assistant-matter-hub/discussions/825) or my profile.

---

## About

This project simulates bridges to publish your entities from Home Assistant to any Matter-compatible controller like
Alexa, Apple Home or Google Home. Using Matter, those can be connected easily using local communication without the need
of port forwarding etc.

---

## Documentation

Please see the [documentation](https://t0bst4r.github.io/home-assistant-matter-hub) for installation instructions,
known issues, limitations and guides.

---

## Docker 部署指南 (Docker Deployment Guide)

### 1. 快速启动 (Quick Start)
使用以下命令快速启动容器：

```bash
docker run -d \
  --name ha-matter-hub \
  --network host \
  -v /DATA/AppData/ha-matter-hub:/data \
  -e HAMH_HOME_ASSISTANT_URL="http://YOUR_HA_IP:8123" \
  -e HAMH_HOME_ASSISTANT_ACCESS_TOKEN="YOUR_LONG_LIVED_ACCESS_TOKEN" \
  ghcr.io/symi-daguo/home-assistant-matter-hub:latest
```

### 2. 环境变量 (Environment Variables)
- `HAMH_HOME_ASSISTANT_URL`: Home Assistant 的访问地址。
- `HAMH_HOME_ASSISTANT_ACCESS_TOKEN`: HA 的长期访问令牌（在 HA 用户个人资料页生成）。
- `HAMH_STORAGE_LOCATION`: 数据存储路径，默认为 `/data`。

---

## CasaOS 一键部署 (CasaOS One-Click)
本项目已针对 CasaOS 优化。您可以直接导入 `casaos-app.yml` 文件进行安装，或在应用商店中搜索。

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
   GitHub Actions 会自动检测到更新并重新构建 Docker 镜像。

---

## 注意事项 (Important Notes)
- **NPM 发布已禁用**：本项目已禁用自动向 npm 官方仓库发布包的功能，专注于通过 Docker 提供稳定可靠的服务。
- **构建报错处理**：如果您看到关于 `npm publish` 的 E404 错误，可以忽略。我们已将发布流程改为仅生成 GitHub Release 和 Docker 镜像。

---
