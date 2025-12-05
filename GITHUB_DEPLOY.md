# GitHub 仓库自动部署到 Cloudflare Pages

## ✅ 正确的配置步骤

### 第 1 步：在 Cloudflare Pages 中配置项目

1. 登录 https://dash.cloudflare.com/
2. 进入 **Pages** → 你的项目
3. 点击 **Settings** → **Builds & deployments**

### 第 2 步：修改构建设置（重要！）

找到以下设置并修改：

```
Framework preset: None
Build command: （完全留空，删除所有内容）
Build output directory: /
Root directory: /（默认）
```

### 第 3 步：保存设置

1. 点击 **Save**
2. 点击 **Retry deployment** 重新部署

## ⚠️ 为什么会出现错误？

Cloudflare Pages 检测到 `package.json` 后，可能会：
- 自动尝试运行 `npm install`
- 尝试运行构建命令
- 如果配置了错误的构建命令，会尝试使用 `wrangler deploy`

## ✅ 解决方案

### 方法 1：删除构建命令（推荐）

在 Cloudflare Pages 设置中：
- **Build command**: 完全留空
- **Build output directory**: `/`

### 方法 2：使用简单的构建命令

如果必须保留构建命令，设置为：
```
Build command: echo "No build needed"
Build output directory: /
```

## 📝 文件说明

- `index.html` - 主网页文件（必须提交到 Git）
- `package.json` - 已清空构建脚本，不会触发构建
- `.gitignore` - Git 忽略文件配置

## 🔄 更新网站流程

1. 修改 Excel 文件
2. 运行转换脚本：
   ```bash
   python excel_to_html.py
   ```
3. 提交更改：
   ```bash
   git add index.html
   git commit -m "Update Excel data"
   git push
   ```
4. Cloudflare Pages 会自动检测到推送并重新部署

## ✅ 验证部署

部署成功后，你应该看到：
- ✅ 构建日志显示 "Success"
- ✅ 没有 wrangler 相关错误
- ✅ 网站可以正常访问

## ❓ 如果还有问题

1. 检查 Cloudflare Pages 的构建日志
2. 确认 Build command 完全为空
3. 确认 `index.html` 文件在仓库根目录
4. 查看 `QUICK_FIX.md` 获取更多帮助

