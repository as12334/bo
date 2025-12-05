@echo off
REM Cloudflare Pages 构建脚本 (Windows)
REM 对于静态网站，只需要确保 index.html 存在即可

echo Building static site...

REM 检查 index.html 是否存在
if not exist "index.html" (
    echo Error: index.html not found
    echo Please run: python excel_to_html.py first
    exit /b 1
)

echo Build complete! Ready to deploy.

