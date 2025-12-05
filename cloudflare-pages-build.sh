#!/bin/bash
# Cloudflare Pages 构建脚本
# 对于静态网站，只需要确保 index.html 存在即可

echo "Building static site..."

# 检查 index.html 是否存在
if [ ! -f "index.html" ]; then
    echo "Error: index.html not found"
    echo "Please run: python excel_to_html.py first"
    exit 1
fi

echo "Build complete! Ready to deploy."

