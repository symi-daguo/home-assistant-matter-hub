# Home Assistant Matter Hub

![Home-Assistant-Matter-Hub](https://t0bst4r.github.io/home-assistant-matter-hub/build/hamh-logo-small-8718e963b2820b8f0b0515e2d9b78182.png)

---

## 🌐 语言 / Language
- [English](./README.md)
- **简体中文**

---

## 项目简介
本项目通过模拟 Matter 桥接器，将 Home Assistant 中的实体发布到任何兼容 Matter 的控制器（如 Alexa、Apple Home 或 Google Home）。通过 Matter 协议，可以实现完全本地化的通信，无需配置端口转发。

## 相关文档
详细的安装指引、已知问题和限制请参考 [官方文档](https://t0bst4r.github.io/home-assistant-matter-hub)。

## Docker 部署指南

### 1. 快速启动
使用以下命令启动容器：

```bash
docker run -d \
  --name ha-matter-hub \
  --network host \
  -v /DATA/AppData/ha-matter-hub:/data \
  -e HAMH_HOME_ASSISTANT_URL="http://你的HA_IP:8123" \
  -e HAMH_HOME_ASSISTANT_ACCESS_TOKEN="你的长期令牌" \
  ghcr.io/symi-daguo/home-assistant-matter-hub:latest
```

### 2. 环境变量
- `HAMH_HOME_ASSISTANT_URL`: Home Assistant 的访问地址。
- `HAMH_HOME_ASSISTANT_ACCESS_TOKEN`: HA 长期访问令牌（在 HA 用户个人资料页底部生成）。
- `HAMH_STORAGE_LOCATION`: 数据持久化路径（镜像内默认为 `/data`）。

---

## CasaOS 一键部署
本项目已针对 CasaOS 优化。您可以直接导入 `casaos-app.yml` 文件进行安装，或者在应用商店中搜索（如果已收录）。

**关键配置：**
- **网络模式**：必须设置为 `Host` 模式，否则 Matter 的 mDNS 设备发现将无法工作。
- **存储权限**：确保挂载的 `/data` 目录具有读写权限。

---

## 主项目同步更新
如果您想跟进原作者 [t0bst4r](https://github.com/t0bst4r/home-assistant-matter-hub) 的最新更新，请在您的本地仓库执行以下操作：

1. **添加原作者仓库为上游：**
   ```bash
   git remote add upstream https://github.com/t0bst4r/home-assistant-matter-hub.git
   ```

2. **拉取更新并合并：**
   ```bash
   git fetch upstream
   git merge upstream/main
   ```

3. **推送至您的仓库触发自动构建：**
   ```bash
   git push origin main
   ```

---

## 注意事项
- **NPM 发布**：本项目已禁用自动向 npmjs.org 发布包的功能，专注于 Docker 镜像分发。
- **构建状态**：所有的构建和镜像推送均由 GitHub Actions 自动化完成。
- **镜像命名**：镜像托管于 GitHub Container Registry (GHCR)，路径为 `ghcr.io/symi-daguo/home-assistant-matter-hub`。
