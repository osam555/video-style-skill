#!/usr/bin/env bash
# video-style 스킬을 이 맥의 Claude Code 에 설치한다 (플러그인 명령을 못 쓸 때의 대안).
#   curl -fsSL https://raw.githubusercontent.com/osam555/video-style-skill/main/install.sh | bash
# 하는 일: ~/.claude/skills/video-style/SKILL.md 를 내려받아 둔다. 이미 있으면 .bak 으로 남기고 바꾼다.
set -euo pipefail
DEST="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/skills/video-style"
SRC="https://raw.githubusercontent.com/osam555/video-style-skill/main/plugins/video-style/skills/video-style/SKILL.md"
mkdir -p "$DEST"
if [ -f "$DEST/SKILL.md" ]; then cp "$DEST/SKILL.md" "$DEST/SKILL.md.bak"; echo "기존 SKILL.md 를 SKILL.md.bak 으로 남겼어요."; fi
curl -fsSL "$SRC" -o "$DEST/SKILL.md.tmp"
head -3 "$DEST/SKILL.md.tmp" | grep -q "name: video-style" || { rm -f "$DEST/SKILL.md.tmp"; echo "내려받은 파일이 스킬 문서가 아니에요. 인터넷 연결을 확인하세요." >&2; exit 1; }
mv "$DEST/SKILL.md.tmp" "$DEST/SKILL.md"
echo "설치했어요: $DEST/SKILL.md"
echo "Claude Code 를 새로 열고 「video-style 스킬로 내 쇼츠 톤을 골라줘」라고 말해 보세요."
