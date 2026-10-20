# video-style — 주제에 맞는 모션그래픽 쇼츠 스타일 고르기

> 맥북 기준 안내입니다. Windows 는 아래쪽에 짧게 있습니다.

쇼츠·영상을 새로 시작할 때 **그림체(톤)부터** 고르게 하는 Claude Code 스킬입니다. 주제를 이야기 세 칸(core·belief·scene)으로 바꾸고, 22가지 모션그래픽 톤 가운데 후보 둘을 받아 하나를 고른 뒤, 그 톤의 움직임 규칙·전환 규칙·이미지 프롬프트 앞머리를 「톤 결정 블록」으로 남깁니다. 그다음에야 대본·이미지·클립·코드 렌더로 넘어갑니다.

- 22가지 톤 카탈로그(손 그림·인포그래픽·청사진·미니멀 UI·클레이·카툰·애니·수묵·옛 필름 …)와 톤마다 움직임 규칙 한 문장
- 갈래별 기본값(설명·감성·따라 하기·홍보·어린이·역사)
- 모든 톤에 공통인 움직임 규칙 넷, AI 티 금지 목록, 렌더 전 프레임 검토
- 적용 예: 아리랑 어원 수묵 쇼츠 — [롱폼](https://youtu.be/-oPT-wjEeVs) · [쇼츠](https://youtu.be/aTjn_b7aUOc)
- 과정 전체를 따라 하는 교안: [모션그래픽으로 주제에 맞는 쇼츠 만들기](https://vibecoding20.vercel.app/lectures/topic-shorts)

## 맥북에 설치하기

### 1. Claude Code 가 없다면 먼저 설치

터미널(응용 프로그램 › 유틸리티 › 터미널)을 열고:

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

설치가 끝나면 터미널을 닫았다 다시 열고 `claude` 를 입력해 로그인합니다. 데스크톱 앱(Claude 앱의 Code 탭)을 써도 됩니다.

### 2. 스킬 설치 — 플러그인으로 (권장)

Claude Code 대화창에 두 줄을 차례로 입력합니다.

```
/plugin marketplace add osam555/video-style-skill
/plugin install video-style@video-style-skill
```

`/plugin` 메뉴에서 `video-style` 이 켜져 있으면 끝입니다. 나중에 스킬이 바뀌면 `/plugin marketplace update video-style-skill` 로 받습니다.

### 2-1. 플러그인 명령이 안 될 때 — 터미널 한 줄

```bash
curl -fsSL https://raw.githubusercontent.com/osam555/video-style-skill/main/install.sh | bash
```

`~/.claude/skills/video-style/SKILL.md` 에 스킬 문서를 넣습니다(이미 있으면 `.bak` 으로 남깁니다). 두 방법 중 **하나만** 쓰세요. 둘 다 쓰면 같은 스킬이 두 번 잡힙니다.

### 3. 확인

Claude Code 를 새로 열고 「video-style 스킬 있어?」라고 물어보거나, 아래 「쓰는 법」의 문장을 그대로 넣어 봅니다.

## 쓰는 법

Claude Code 에 이렇게 말하면 스킬이 열립니다.

```
video-style 스킬로 내 쇼츠 톤을 골라줘. 주제는 「(주제)」야.
core·belief·scene 세 칸을 같이 채우고, 22가지 톤 중 후보 둘을 이유와 함께 제안해줘.
내가 고르면 톤 결정 블록을 기획 문서 머리에 적어줘. 이미지 프롬프트는 아직 쓰지 마.
```

「이 쇼츠 무슨 스타일로 갈까」「그림체 정해 줘」「AI 티가 난다」 같은 말에도 스킬이 열립니다.

## Windows 에서는

같은 플러그인 두 줄이 그대로 됩니다. Claude Code 설치는 PowerShell 에서 `irm https://claude.ai/install.ps1 | iex`, 수동 설치 위치는 `%USERPROFILE%\.claude\skills\video-style\` 입니다.

## 출처와 라이선스

톤 카탈로그는 Ai-Con Lab 「[클로드로 만든 모션그래픽 20가지 톤, 전부 코드로 그렸습니다](https://youtu.be/oCRQP5S-900)」를 보고 정리했습니다. 영상 화면은 이 저장소에 넣지 않았으니 톤 모양은 원본 영상의 타임스탬프(SKILL.md §7)로 보세요. 프롬프트 다섯 칸·금지 목록은 prompt-motion.com 의 공개 분석을 쇼츠에 맞게 옮겼습니다.

스킬 문서는 MIT 라이선스입니다.
