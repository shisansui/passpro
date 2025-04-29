# 智能办公控制系统部署说明

## 项目概述
这是一个智能办公控制系统的前端项目，包含以下主要功能：
- 门禁管理
- 会议室管理
- 会议预约
- 产品展示
- 个人中心

## 部署要求
- Web服务器（如 Nginx、Apache）
- 支持 HTTPS（推荐）
- 现代浏览器支持

## 部署步骤

1. 将部署包中的所有文件上传到Web服务器的根目录或指定目录

2. 配置Web服务器（以Nginx为例）：
```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    root /path/to/deploy;
    index integrated_dashboard.html;
    
    # 启用gzip压缩
    gzip on;
    gzip_types text/html text/css application/javascript;
    
    # 缓存控制
    location ~* \.(html)$ {
        expires 1h;
        add_header Cache-Control "public, no-transform";
    }
    
    # 处理单页应用路由
    location / {
        try_files $uri $uri/ /integrated_dashboard.html;
    }
}
```

3. 配置HTTPS（推荐）：
```nginx
server {
    listen 443 ssl;
    server_name your-domain.com;
    
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;
    
    # 其他配置同上
}
```

## 注意事项
1. 确保所有HTML文件在同一目录下
2. 检查所有页面间的链接是否正确
3. 建议启用HTTPS以提升安全性
4. 配置适当的缓存策略以提升性能

## 文件说明
- `integrated_dashboard.html`: 主控制面板
- `access_control.html`: 门禁管理页面
- `meeting_room_management.html`: 会议室管理页面
- `meeting_reservation.html`: 会议预约页面
- `products.html`: 产品展示页面
- `profile.html`: 个人中心页面

## 技术支持
如有部署问题，请联系技术支持团队。 