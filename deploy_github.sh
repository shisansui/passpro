#!/bin/bash

# 创建GitHub Pages部署包
echo "Creating GitHub Pages deployment package..."
mkdir -p docs

# 复制所有HTML文件
cp *.html docs/

# 创建404页面
echo '<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="0;url=integrated_dashboard.html">
    <title>404 - Page Not Found</title>
</head>
<body>
    <p>Page not found. Redirecting to dashboard...</p>
</body>
</html>' > docs/404.html

# 创建index.html重定向
echo '<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="0;url=integrated_dashboard.html">
    <title>智能办公控制系统</title>
</head>
<body>
    <p>Redirecting to dashboard...</p>
</body>
</html>' > docs/index.html

# 创建.nojekyll文件以禁用Jekyll处理
touch docs/.nojekyll

echo "GitHub Pages deployment package created in docs/ directory"
echo "To deploy:"
echo "1. git add docs/"
echo "2. git commit -m 'Deploy to GitHub Pages'"
echo "3. git push"
echo ""
echo "After pushing, go to your repository settings:"
echo "1. Navigate to 'Pages' section"
echo "2. Set source to 'Deploy from a branch'"
echo "3. Select 'main' branch and '/docs' folder"
echo "4. Click 'Save'"
echo ""
echo "Your site will be available at: https://[username].github.io/[repository-name]/" 