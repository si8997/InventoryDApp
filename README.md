# 📦 Inventory DApp

스마트 컨트랙트를 기반으로 한 간단한 **재고 관리 분산 애플리케이션(DApp)** 입니다. 상품을 추가, 수정, 삭제하고 전체 목록을 조회할 수 있습니다. 관리자만 특정 기능을 사용할 수 있으며, MetaMask와 Web3.js를 통해 Ganache 네트워크와 상호작용합니다.

---

## 📑 Features

- 상품 추가 / 수정 / 삭제 (관리자 전용)
- 상품 상세 조회 (ID 기반)
- 전체 상품 목록 테이블 출력
- MetaMask 계정 연동
- 관리자 계정 감지 및 UI 동적 변경

---

## ⚙️ Tech Stack

| 구성 요소     | 기술                         |
|--------------|------------------------------|
| 스마트 컨트랙트 | Solidity (v0.8.0)             |
| 로컬 블록체인 | Ganache (RPC Port: 7545)     |
| 지갑 연동     | MetaMask                     |
| 프론트엔드    | HTML + JavaScript + Web3.js  |
| 개발 도구     | Remix IDE, VSCode or Cursor |

---

## 🛠️ 프로젝트 구조

project-root/
│
├─ Inventory.sol # 스마트 컨트랙트
├─ index.html # Web DApp (프론트엔드)
├─ README.md # 프로젝트 설명 파일
└─ /screenshots # 주요 화면 캡처 (선택)

---

## 🚀 실행 방법

### 1. Ganache 실행

- Ganache에서 Quickstart Workspace 시작
- RPC 서버: `http://127.0.0.1:7545`
- Network ID: `5777` 또는 `1337`

### 2. MetaMask 설정

- Ganache RPC를 MetaMask에 네트워크로 추가
- Ganache의 첫 번째 계정을 가져와 MetaMask에 임포트

### 3. 컨트랙트 배포 (Remix IDE)

1. Remix에서 `Inventory.sol` 열기
2. Compiler 버전: `0.8.0`
3. Deploy 시 Environment: **Injected Provider - MetaMask** 또는 **Web3 Provider**
4. 배포 후 생성된 **Contract Address**와 **ABI** 복사

### 4. HTML 코드 수정

- `index.html`의 `contractAddress`에 배포된 주소 입력
- ABI 배열 붙여넣기

```js
const contractAddress = "0x..."; // 배포된 주소
const abi = [...];              // Remix에서 복사한 ABI

```

### 5. Web 실행

index.html을 브라우저에서 열기 (VSCode Live Server, localhost, 또는 더블 클릭)

MetaMask 계정 로그인 상태에서 사용

## 📜 라이선스
MIT License
Author: [정승인]
