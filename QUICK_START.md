# 快速开始 - Cloudflare Pages 部署

## 🚀 三种部署方式（选择一种即可）

### 方式 1：直接上传（最简单）⭐

1. 确保已生成 `index.html`：
   ```bash
   python excel_to_html.py
   ```

2. 访问 https://dash.cloudflare.com/
3. 点击 **Pages** → **Create a project**
4. 选择 **Upload assets**
5. 拖拽 `index.html` 文件
6. 点击 **Deploy site**
7. 完成！🎉

### 方式 2：Git 仓库（推荐，支持自动部署）

1. 在 GitHub/GitLab 创建仓库并上传文件：
   ```bash
   git init
   git add index.html README.md .gitignore
   git commit -m "Initial commit"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. 在 Cloudflare Pages：
   - 连接 Git 仓库
   - 构建设置：
     - Framework preset: **None**
     - **Build command**: **留空**（重要！不要使用 wrangler deploy）
     - Build output directory: **/**
   - 点击部署
   
   ⚠️ **重要**：如果遇到 "Missing entry-point" 错误，请确保 Build command 为空！

### 方式 3：命令行（适合开发者）

1. 安装 Wrangler：
   ```bash
   npm install -g wrangler
   ```

2. 登录：
   ```bash
   wrangler login
   ```

3. 部署：
   ```bash
   # Windows
   deploy.bat
   
   # Linux/Mac
   chmod +x deploy.sh
   ./deploy.sh
   ```

## 📝 更新网站

修改 Excel 后重新部署：

```bash
python excel_to_html.py
# 然后按照你选择的部署方式重新部署
```

## ⚠️ 常见问题

### 错误：Missing entry-point to Worker script

**解决方法**：
1. 进入 Cloudflare Pages 项目设置
2. 找到 **Builds & deployments**
3. 将 **Build command** 设置为**空**（不要使用 `wrangler deploy`）
4. 保存并重新部署

## ❓ 需要帮助？

查看详细文档：
- `README.md` - 完整说明
- `DEPLOY.md` - 详细部署指南
- `CLOUDFLARE_PAGES_SETUP.md` - 故障排除指南

