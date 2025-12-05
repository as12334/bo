# Cloudflare Pages 静态网站部署指南

## ✅ 正确的配置步骤

### 第 1 步：准备文件

确保 `index.html` 文件已生成：
```bash
python excel_to_html.py
```

### 第 2 步：推送到 GitHub

```bash
git add index.html README.md .gitignore
git commit -m "Deploy static site"
git push
```

### 第 3 步：在 Cloudflare Pages 中配置

1. 登录 https://dash.cloudflare.com/
2. 进入 **Pages** → 你的项目（或创建新项目）
3. 点击 **Settings** → **Builds & deployments**

### 第 4 步：修改构建设置（关键！）

找到以下设置并修改：

```
Framework preset: None
Build command: （完全留空，删除所有内容）
Build output directory: /
Root directory: /（默认）
```

### 第 5 步：保存并部署

1. 点击 **Save**
2. 如果已有部署，点击 **Retry deployment**
3. 或者等待下一次 Git push 自动部署

## ⚠️ 常见错误修复

### 错误 1：Missing entry-point / compatibility_date

**原因**：Cloudflare Pages 尝试使用 `wrangler deploy`

**解决方法**：
- 进入 Settings → Builds & deployments
- 将 **Build command** 完全清空（留空）
- 保存并重新部署

### 错误 2：Build failed

**原因**：配置了错误的构建命令

**解决方法**：
- 确认 Build command 完全为空
- 确认 Build output directory 为 `/`

## ✅ 正确的配置示例

```
Framework preset: None
Build command: （完全留空）
Build output directory: /
Root directory: /
```

## ❌ 错误的配置示例

```
Build command: npx wrangler deploy  ← 错误！
Build command: npm run build         ← 错误！
Build command: wrangler deploy       ← 错误！
```

## 📝 验证部署

部署成功后：
- ✅ 构建日志显示 "Success"
- ✅ 没有 wrangler 相关错误
- ✅ 可以访问 `.pages.dev` 域名
- ✅ 网站功能正常

## 🔄 更新流程

1. 修改 Excel 文件
2. 运行转换脚本：
   ```bash
   python excel_to_html.py
   ```
3. 提交更改：
   ```bash
   git add index.html
   git commit -m "Update data"
   git push
   ```
4. Cloudflare Pages 自动部署

## 💡 提示

- 静态网站不需要任何构建步骤
- Cloudflare Pages 会直接部署 `index.html` 文件
- 确保 `index.html` 在仓库根目录

