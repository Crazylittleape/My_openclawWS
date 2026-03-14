#!/bin/bash
# 自动备份记忆文件到GitHub
# 每7天执行一次

WORKSPACE_DIR="/home/ubuntu/.openclaw/workspace"
cd "$WORKSPACE_DIR" || exit 1

# 检查是否有变更
if git diff --quiet && git diff --cached --quiet; then
    echo "$(date): 没有变更需要备份"
    exit 0
fi

# 添加所有变更
git add -A

# 提交
git commit -m "自动备份: 记忆文件更新 ($(date +%Y-%m-%d %H:%M))"

# 推送到GitHub
if git push origin master; then
    echo "$(date): 备份成功"
else
    echo "$(date): 备份失败"
    exit 1
fi
