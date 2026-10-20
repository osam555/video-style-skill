# video-style 스킬을 이 윈도 PC 의 Claude Code 에 설치한다 (플러그인 명령을 못 쓸 때의 대안).
#   irm https://raw.githubusercontent.com/osam555/video-style-skill/main/install.ps1 | iex
# 하는 일: %USERPROFILE%\.claude\skills\video-style\SKILL.md 를 내려받아 둔다. 이미 있으면 .bak 으로 남기고 바꾼다.
$ErrorActionPreference = 'Stop'
$base = if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $env:USERPROFILE '.claude' }
$dest = Join-Path $base 'skills\video-style'
$src  = 'https://raw.githubusercontent.com/osam555/video-style-skill/main/plugins/video-style/skills/video-style/SKILL.md'
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$file = Join-Path $dest 'SKILL.md'
$tmp  = Join-Path $dest 'SKILL.md.tmp'
if (Test-Path $file) { Copy-Item $file "$file.bak" -Force; Write-Host '기존 SKILL.md 를 SKILL.md.bak 으로 남겼어요.' }
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -UseBasicParsing -Uri $src -OutFile $tmp
$head = Get-Content -Path $tmp -TotalCount 3 -Encoding UTF8
if (-not ($head -match 'name: video-style')) { Remove-Item $tmp -Force; throw '내려받은 파일이 스킬 문서가 아니에요. 인터넷 연결을 확인하세요.' }
Move-Item -Force $tmp $file
Write-Host "설치했어요: $file"
Write-Host 'Claude Code 를 새로 열고 「video-style 스킬로 내 쇼츠 톤을 골라줘」라고 말해 보세요.'
