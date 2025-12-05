# Excel 公式转换网页

这是一个将 Excel 文件转换为可编辑网页的工具，支持公式自动计算和单元格编辑功能。

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

## 部署到 Cloudflare Pages（GitHub 自动部署）

### 重要配置

1. **在 Cloudflare Pages 设置中**：
   - Framework preset: **None**
   - **Build command**: **完全留空** ⚠️
   - Build output directory: **/**
   - Root directory: **/**

2. **提交代码到 GitHub**：
   ```bash
   git add .
   git commit -m "Initial commit"
   git push
   ```

3. Cloudflare Pages 会自动检测到推送并部署

### ⚠️ 常见错误修复

如果遇到 "Missing entry-point" 或 "compatibility_date" 错误：

1. 进入 Cloudflare Pages 项目设置
2. Settings → Builds & deployments
3. **删除 Build command 中的所有内容**（留空）
4. 保存并重新部署

详细说明请查看：`GITHUB_DEPLOY.md`

## 更新网站

修改 Excel 后：
```bash
python excel_to_html.py
git add index.html
git commit -m "Update data"
git push
```

Cloudflare Pages 会自动重新部署。

## 文件说明

- `index.html` - 主网页文件（需要部署）
- `excel_to_html.py` - Python 转换脚本（本地使用）
- `1.xlsx` - Excel 源文件（本地使用）

