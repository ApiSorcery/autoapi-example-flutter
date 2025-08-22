#!/bin/bash

# 设置变量
export FLUTTER_BASE_HREF="/flutter/"
# 禁用 PWA（不生成 service worker）。可选值：none|offline-first|poor-network
FLUTTER_PWA_STRATEGY="none"
REMOTE_HOST="tx01"
REMOTE_PATH="/var/projects/demo/frontend/flutter"
LOCAL_BUILD_DIR="build"
ARCHIVE_NAME="flutter_web_$(date +%Y%m%d_%H%M%S).tar.gz"

echo "开始构建 Flutter Web 应用..."

# 构建 Flutter Web 应用
flutter build web --base-href "$FLUTTER_BASE_HREF" --pwa-strategy "$FLUTTER_PWA_STRATEGY"

if [ $? -ne 0 ]; then
    echo "构建失败，退出部署"
    exit 1
fi

echo "构建完成（PWA 已禁用），开始打包..."

# 创建压缩包（直接压缩web文件夹）
tar -czf $ARCHIVE_NAME --exclude='.DS_Store' --exclude='__MACOSX' -C $LOCAL_BUILD_DIR web

if [ $? -ne 0 ]; then
    echo "打包失败，退出部署"
    exit 1
fi

echo "打包完成: $ARCHIVE_NAME"

# 上传到服务器
echo "开始上传到服务器 $REMOTE_HOST..."

# 确保远程目录存在
ssh $REMOTE_HOST "mkdir -p $REMOTE_PATH"

# 上传压缩包
scp $ARCHIVE_NAME $REMOTE_HOST:$REMOTE_PATH/

if [ $? -ne 0 ]; then
    echo "上传失败，退出部署"
    exit 1
fi

echo "上传完成，开始部署..."

# 在远程服务器上执行部署操作
ssh $REMOTE_HOST << EOF
    cd $REMOTE_PATH
    
    # 移除原有的 web 目录（如果存在）
    if [ -d "web" ]; then
        echo "移除原有 web 目录..."
        rm -rf web
    fi
    
    # 解压缩web文件夹
    echo "解压缩文件..."
    tar -xzf $ARCHIVE_NAME --warning=no-unknown-keyword
    
    # 设置权限
    chmod -R 755 web/
    
    # 清理压缩包，保留最新的和最近两次的
    echo "清理旧压缩包，保留最新的和最近两次的..."
    ls -t flutter_web_*.tar.gz 2>/dev/null | tail -n +4 | xargs -r rm -f
    
    echo "部署完成！"
EOF

if [ $? -ne 0 ]; then
    echo "远程部署失败"
    exit 1
fi

# 清理本地压缩包
rm -f $ARCHIVE_NAME

echo "部署完成！"
echo "应用已部署到: $REMOTE_HOST:$REMOTE_PATH/web/"