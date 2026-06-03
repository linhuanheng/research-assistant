#!/bin/bash
# check-idle-trigger.sh — UserPromptSubmit hook: 检测空闲超时，写入 recorder 触发标记
# 部署路径: .claude/hooks/check-idle-trigger.sh

STAMP_FILE="${CLAUDE_PROJECT_DIR}/.claude/.last-active"
TRIGGER_FILE="${CLAUDE_PROJECT_DIR}/.claude/.trigger-recorder"
IDLE_THRESHOLD_SECONDS=$((30 * 60))  # 30 分钟

# 无历史时间戳则初始化
if [ ! -f "$STAMP_FILE" ]; then
  date -u +%s > "$STAMP_FILE"
  exit 0
fi

LAST=$(cat "$STAMP_FILE")
NOW=$(date -u +%s)
ELAPSED=$((NOW - LAST))

if [ "$ELAPSED" -ge "$IDLE_THRESHOLD_SECONDS" ]; then
  echo "idle=${ELAPSED}s, triggering recorder" >&2
  date -u +%s > "$TRIGGER_FILE"
else
  # 未超时，清除可能残留的旧标记
  rm -f "$TRIGGER_FILE"
fi
