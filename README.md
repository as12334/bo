# Excel 公式转换网页

将 Excel 文件转换为可编辑网页的工具，支持公式自动计算和单元格编辑功能。

## 功能特点

- 📊 多工作表支持
- ✏️ 单元格可编辑
- 🔢 公式自动计算
- 💾 保留2位小数显示
- 📱 响应式设计

## 本地使用

1. 安装依赖：
```bash
pip install openpyxl
```

2. 转换 Excel 文件：
```bash
python excel_to_html.py
```

3. 在浏览器中打开 `index.html`

## 部署到 Cloudflare Pages

### 通过 GitHub 自动部署

1. **将代码推送到 GitHub**：
   ```bash
   git add .
   git commit -m "Initial commit"
   git push
   ```

2. **在 Cloudflare Pages 中配置**：
   - 登录 https://dash.cloudflare.com/
   - 进入 **Pages** → **Create a project**
   - 选择 **Connect to Git**
   - 选择你的 GitHub 仓库
   - **重要配置**：
     - Framework preset: **None**
     - **Build command**: **完全留空** ⚠️
     - Build output directory: **/**
     - Root directory: **/**
   - 点击 **Save and Deploy**

3. **完成！** Cloudflare Pages 会自动部署你的网站

### 更新网站

修改 Excel 后：
```bash
python excel_to_html.py
git add index.html
git commit -m "Update Excel data"
git push
```

Cloudflare Pages 会自动检测到更改并重新部署。

## ⚠️ 重要提示

对于静态网站，Cloudflare Pages 配置必须：
- ✅ **Build command**: 完全留空（不要使用任何构建命令）
- ✅ **Build output directory**: `/`
- ❌ **不要使用**: `wrangler deploy`（这是用于 Workers 的）
- ❌ **不要使用**: `npm run build`（不需要构建）

## 文件说明

- `index.html` - 主网页文件（需要部署）
- `excel_to_html.py` - Python 转换脚本（本地使用）
- `1.xlsx` - Excel 源文件（本地使用）
