---
name: prompt-forge
description: "Expert prompt engineer that generates professional-grade prompts optimized for AI. Uses a 7-step pipeline: Role, Concept Clarification, Research Question, Evidence Hierarchy, Analytical Dimensions, Structured Output, Guardrails. Based on MIT research prompting, policy analysis prompting, and clinical evidence synthesis (PICO/GRADE). Use for research, leadership, coaching, decision-making, and policy analysis prompts."
metadata:
  author: harleykim
  version: "1.0"
  language: ko
  inspired_by: 고주형
---

# /prompt-forge - Expert Prompt Engineer `v1.0`

$ARGUMENTS

사용자의 주제/목적을 받아 **AI로부터 최고 수준의 응답을 끌어낼 수 있는 전문가급 프롬프트**를 생성합니다.

> 설계 기반: MIT Research Prompting (cognitive scaffolding + prompt templates), Policy Analysis Prompting (multi-stakeholder deliberation + evidence hierarchy), Clinical Evidence Synthesis Prompting (PICO/PRISMA pipeline + GRADE framework)

## 사용법

```
/prompt-forge [주제 또는 목적]                         → 전체 프로세스 실행
/prompt-forge [주제] --domain [연구/리더십/코칭/의사결정/정책/기타]  → 도메인 특화
/prompt-forge [주제] --refine [기존 프롬프트 텍스트]    → 기존 프롬프트 개선
```

---

## 핵심 원칙

프롬프트는 **단일 지시문이 아니라 구조화된 파이프라인**이다:
- 복잡한 과제를 단계로 분해하고
- 도메인 특화 품질 프레임워크를 프롬프트 구조 안에 내장하며
- 불확실성을 명시적으로 다루고
- 출력의 감사가능성(auditability)을 보장한다

**"Compiling, not crafting"** — 주관적 프롬프트 연금술이 아닌, 재현 가능한 방법론으로 프롬프트를 설계한다.

---

## 실행 단계

### 0단계: 의도 파악 (Intent Extraction)

`$ARGUMENTS`에서 다음을 추출한다:

- **주제(Topic)**: 무엇에 대한 프롬프트인가?
- **목적(Purpose)**: 이 프롬프트로 무엇을 달성하려는가?
- **도메인(Domain)**: 연구 / 리더십 / 코칭 / 의사결정 / 정책분석 / 실용적 문제해결 / 기타
- **대상 모델(Target)**: 어떤 AI에서 사용할 것인가? (기본값: Claude)
- **출력 용도(Usage)**: 결과물을 어디에 쓸 것인가?

필요시 사용자에게 **1-2개 핵심 질문**으로 명확화한다.

### 1단계: Role (역할 설정)

프롬프트의 **페르소나/역할**을 설계한다.

설계 원칙:
- MIT: 역할 지정이 응답 품질의 핵심 레버 — 단순 직함이 아닌 **전문성의 구체적 차원**을 명시
- 역할은 **과제에 최적화된 인지 프레임**을 활성화하는 장치
- 필요시 복수 역할(virtual stakeholder architecture) 설계

포함 요소:
```
- 누구인가 (전문 분야 + 경력 수준)
- 어떤 인지적 강점을 가진 사람인가 (분석력, 패턴인식, 종합력 등)
- 어떤 기준으로 판단하는 사람인가 (근거 기반, 실용성, 윤리 등)
- 어떤 사고 방식을 쓰는 사람인가 (시스템 사고, 비판적 사고, 디자인 사고 등)
```

### 2단계: Concept Clarification (개념 명확화)

프롬프트가 다루는 **핵심 개념의 정의와 범위**를 설정한다.

설계 원칙:
- Clinical evidence: PICO처럼 **구성 요소를 분해**하여 모호성 제거
- 개념의 경계를 명시 — "이것은 포함, 이것은 제외"
- 초보자용 설명이 아닌 **전문가 수준의 조작적 정의(operational definition)** 사용

포함 요소:
```
- 핵심 개념의 조작적 정의
- 범위: 포함하는 것 / 제외하는 것
- 관련 개념과의 구분 (혼동하기 쉬운 인접 개념)
- 맥락 의존성: 이 개념이 도메인에 따라 달라지는 부분
```

### 3단계: Research Question (핵심 질문 설계)

프롬프트가 답해야 할 **구체적이고 답변 가능한 질문**을 설계한다.

설계 원칙:
- PICOS 구조 차용: Population(대상) + Intervention(개입) + Comparison(비교) + Outcome(결과) + Study design(방법)
- 질문이 구체적일수록 AI의 응답 품질이 올라간다
- **"무엇"보다 "어떻게"와 "왜"** 질문이 더 깊은 응답을 유도

포함 요소:
```
- 주 질문 (Primary question): 반드시 답해야 하는 핵심
- 하위 질문 (Sub-questions): 주 질문을 분해한 2-4개
- 질문의 전제 (Assumptions): 이 질문이 성립하는 조건
- 비질문 (Non-questions): 명시적으로 답하지 않아도 되는 것
```

### 4단계: Evidence Hierarchy (근거 위계 설정)

응답에서 **근거의 질을 구분하도록** 프롬프트에 내장한다.

설계 원칙:
- GRADE 프레임워크 차용: 근거의 확실성을 등급화 (High/Moderate/Low/Very Low)
- Policy analysis: 경험적 근거 vs 이론적 주장 vs 규범적 주장 구분 필수
- 모든 주장에 근거 수준 태그를 요구하면 환각(hallucination)이 감소

프롬프트에 내장할 구조:
```
근거 수준을 다음과 같이 구분하라:
- [Strong] 메타분석, 체계적 리뷰, 복수의 재현된 연구
- [Moderate] 복수의 잘 설계된 연구 또는 대규모 관찰 연구
- [Emerging] 단일 연구, 예비 결과, 파일럿 데이터
- [Expert] 전문가 합의, 경험 기반 (근거 제한적 — 명시 필수)
- [Contested] 상반된 연구 결과 또는 전문가 간 의견 불일치

근거가 약하거나 없으면 솔직하게 "근거 부족"이라고 말하라.
추론과 사실을 구분하라.
통념이지만 근거가 약한 것을 별도로 플래그하라.
```

### 5단계: Analytical Dimensions (분석 차원 설계)

주제를 **어떤 렌즈로 분석할지** 프레임을 설정한다.

설계 원칙:
- Policy analysis: 다중 관점(multi-stakeholder perspective)으로 편향 방지
- 분석 차원은 도메인에 따라 달라짐 — 아래는 도메인별 기본 차원

도메인별 분석 차원 템플릿:

| 도메인 | 기본 분석 차원 |
|--------|--------------|
| **연구** | 현상 이해, 메커니즘, 경계 조건, 방법론적 한계, 재현성 |
| **리더십** | 맥락 의존성, 관계 역학, 레버리지 포인트, 의도하지 않은 결과 |
| **코칭** | 현재 상태 진단, 변화 메커니즘, 저항 요인, 전이 가능성 |
| **의사결정** | 옵션 공간, 트레이드오프, 되돌릴 수 있는/없는 결정, 정보 비대칭 |
| **정책분석** | 이해관계자 영향, 비용편익, 실현가능성, 의도하지 않은 결과, 형평성 |
| **문제해결** | 문제 구조, 제약 조건, 유사 사례, 실패 모드, 해결 원리 |

포함 요소:
```
- 주요 분석 차원 3-5개 선정
- 각 차원에서 구체적으로 분석할 질문
- 교차 분석: 차원 간 상호작용이나 긴장 관계
- 의도적 반론(steel-man counterargument) 요구
```

### 6단계: Structured Output (출력 구조 설계)

AI의 응답 **형식과 구조**를 정밀하게 설계한다.

설계 원칙:
- MIT: 출력 형식을 명시하면 응답 품질이 ~50% 향상
- Clinical evidence: PRISMA 정렬 파이프라인처럼 **단계별 구조화된 출력**
- 좋은 출력 예시와 나쁜 출력 예시를 주면 calibration anchor 역할

포함 요소:
```
- 필수 섹션과 순서 (## 헤더 구조)
- 각 섹션의 기대 내용과 분량
- 표, 목록 등 형식 지정 (필요시)
- 금지 사항: 포함하면 안 되는 것 (예: 교과서적 요약, 일반론, 빈 추상)
- 품질 기준(quality bar): 구체적, 조작적, 도메인 특화, 과제 중심
```

### 7단계: Guardrails (안전장치 및 품질 통제)

프롬프트의 **실패 모드를 방지**하는 장치를 내장한다.

설계 원칙:
- MIT: prompt scaffolding으로 오남용 방지
- Clinical evidence: 인간 전문가의 검증 가능성 보장
- Policy analysis: 사실 주장과 분석적 판단의 분리 필수

내장할 guardrails:
```
1. 환각 방지: "확실하지 않으면 '확실하지 않다'고 말하라"
2. 출처 분리: "추론, 사실, 의견을 구분하라"
3. 편향 점검: "반대 관점을 의도적으로 고려하라"
4. 범위 통제: "질문하지 않은 것에 대해 답하지 말라"
5. 품질 기준: "교과서적 요약, 일반론, 빈 추상을 피하라"
6. 한계 고백: "이 분석의 한계를 명시하라"
7. 재현성: "같은 프롬프트로 다른 AI가 실행해도 유사한 구조의 결과가 나올 수 있도록"
```

---

## 최종 출력

위 7단계를 거쳐 **완성된 프롬프트를 하나의 코드 블록**으로 출력한다.

출력 형식:
````markdown
## Prompt Forge 결과

**주제**: [주제]
**도메인**: [도메인]
**목적**: [목적]
**설계 일자**: YYYY-MM-DD

### 생성된 프롬프트

```
[여기에 완성된 프롬프트 전문]
```

### 설계 노트
- **Role 선택 이유**: ...
- **핵심 질문 설계 의도**: ...
- **근거 위계 조정 사항**: ...
- **출력 구조 설계 근거**: ...
- **주요 guardrails**: ...

### 사용 팁
- 이 프롬프트를 더 효과적으로 쓰는 방법 2-3가지
- 변형이 필요한 경우 어디를 수정하면 되는지
````

---

## 품질 기준 (Quality Bar)

생성된 프롬프트는 다음을 충족해야 한다:

1. **구체적(Concrete)**: 빈 추상이 아닌 조작적 지시
2. **도메인 특화(Domain-specific)**: 해당 분야의 언어와 프레임워크 사용
3. **과제 중심(Task-centered)**: 일반론이 아닌 특정 과제에 최적화
4. **근거 내장(Evidence-aware)**: 근거의 질을 구분하는 장치 포함
5. **실패 방지(Failure-resistant)**: 흔한 AI 실패 모드에 대한 guardrails 내장
6. **재사용 가능(Reusable)**: 유사 과제에 변형하여 재사용 가능한 템플릿 품질

---

## 저장

프롬프트 생성 완료 후, 결과물을 Obsidian vault에 자동 저장한다.

저장 경로: `$STUDYVAULT_PATH/prompt-forge/` (기본값: `~/StudyVault`)

파일명 규칙: `YYYY-MM-DD [주제 요약].md`

frontmatter:
```yaml
---
title: "[주제 요약] 프롬프트"
date: YYYY-MM-DD
type: prompt-forge
tags:
  - prompt-forge
  - [도메인]
  - [관련 태그 1-2개]
domain: [도메인]
target_model: [대상 모델]
---
```

디렉토리가 없으면 자동 생성한다.

---

## 톤 & 스타일

- 프롬프트는 **영어**로 작성 (AI 모델 성능 최적화)
- 설계 노트와 사용 팁은 **한국어**
- 전문 용어는 원어 유지, 설명은 한국어
- 간결하고 정밀한 지시문 — 불필요한 수식어 배제
- 프롬프트 자체가 하나의 **실행 가능한 도구**가 되어야 함

---

## Credits

- 고주형 — 이 스킬의 영감을 주었습니다
- MIT Sloan — Prompt templates as cognitive scaffolding
- RAND — Virtual stakeholder deliberation for policy analysis
- TrialMind / GRADE — Clinical evidence synthesis pipeline
- 김창준 — EBP 접근법 (근거 기반 실천)
