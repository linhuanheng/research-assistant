#!/bin/bash
# record-stop-time.sh — Stop hook: 记录 Claude 每次响应结束的时间戳
# 部署路径: .claude/hooks/record-stop-time.sh

STAMP_FILE="${CLAUDE_PROJECT_DIR}/.claude/.last-active"

mkdir -p "$(dirname "$STAMP_FILE")"
date -u +%s > "$STAMP_FILE"
