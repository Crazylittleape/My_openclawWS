## [LRN-20260316-001] correction

**Logged**: 2026-03-16T21:17:00+08:00
**Priority**: high
**Status**: pending
**Area**: docs

### Summary
小红书图片已解决方块问题，但用户要求整体风格和内容进一步活泼化，并参考同类笔记风格。

### Details
用户反馈：最新重发图片“图片是可以的，就是风格和内容可以活泼一些，你可以多学学小红书上其他人类似的笔记风格。”
这说明仅解决技术兼容（零 emoji、无方块）还不够，后续生成必须同时优化平台风格：更轻快、口语化、更像小红书常见种草/工具分享笔记。

### Suggested Action
1. 后续小红书图片维持零 emoji 方块原则。
2. 文案改为更轻松、更像平台原生内容的表达。
3. 发布前参考同类笔记常见结构：开场抓人 + 使用场景 + 简洁卖点 + 引导查看商品。
4. 视觉上保留兼容性，但提升活泼感与层次感。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/.openclaw/workspace/scripts/publish_xiaohongshu_daily.py
- Tags: xiaohongshu, style, correction, tone

---

## [LRN-20260319-001] correction

**Logged**: 2026-03-19T09:20:00+08:00
**Priority**: high
**Status**: pending
**Area**: frontend

### Summary
后台“复制最新卡密”不能只在失败时弹窗展示文本，必须优先保证尽可能写入系统剪切板。

### Details
用户反馈点击“复制最新卡密”后只是弹窗展示卡密，仍需手动复制，体验很差。原因是仅依赖 `navigator.clipboard.writeText()`，失败时直接 `alert(code)`，没有做兼容性 fallback。后续又发现一个细坑：即使写了 fallback，如果 `navigator.clipboard.writeText()` 存在但 reject，代码也必须继续尝试 fallback，不能直接跳到最外层 catch。

### Suggested Action
为后台复制功能增加双重复制策略：优先使用 `navigator.clipboard`，失败时退回 `textarea + document.execCommand('copy')`，最后才提示用户手动处理。注意 reject 时不能提前终止 fallback 链路。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/00_AI_agents/0_Program/0_Web_design/love-personality-mvp/prototype/admin.js
- Tags: clipboard, admin, ux, fallback

---

## [LRN-20260319-002] best_practice

**Logged**: 2026-03-19T09:27:00+08:00
**Priority**: high
**Status**: pending
**Area**: frontend

### Summary
“切换到新激活码”这种操作不能先清空旧激活状态，必须等新码验证成功后再切换。

### Details
用户反馈：如果已经用本次激活码完成激活，但还没开始测试，误点“我有新的激活码”会导致当前已激活模块失效。这说明该入口属于破坏性操作，却没有做成功后切换的保护逻辑。

### Suggested Action
将“输入新激活码”改成非破坏性流程：点击按钮只进入新码输入模式，不清空旧状态；只有新码真正验证成功后，才清空旧测试进度并覆盖为新的购买记录。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/00_AI_agents/0_Program/0_Web_design/love-personality-mvp/prototype/app.js
- Tags: activation, redemption, ux, destructive-action

---

## [LRN-20260319-003] correction

**Logged**: 2026-03-19T20:48:00+08:00
**Priority**: high
**Status**: pending
**Area**: automation

### Summary
改 Python 文案池时，不能把多行正文直接塞进单引号字符串；所有定时脚本修改后都必须立刻做 py_compile 校验。

### Details
在更新 `publish_xiaohongshu_daily.py` 的内容池时，把多行正文写成了单引号字符串，导致语法错误。虽然随后修复，但如果不做编译检查，20:30 定时任务会直接失效。

### Suggested Action
以后所有脚本修改后，立即运行 `python3 -m py_compile`；多行正文统一使用三引号字符串或显式 `\n` 转义。

### Metadata
- Source: self_correction
- Related Files: /home/ubuntu/.openclaw/workspace/scripts/publish_xiaohongshu_daily.py
- Tags: python, cron, xiaohongshu, validation

---

## [LRN-20260319-004] correction

**Logged**: 2026-03-19T20:51:00+08:00
**Priority**: high
**Status**: pending
**Area**: xiaohongshu_content

### Summary
小红书日更不能只做“干净、安全、可发”，还必须做出平台原生的爆款感：更强钩子、更强场景、更强情绪和封面冲击力。

### Details
用户明确反馈：刚补发的小红书笔记“图片和文案都太中规中矩和气氛严肃”，说明当前生成策略偏保守，虽然整洁，但缺少小红书原生爆款笔记常见的情绪钩子、痛点前置、口语感和封面吸睛设计。

### Suggested Action
后续生成必须把标题、正文、封面统一改成更像平台爆款：标题前置痛点/结果/人群，正文先钩子后场景再卖点，封面用更短更炸的主标题和更强视觉对比，避免“企业说明书”语气。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/.openclaw/workspace/scripts/publish_xiaohongshu_daily.py
- Tags: xiaohongshu, viral, tone, cover, copywriting

---

## [LRN-20260319-005] preference

**Logged**: 2026-03-19T20:56:00+08:00
**Priority**: high
**Status**: pending
**Area**: xiaohongshu_content

### Summary
用户偏好小红书日更采用“轻种草分享型 + 小红书女生口吻”，要更活泼可爱、带自然 emoji，不要正经严肃。

### Details
用户明确要求：文案要更像小红书女生口吻，“活泼可爱一些！有emoji，配文也好些”，并要求立刻发一条验证是否学会。

### Suggested Action
后续小红书自动发布默认使用轻种草分享型模板：标题与正文加入自然 emoji、口语化表达、宝子/分享/怕麻烦等平台语感；封面继续尽量避免 emoji 以防方块，但要更轻快可爱。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/.openclaw/workspace/scripts/publish_xiaohongshu_daily.py
- Tags: xiaohongshu, tone, emoji, feminine, preference

---

## [LRN-20260321-001] correction

**Logged**: 2026-03-21T10:50:00+08:00
**Priority**: high
**Status**: resolved
**Area**: frontend

### Summary
首页 FAQ 不能为了“静态展示”把问题标题直接隐藏，必须保证问题与答案都完整可见，并在桌面/移动端统一验证。

### Details
这次把首页 FAQ 做成了只显示答案、不显示问题的状态，用户明确指出“字都没写全，排版也丑，没有问题在那回答啥呢”。同时之前对前端状态的判断只靠肉眼推断，没有先做浏览器自检，导致页面问题没有第一时间抓到。

### Suggested Action
以后改前端信息架构时：
1. FAQ 类内容优先写成清晰的 Q/A 卡片，而不是半静态半交互的残缺样式；
2. 每次改完都用浏览器脚本跑桌面端 + 移动端自检；
3. 不要把“选择器写错造成的误判”当成页面 bug，要先验证 DOM 结构。

### Metadata
- Source: user_feedback
- Related Files: love-personality-mvp/prototype/index.html, love-personality-mvp/prototype/styles.css
- Tags: faq, frontend, mobile, self-check

### Resolution
- **Resolved**: 2026-03-21T10:52:00+08:00
- **Notes**: FAQ 已改成完整 Q/A 卡片；移动端导航滚动样式已加固；已完成桌面端/移动端 Playwright 自检。

---
## [LRN-20260321-001] correction

**Logged**: 2026-03-21T22:24:00+08:00
**Priority**: high
**Status**: pending
**Area**: docs

### Summary
用户指出参考《人格九道》PDF后产出的三大模块报告仍然“没啥很多干货，泛泛之谈”；此前改写主要学到了句式和语气，没有学到报告的内容密度与分析层次。

### Details
本次失败点不在文风，而在结构深度。人格九道真正提供的是：机制拆解、形成溯源、具体场景脚本、隐性代价、发展水平、行动练习。这些内容层次没有被系统迁移到 love/talent/career 三个模块，导致输出虽然更像“会说话”，但仍缺少可对照、可预测、可执行的干货。

### Suggested Action
重写三个模块的固定报告结构，新增：机制、场景脚本、代价审计、发展水平、可执行练习等栏目；先学结构，再写内容，不再只学“表面上……实际上……”句式。

### Metadata
- Source: user_feedback
- Related Files: /home/ubuntu/00_AI_agents/0_Program/0_Web_design/love-personality-mvp/prototype/data.js, /home/ubuntu/00_AI_agents/0_Program/0_Web_design/love-personality-mvp/prototype/app.js, /home/ubuntu/00_AI_agents/0_Program/0_Web_design/love-personality-mvp/backend/app/services/report_content_service.py
- Tags: correction, report-writing, content-density, enneatao

---
