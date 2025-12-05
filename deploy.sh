#!/bin/bash
# Cloudflare Pages 快速部署脚本

echo "🚀 准备部署到 Cloudflare Pages..."

# 检查 index.html 是否存在
if [ ! -f "index.html" ]; then
    echo "❌ 错误: 找不到 index.html 文件"
    echo "请先运行: python excel_to_html.py"
    exit 1
fi

# 检查是否安装了 wrangler
if ! command -v wrangler &> /dev/null; then
    echo "📦 未检测到 Wrangler CLI"
    echo "请先安装: npm install -g wrangler"
    echo ""
    echo "或者使用以下方式部署:"
    echo "1. 通过 Git 仓库连接 Cloudflare Pages"
    echo "2. 直接在 Cloudflare Dashboard 上传 index.html"
    exit 1
fi

# 部署
echo "📤 正在部署..."
wrangler pages deploy .

echo "✅ 部署完成！"
echo "🌐 你的网站应该已经上线了"

