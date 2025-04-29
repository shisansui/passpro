#!/bin/bash

# 创建部署包
echo "Creating deployment package..."
mkdir -p deploy
cp *.html deploy/
cp README.md deploy/

# 创建压缩包
echo "Creating zip archive..."
cd deploy
zip -r ../passpro_deploy.zip *
cd ..

# 清理临时文件
echo "Cleaning up..."
rm -rf deploy

echo "Deployment package created: passpro_deploy.zip" 