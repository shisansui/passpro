#!/bin/bash

# 配置OSS参数
OSS_ENDPOINT="oss-cn-hangzhou.aliyuncs.com"
BUCKET_NAME="your-bucket-name"
OSS_ACCESS_KEY_ID="your-access-key-id"
OSS_ACCESS_KEY_SECRET="your-access-key-secret"

# 安装OSS工具
if ! command -v ossutil &> /dev/null; then
    echo "Installing ossutil..."
    wget http://gosspublic.alicdn.com/ossutil/1.7.1/ossutil64
    chmod +x ossutil64
    sudo mv ossutil64 /usr/local/bin/ossutil
fi

# 配置OSS工具
ossutil config -e $OSS_ENDPOINT -i $OSS_ACCESS_KEY_ID -k $OSS_ACCESS_KEY_SECRET

# 上传文件到OSS
echo "Uploading files to OSS..."
ossutil cp -r . oss://$BUCKET_NAME/ --exclude "*.sh" --exclude "*.md" --exclude ".git*"

# 设置文件权限
echo "Setting file permissions..."
ossutil set-acl oss://$BUCKET_NAME/ --recursive --acl public-read

echo "Deployment completed!"
echo "Website URL: https://$BUCKET_NAME.$OSS_ENDPOINT" 