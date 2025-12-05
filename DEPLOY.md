# Cloudflare Pages 部署指南

## 快速部署步骤

### 1. 准备文件

确保 `index.html` 文件已生成：
```bash
python excel_to_html.py
```

### 2. 选择部署方式

#### 方式 A：通过 GitHub/GitLab 部署（推荐）

**优点**：自动部署、版本控制、易于更新

1. 在 GitHub/GitLab 创建新仓库
2. 上传文件：
   ```bash
   git init
   git add index.html README.md .gitignore
   git commit -m "Initial commit"
   git branch -M main
   git remote add origin https://github.com/yourusername/your-repo.git
   git push -u origin main
   ```

3. 在 Cloudflare Pages：
   - 登录 https://dash.cloudflare.com/
   - Pages → Create a project → Connect to Git
   - 选择仓库
   - 构建设置：
     - Framework preset: **None**
     - Build command: （留空）
     - Build output directory: **/** 或 **.**
   - 点击 **Save and Deploy**

#### 方式 B：直接上传文件

**优点**：简单快速

1. 登录 Cloudflare Dashboard
2. Pages → Create a project → Upload assets
3. 拖拽 `index.html` 文件
4. 点击 Deploy site

#### 方式 C：使用 Wrangler CLI

**优点**：命令行操作，适合自动化

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
   wrangler pages deploy .
   ```

## 配置说明

### 构建配置（⚠️ 重要）

Cloudflare Pages 构建设置：
- **Framework preset**: **None**（静态网站）
- **Build command**: **留空** 或 `echo "No build needed"`（不要使用 `wrangler deploy`）
- **Build output directory**: `/` 或 `.`（根目录）
- **Root directory**: `/`（默认）

### ⚠️ 常见错误修复

如果遇到 "Missing entry-point" 错误：

1. **检查构建命令**：确保 Build command 为空或简单的 echo 命令
2. **不要使用 wrangler deploy**：这是用于 Workers 的，不适合静态网站
3. **确保输出目录正确**：Build output directory 应该是 `/`

### 环境变量

通常不需要环境变量，因为这是一个纯静态网站。

## 自定义域名

部署后可以添加自定义域名：

1. 在 Cloudflare Pages 项目设置中
2. 点击 **Custom domains**
3. 添加你的域名
4. 按照提示配置 DNS

## 更新网站

### 如果使用 Git 部署：

```bash
# 更新 Excel 数据
python excel_to_html.py

# 提交更改
git add index.html
git commit -m "Update data"
git push

# Cloudflare 会自动部署
```

### 如果使用直接上传：

1. 重新运行 `python excel_to_html.py`
2. 在 Cloudflare Pages 中重新上传 `index.html`

## 故障排除

### ❌ 错误：Missing entry-point to Worker script

**原因**：Cloudflare Pages 尝试使用 `wrangler deploy` 部署为 Worker

**解决方法**：
1. 进入 Cloudflare Pages 项目设置
2. 找到 **Builds & deployments** 设置
3. 将 **Build command** 设置为空或 `echo "No build needed"`
4. 确保 **Build output directory** 为 `/`
5. 保存并重新部署

### 页面显示空白

- 检查文件编码是否为 UTF-8
- 检查浏览器控制台是否有错误
- 确认 `index.html` 文件完整
- 检查文件是否在仓库根目录

### 公式不计算

- 检查浏览器是否支持 JavaScript
- 打开浏览器开发者工具查看错误信息
- 确认数据格式正确

### 部署失败

- 检查文件大小（Cloudflare Pages 有文件大小限制）
- 确认文件路径正确
- 检查构建日志中的错误信息
- **确保 Build command 为空**（这是最常见的问题）

## 性能优化建议

1. **压缩 HTML**：可以使用工具压缩 `index.html` 文件
2. **CDN**：Cloudflare Pages 自动使用全球 CDN
3. **缓存**：Cloudflare 会自动缓存静态资源

## 支持

如有问题，请检查：
- [Cloudflare Pages 文档](https://developers.cloudflare.com/pages/)
- [Wrangler CLI 文档](https://developers.cloudflare.com/workers/wrangler/)

