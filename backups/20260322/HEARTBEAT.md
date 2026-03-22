# HEARTBEAT.md - 每日心跳任务

## 定时任务清单

### 每天早上 8:40
- [ ] 发送上海天气报告给主人

### 每天晚上 20:30
- [ ] 发布小红书商品笔记（微信步数工具）

### 每7天（cron: 0 9 */7 * *）
- [ ] GitHub 备份：更新记忆文件 + 生成 skill_list.md
  - 备份 memory/ 目录
  - 备份 MEMORY.md, SOUL.md, USER.md
  - 生成并上传 skill_list.md

## 检查规则
- 如果在 8:35-8:45 之间收到心跳 → 检查是否已发天气
- 如果在 20:25-20:35 之间收到心跳 → 检查是否已发小红书
- 每7天早上 9:00 → 执行 GitHub 备份
- 如果到时间未执行 → 立即执行并通知主人

## 执行方式
天气：使用 weather skill
小红书：使用 mcporter call xiaohongshu.publish_content
GitHub备份：bash /home/ubuntu/.openclaw/workspace/scripts/backup-to-github.sh

---
*主人特别强调：准时做好，千万别忘记！*