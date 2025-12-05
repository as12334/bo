# Cloudflare Pages 正确配置指南

## ⚠️ 重要：修复部署错误

如果遇到 "Missing entry-point" 错误，请按以下步骤配置：

## 方法一：修改 Cloudflare Pages 构建设置（推荐）

1. 登录 Cloudflare Dashboard
2. 进入你的 Pages 项目
3. 点击 **Settings** → **Builds & deployments**
4. 修改构建配置：
   - **Build command**: 留空 或 设置为 `echo "No build needed"`
   - **Build output directory**: `/` 或 `.`（根目录）
   - **Root directory**: `/`（默认）
5. 保存设置
6. 重新部署

## 方法二：使用正确的构建命令

如果必须使用构建命令，设置为：

**Build command**: `echo "Static site ready"`

**Build output directory**: `/`

## 方法三：删除构建命令（最简单）

1. 在 Cloudflare Pages 设置中
2. 将 **Build command** 设置为空
3. 将 **Build output directory** 设置为 `/`
4. 保存并重新部署

## 为什么会出现这个错误？

Cloudflare Pages 检测到 `package.json` 后，可能会尝试运行构建命令。如果配置了 `wrangler deploy`，它会尝试部署为 Worker，而不是静态网站。

## 正确的配置

对于纯静态网站（只有 HTML/CSS/JS），Cloudflare Pages 应该：

✅ **Build command**: （留空）
✅ **Build output directory**: `/`
✅ **Root directory**: `/`

不需要：
❌ wrangler deploy
❌ npm run build
❌ 任何构建步骤

## 验证部署

部署成功后，你应该能够：
- 访问 Cloudflare 提供的 `.pages.dev` 域名
- 看到网页正常显示
- 所有功能正常工作

## 如果仍然有问题

1. 确保 `index.html` 文件在仓库根目录
2. 检查文件编码为 UTF-8
3. 查看构建日志中的错误信息
4. 尝试手动上传 `index.html` 文件测试

