# ParkIT
> 주차장 자리 예약 웹사이트 <br>
> http://c7d2301t2.itwillbs.com/parkIT/Main.park

<br><br>

## 1. 개발기간 & 참여인원

> 개발기간: 2023.04.24 ~ 2023.05.22 <br>
> 참여인원: 7명 
<br>

## 2. 프로젝트 소개
parkIT은 시간대를 지정하여 미리 주차공간을 예약함으로써 운전자들의 주차 공간 확보에 대한 스트레스를 완화하고자 제작한 웹 사이트입니다.
<br><br>

## 3. 기술스택
### 개발환경
![eclipse](https://img.shields.io/badge/EclipseIDE-2C2255?style=flat-square&logo=EclipseIDE&logoColor=white)
![Github](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=GitHub&logoColor=white)    

### 개발언어
![JAVA](https://img.shields.io/badge/JAVA-007396?style=flat-square&logo=java&logoColor=FFFFFF)
![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript&logoColor=FFFFFF)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat-square&logo=mysql&logoColor=FFFFFF)

### 협업도구
![Slack](https://img.shields.io/badge/Slack-4A154B?style=flat-square&logo=Slack&logoColor=white)
<br><br>

## 4. 화면 구성
#### 🔹메인 페이지
<img width="530" src="https://github.com/soRan0219/parkIT/assets/124494718/95bf7e36-e342-4b82-be36-b26a52defe26"/>

#### 🔹이용 안내 페이지
<img width="530" src="https://github.com/soRan0219/parkIT/assets/124494718/ddd8eb0a-930d-4bbb-baf1-f21da16528a2"/>

#### 🔹예약 페이지
<img width="530" src="https://github.com/soRan0219/parkIT/assets/124494718/d9ae9fd9-4548-4c08-8eec-54849d618c98"/>

#### 🔹관리자 페이지 
<img width="530" src="https://github.com/soRan0219/parkIT/assets/124494718/c3930757-6a25-4f4f-9161-e76a1afbc320"/>
<br><br>

## 5. 주요 기능

### 📍날짜, 시간대별 잔여 자리 조회 기능
- 이용자가 선택한 날짜와 시간대별로 예약 가능한 주차 자리 조회 
- 주차장 이미지에 이용 가능 혹은 불가능한 자리 구분하여 표현
- 예약 페이지에서 json을 이용해 서버와 비동기 방식으로 소통해 재조회 가능 
### 📍예약 및 결제 기능
- 이용자가 선택한 자리 및 시간대에 따른 결제금액 DB에 저장
- 포트원(아임포트) api를 이용한 카카오페이 결제 기능 구현 
