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

## 部署到 Cloudflare Pages

### 方法一：通过 Git 仓库部署（推荐）

1. **创建 Git 仓库**
   ```bash
   git init
   git add index.html
   git commit -m "Initial commit"
   git remote add origin <your-repo-url>
   git push -u origin main
   ```

2. **在 Cloudflare Pages 中连接仓库**
   - 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
   - 进入 **Pages** 部分
   - 点击 **Create a project**
   - 选择 **Connect to Git**
   - 选择你的 Git 提供商（GitHub、GitLab 等）
   - 选择仓库
   - 配置构建设置：
     - **Framework preset**: None
     - **Build command**: （留空）
     - **Build output directory**: `/` 或 `.`
   - 点击 **Save and Deploy**

### 方法二：直接上传文件

1. 登录 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 进入 **Pages** 部分
3. 点击 **Create a project**
4. 选择 **Upload assets**
5. 上传 `index.html` 文件
6. 点击 **Deploy site**

### 方法三：使用 Wrangler CLI

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

## 文件说明

- `index.html` - 主网页文件（需要部署）
- `excel_to_html.py` - Python 转换脚本（本地使用）
- `1.xlsx` - Excel 源文件（本地使用）

## 注意事项

- Cloudflare Pages 只需要部署 `index.html` 文件
- Python 脚本和 Excel 文件不需要上传到 Cloudflare
- 确保 `index.html` 文件编码为 UTF-8

## 更新网站

如果修改了 Excel 文件，需要重新运行转换脚本并重新部署：

```bash
python excel_to_html.py
git add index.html
git commit -m "Update Excel data"
git push
```

Cloudflare Pages 会自动检测到更新并重新部署。

