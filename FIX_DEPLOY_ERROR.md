# 🔧 快速修复部署错误

## 问题
```
✘ [ERROR] Missing entry-point to Worker script or to assets directory
```

## ✅ 解决方法（3步）

### 步骤 1：进入 Cloudflare Pages 设置

1. 登录 https://dash.cloudflare.com/
2. 进入你的 Pages 项目
3. 点击左侧菜单的 **Settings**
4. 点击 **Builds & deployments**

### 步骤 2：修改构建配置

找到以下设置并修改：

- **Framework preset**: 选择 **None**
- **Build command**: **删除所有内容，留空** ⚠️ 这是关键！
- **Build output directory**: 设置为 `/` 或 `.`
- **Root directory**: 保持为 `/`（默认）

### 步骤 3：保存并重新部署

1. 点击 **Save**
2. 点击 **Retry deployment** 或创建新的部署

## ✅ 正确的配置示例

```
Framework preset: None
Build command: （完全留空）
Build output directory: /
Root directory: /
```

## ❌ 错误的配置

```
Build command: npx wrangler deploy  ← 不要使用这个！
```

## 为什么会出现这个错误？

Cloudflare Pages 检测到 `package.json` 后，可能会自动尝试运行构建命令。如果配置了 `wrangler deploy`，它会尝试将你的静态网站部署为 Cloudflare Worker，这是不对的。

静态网站不需要任何构建命令，Cloudflare Pages 会直接部署你的文件。

## 验证修复

部署成功后，你应该能够：
- ✅ 看到 "Success" 状态
- ✅ 访问 `.pages.dev` 域名
- ✅ 网页正常显示

## 如果还有问题

查看详细文档：`CLOUDFLARE_PAGES_SETUP.md`

