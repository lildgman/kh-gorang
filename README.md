# 고수의 냉장고(Gorang)
![Gorang](svgviewer-png-output.png)
- URL: https://www.gorang.store/

## 프로젝트 소개
- **재료 관리**: 사용자의 냉장고에 있는 재료를 손쉽게 등록하고 관리하여, 식재료를 효율적으로 활용할 수 있도록 도와줍니다.
- **레시피 공유**: 나만의 레시피를 등록해 다른 이용자들과 공유하고, 요리 경험을 나누며 소통할 수 있습니다.
- **커뮤니티**: 레시피 외에도 일상 이야기, 꿀팁 등 다양한 주제로 게시글을 작성하고, 이용자들과 일상을 공유할 수 있습니다.
- **편리한 쇼핑**: 필요한 재료를 구매할 수 있는 기능을 제공합니다.

## 팀원 구성
- [김동현(팀장)](https://github.com/DHKim96)
- [오동건(형상관리)](https://github.com/lildgman)
- [함유철(DB관리)](https://github.com/gkadbcjf)
- [이강산(일정 및 이슈 관리)](https://github.com/kangsan1023)

### 역할분담
#### 김동현
- 구매페이지, 사이드바, 헤더, 푸터
- 나의 냉장고, 구매내역, 쇼핑 상세, 로그인, 회원가입
- Google, Kakao, Naver 로그인 API, Coolsms 핸드폰 문자인증 API, 이메일 인증 SMTP
- 배포

#### 오동건
- 마이페이지 모두보기, 나의 게시글, 댓글 및 후기, 문의, 스크랩, 좋아요, 회원정보 수정
- 통합 검색 페이지, 레시피 리스트 페이지, 상품 리스트 페이지
- 관리자 페이지

#### 함유철
- 레시피 상세, 레시피 글쓰기, 레시피 수정
- DB 설계 및 데이터 관리

#### 이강산
- 게시판 메인, 게시판 상세, 게시판 글쓰기

## 개발 기간
- 아이디어 도출 및 UI 구상: 2024-04-29 ~ 2024-05-03
- UI구현: 2024-05-03 ~ 2024-05-14
- 기능 구현: 2024-05-14 ~ 2024-06-21

## 기술 스택
### 개발환경
#### Front-End
<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"><img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white"><img src="https://img.shields.io/badge/bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white">

#### Back-End
<img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"><img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"><img src="https://img.shields.io/badge/JSP-E34F26?style=for-the-badge&logo=&logoColor=white"><img src="https://img.shields.io/badge/MyBatis-433535?style=for-the-badge&logo=&logoColor=white">

#### Database
<img src="https://img.shields.io/badge/postgresql-4169E1?style=for-the-badge&logo=&postgresql&logoColor=white">

#### Collaboration Tool
<img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"><img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">

## 화면 구성
### 메인화면
<img src="page_img/main.png" alt="메인화면" width="50%"/>

### 검색결과 페이지
<img src="page_img/search.png" alt="검색결과" width="50%"/>

### 레시피 메인화면
<img src="page_img/recipe_main.png" alt="레시피 메인화면" width="50%"/>

### 레시피 목록
<img src="page_img/recipe_list.png" alt="레시피 목록" width="50%"/>

### 레시피 상세
<img src="page_img/recipe1.png" alt="레시피 상세" width="50%"/>

### 레시피 작성
<img src="page_img/recipe_insert.png" alt="레시피 작성" width="50%"/>

### 게시글 목록
<img src="page_img/board_list.png" alt="게시글 목록" width="50%"/>

### 게시글 상세
<img src="page_img/board_detail.png" alt="게시글 상세" width="50%"/>

### 게시글 작성
<img src="page_img/board_insert.png" alt="게시글 등록" width="50%"/>

### 쇼핑 메인
<img src="page_img/shop_main.png" alt="쇼핑 메인" width="50%"/>

### 쇼핑 목록
<img src="page_img/shop_list.png" alt="쇼핑 목록" width="50%"/>

### 상품 상세
<img src="page_img/shop_detail.png" alt="상품 상세" width="50%"/>

### 장바구니 페이지
<img src="page_img/shop_cart.png" alt="장바구니" width="50%"/>

### 구매 페이지
<img src="page_img/buy.png" alt="구매" width="50%"/>

### 관리자 페이지 - 상품 등록
<img src="page_img/manager_product_insert.png" alt="상품 등록" width="50%"/>

### 관리자 페이지 - 상품 조회
<img src="page_img/manager_product_search.png" alt="상품 조회" width="50%"/>

### 관리자 페이지 - 게시글
<img src="page_img/manager_board.png" alt="게시물 관리" width="50%"/>

### 관리자 페이지 - 회원관리
<img src="page_img/manager_member.png" alt="회원 관리" width="50%"/>

### 마이페이지
<img src="page_img/mypage_main.png" alt="마이페이지 메인" width="50%"/>

### 마이페이지 - 게시글
<img src="page_img/mypage_recipe.png" alt="마이페이지 게시글" width="50%"/>

### 마이페이지 - 댓글 및 후기
<img src="page_img/mypage_comment.png" alt="마이페이지 댓글" width="50%"/>

### 마이페이지 - 문의
<img src="page_img/mypage_qna.png" alt="마이페이지 문의" width="50%"/>

### 마이페이지 - 나의 냉장고
<img src="page_img/mypage_ref.png" alt="마이페이지 나의냉장고" width="50%"/>

### 마이페이지 - 구매내역
<img src="page_img/mypage_bought.png" alt="마이페이지 구매내역" width="50%"/>

### 마이페이지 - 스크랩
<img src="page_img/mypage_scrap.png" alt="마이페이지 스크랩" width="50%"/>

### 마이페이지 - 좋아요
<img src="page_img/mypage_liked.png" alt="마이페이지 좋아요" width="50%"/>

### 마이페이지 - 정보수정
<img src="page_img/mypage_myinfo.png" alt="마이페이지 정보수정" width="50%"/>

### 회원탈퇴
<img src="page_img/withdrawal.png" alt="마이페이지 정보수정" width="50%"/>












