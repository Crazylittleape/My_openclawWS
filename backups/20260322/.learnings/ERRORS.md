## [ERR-20260317-001] openclaw-devices-list

**Logged**: 2026-03-17T09:08:00+08:00
**Priority**: medium
**Status**: pending
**Area**: config

### Summary
`openclaw devices list` failed locally even though `openclaw status` succeeded.

### Error
```
gateway connect failed: Error: gateway closed (1000)
[openclaw] Failed to start CLI: Error: gateway closed (1000 normal closure): no close reason
Gateway target: ws://127.0.0.1:18789
Source: local loopback
Config: /home/ubuntu/.openclaw/openclaw.json
Bind: lan
```

### Context
- Command attempted while diagnosing Control UI / Telegram connectivity.
- Same environment could run `openclaw status` successfully.
- Suggests command-specific gateway auth/scope/handshake behavior worth revisiting.

### Suggested Fix
Compare auth/scope path used by `openclaw status` vs `openclaw devices list`; inspect local gateway token / device pairing requirements for operator CLI commands.

### Metadata
- Reproducible: unknown
- Related Files: /home/ubuntu/.openclaw/openclaw.json, /tmp/openclaw/openclaw-2026-03-17.log

---
## [ERR-20260317-002] web_search_brave_api_key_missing

**Logged**: 2026-03-17T19:28:00+08:00
**Priority**: medium
**Status**: pending
**Area**: config

### Summary
`web_search` could not be used for literature retrieval because Brave Search API key is not configured.

### Error
```
missing_brave_api_key
web_search (brave) needs a Brave Search API key. Run `openclaw configure --section web` to store it, or set BRAVE_API_KEY in the Gateway environment.
```

### Context
- Operation attempted: biomedical literature search for Journal of Hepatology papers from the last 5 years.
- This blocks the preferred search path in the deep-research workflow, requiring fallback to direct URL fetches / other sources.

### Suggested Fix
Configure Brave web search in OpenClaw (`openclaw configure --section web`) or set `BRAVE_API_KEY` in Gateway environment.

### Metadata
- Reproducible: yes
- Related Files: /home/ubuntu/.openclaw/workspace/.learnings/ERRORS.md

---
## [ERR-20260318-001] openclaw logs CLI option mismatch

**Logged**: 2026-03-18T17:56:00+08:00
**Priority**: low
**Status**: pending
**Area**: config

### Summary
Tried `openclaw logs --tail 200`, but this OpenClaw version uses `--limit` instead of `--tail`.

### Error
```
error: unknown option '--tail'
```

### Context
- Command attempted: `openclaw logs --tail 200 | grep -Ei 'telegram|context|token|error|failed|abort|overflow|limit'`
- Environment: OpenClaw 2026.3.13

### Suggested Fix
Use `openclaw logs --limit 200 --plain` on this version and consult `openclaw logs --help` before assuming tail-style flags.

### Metadata
- Reproducible: yes
- Related Files: /home/ubuntu/.openclaw/workspace/.learnings/ERRORS.md

---
## [ERR-20260321-002] web_search

**Logged**: 2026-03-21T15:55:00+08:00
**Priority**: medium
**Status**: noted
**Area**: config

### Summary
尝试搜索“人格九道”公开报告风格时，web_search 因缺少 Brave API key 无法使用。

### Error
```
missing_brave_api_key
web_search (brave) needs a Brave Search API key.
```

### Context
- Operation attempted: 用 web_search 查“人格九道 报告 风格”
- Goal: 参考竞品报告的句式与文案推进方式，继续打磨财富与职场模块

### Suggested Fix
配置 Brave API key；在未配置前，优先让用户直接提供参考链接/截图/文本，避免被搜索能力卡住。

### Metadata
- Reproducible: yes
- Related Files: N/A

---
## [ERR-20260322-001] docx_validate_command

**Logged**: 2026-03-22T14:31:30+08:00
**Priority**: low
**Status**: resolved
**Area**: docs

### Summary
DOCX validation command failed because `python` is not available in the shell; this environment uses `python3`.

### Error
```
/bin/bash: line 1: python: command not found
```

### Context
- Command attempted: `python /home/ubuntu/.openclaw/skills/docx/scripts/office/validate.py /home/ubuntu/.openclaw/workspace/杨如意_外贸业务员面试自我介绍_中英文版.docx`
- Environment: OpenClaw workspace on Ubuntu

### Suggested Fix
Use `python3` when running workspace validation scripts.

### Metadata
- Reproducible: yes
- Related Files: /home/ubuntu/.openclaw/skills/docx/scripts/office/validate.py

### Resolution
- **Resolved**: 2026-03-22T14:31:50+08:00
- **Notes**: Switched the validation command from `python` to `python3`.

---
