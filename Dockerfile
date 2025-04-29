# 使用Nginx作为基础镜像
FROM nginx:alpine

# 复制网站文件到Nginx的默认目录
COPY *.html /usr/share/nginx/html/

# 复制自定义Nginx配置
COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露80端口
EXPOSE 80

# 启动Nginx
CMD ["nginx", "-g", "daemon off;"] 