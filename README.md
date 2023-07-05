# 0. 코드네임404(CodeName404): Spring과 Maven을 사용한 개발자 커뮤니티 프로젝트
'코드네임404'는 개발자 커뮤니티를 위한 페이지 입니다.<br>
이 프로젝트의 목표는 개발자들이 연결되고 협업하며 지식을 공유할 수 있는 커뮤니티 플랫폼을 구축하는 것입니다.<br>
관리자/일반회원 으로 구분하여 작업하였습니다.
<br><br>

# 1. 사용한 기술/툴
1. Java8<br>
2. Spring MVC<br>
3. MAVEN<br>
4. AJAX<br>
5. MyBatis3<br>
6. jQuery
<br><br>

# 2. DB
![CodeName404_DB](https://github.com/wlsdntls/CodeName404/assets/121711903/a596cd82-a548-42ee-9de9-1cbbc9e3d8c5)
모든 게시판 테이블에 FK 제약조건 이름을 만들어서 on delete cascade를 붙인 제약조건을 설정하였기 때문에 신고당한 회원을 관리자가 삭제할 경우, 식별관계로 DB를 설계하였기 때문에 해당회원에 대한 게시글과 댓글들이 모두 삭제됩니다.
<br><br>

# 3. 구현기능
1. 회원가입/로그인/로그아웃 + 유효성검사
2. 비밀번호 분실시 -> 이메일로 새로운 비밀번호 발급받기
3. 회원정보 수정/탈퇴/비밀번호 변경
4. 자유게시판/스터디게시판/QnA게시판
   -> 글작성/글수정/글삭제/댓글채택 가능
   -> 세션체크를 통해 로그인한 회원만 이용가능
5. 관리자:
   -> 공지사항 글작성 권한/회원강퇴
   -> 신고당한 회원관리/신고글목록/신고사유를 볼 수 있음/
<br><br>

# 4. AWS 배포
http://13.124.169.213/
<br><br>

# 5. 구동 화면<br><br>

# 5-1. 메인페이지<br><br>
![메인페이지](https://github.com/wlsdntls/CodeName404/assets/121711903/c56dce9a-0ce2-4fb8-a05f-4148fd4a6e10)
<br><br>

# 5-2. 회원가입/로그인/로그인 화면창 구분<br><br>
![로그인구분창2](https://github.com/wlsdntls/CodeName404/assets/121711903/886388a9-54eb-4311-bc93-cc13cd4c7ce3)
![로그인](https://github.com/wlsdntls/CodeName404/assets/121711903/81f50272-e2c9-43dc-a324-ebd3381c2dad)
![회원가입](https://github.com/wlsdntls/CodeName404/assets/121711903/a2d55f44-c3fe-421c-8e3b-2cfc76d9b6f1)
<br><br>

# 5-3. 자유게시판<br><br>
![freeList 자유게시판목록](https://github.com/wlsdntls/CodeName404/assets/121711903/fa0bbe64-bb92-4a24-9198-412ada1ad5ff)
<br><br>

# 5-3. 스터디게시판<br><br>
![study_list 스터디게시판목록](https://github.com/wlsdntls/CodeName404/assets/121711903/1ac95a05-fca4-49aa-9a16-ad4f35ec8053)
<br><br>

# 5-3. QnA게시판<br><br>
![qnaList Q A리스트목록](https://github.com/wlsdntls/CodeName404/assets/121711903/10e7091f-7b83-4853-baa8-9e0dc3c11cc7)
<br><br>

# 5-4. 관리자-회원관리/회원상세정보<br><br>
![회원관리테이블](https://github.com/wlsdntls/CodeName404/assets/121711903/344e362e-0622-4dd4-b8c0-8d67fa7ec980)
![회원상세정보](https://github.com/wlsdntls/CodeName404/assets/121711903/f28c058c-937c-4bee-90b3-fdd678426919)
<br><br>

# 5-4. 관리자-신고글게시판/신고사유게시판/신고사유상세페이지/신고창<br><br>
![신고글게시판](https://github.com/wlsdntls/CodeName404/assets/121711903/896bc5cc-6b0d-4105-92ce-a55ac3665342)
![신고사유게시판](https://github.com/wlsdntls/CodeName404/assets/121711903/edc36d14-9793-4004-aa83-1e661922b7ba)
![신고사유상세페이지](https://github.com/wlsdntls/CodeName404/assets/121711903/72e4295a-0bd6-4e11-a12c-f40b0b69c5d1)
![신고창](https://github.com/wlsdntls/CodeName404/assets/121711903/7e29e855-d012-403c-af41-269449b01f3e)
