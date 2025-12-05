# ⚡ 快速部署指南

## 3 步部署到 Cloudflare Pages

### 步骤 1：推送到 GitHub

```bash
git add .
git commit -m "Deploy static site"
git push
```

### 步骤 2：配置 Cloudflare Pages

1. 登录 https://dash.cloudflare.com/
2. Pages → 你的项目 → **Settings** → **Builds & deployments**
3. 修改配置：
   ```
   Framework preset: None
   Build command: （完全留空）
   Build output directory: /
   ```
4. 点击 **Save**

### 步骤 3：完成！

Cloudflare Pages 会自动部署，或者点击 **Retry deployment**

## ⚠️ 重要

**Build command 必须完全留空！**

不要使用：
- ❌ `npx wrangler deploy`
- ❌ `npm run build`
- ❌ 任何构建命令

## ✅ 验证

部署成功后访问你的 `.pages.dev` 域名即可！

