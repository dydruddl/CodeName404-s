<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <title>CodeName404</title>
    <meta charset="utf-8">

    <!-- 반응형 웹 -->
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=no">

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="./css/main.css">

    <!-- <style>
    #header {
        margin-top: -20px;
        width: 100%;
        height: 500px;
        background: url('./images/head.jpg') no-repeat;
        background-position: center center;
        background-size: cover;
        border-bottom: 1px solid #A9A9A9;
    }
    </style> -->
    <style>
        .oval-border {

            border: 2px solid rgba(0, 0, 0, 0.15); /* 2픽셀 두께의 검은색 실선 경계선 */

        }

        .oval-border thead {

            border: 1px solid rgba(0, 0, 0, 0.15); /* 1픽셀 두께의 검은색 실선 경계선 */

        }

        .tag-head {
            font-family: Consolas;
            cursor: pointer;
            background-color: beige;
            border: 1px solid rgba(0, 0, 0, 0.15); /* 1픽셀 두께의 검은색 실선 경계선 */
        }

        .h-color {
            background-color: beige;
        }

    </style>
</head>
<body>

<!------------------------------ 전체 프레임 ------------------------------>
<div>
    <!-- navigator -->
    <jsp:include page="./navigator.jsp"></jsp:include>
    <div class="oval-border">
        <br>

        <div style="display: flex; justify-content: center;">
            <div style="width: 38%; margin-right: 30px">       <!--  첫번째 박스 -->
                <!-- 글 목록 출력 -->
                <table class="table table-hover">
                    <div onclick="window.location.href= 'notice_list.notice'" class="tag-head">
                        <h3> &nbsp; <img src="./images/megaphone.png" style="width: 8%; padding-bottom: 5px; padding-right: 10px;">공지사항</h3>
                    </div>
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody class="oval-border">
                    <c:if test="${empty noticeMainList}">
                        <tr>
                            <th colspan="5" align="center">데이터가 없습니다</th>
                        </tr>
                    </c:if>
                    <c:if test="${not empty noticeMainList}">
                        <c:forEach var="noticeli" items="${noticeMainList}">
                            <tr>
                                <!-- 제목에 링크 게시물 글번호랑 페이지 가져가야됨. -->
                                <td>
                                    <a href="notice_View.notice?notice_no=${noticeli.notice_no}&pageNum=${bp.currentPage}"
                                       class="btn btn-default">${noticeli.notice_subject}</a></td>
                                <td>${noticeli.admin_nick }</td>
                                <td><fmt:formatDate value="${noticeli.notice_date}"
                                                    pattern="yyyy-MM-dd"/></td>
                                <td>${noticeli.notice_readcount}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <div style="width: 38%; margin-left: 30px;">            <!-- 2번째 박스-->
                <!-- 글 목록 출력 -->
                <table class="table table-hover">
                    <div style="font-family: Consolas; cursor: pointer;" onclick="window.location.href='qna_list.qna'"
                         class="tag-head">
                        <h3> &nbsp; <img src="./images/qa.png" style="width: 6%; padding-bottom: 3px;"> Q&A</h3>
                    </div>
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody class="oval-border">
                    <c:if test="${empty qnaMainList}">
                        <tr>
                            <td colspan="5">데이터가 없습니다</td>
                        </tr>
                    </c:if>

                    <c:if test="${not empty qnaMainList}">
                        <!-- 컨트롤러에서 정한 화면 출력번호no를 set태그로 설정 -->
                        <c:forEach var="qnaBoard" items="${qnaMainList }">
                            <tr>
                                <c:if test="${qnaBoard.qna_del !=1 }">
                                    <!-- 살아있는 글 제목에 링크걸기 -->
                                    <td><a
                                            href="qnaView.qna?qna_no=${qnaBoard.qna_no}&pageNum=${pp.currentPage}"
                                            class="btn btn-default"> ${qnaBoard.qna_subject}</a>
                                        <!-- 글 번호값, 페이지번호값 가져가기 -->

                                        <span class=badge>${qnaBoard.qna_renum }</span>
                                        <c:if test="${qnaBoard.qna_sol == 1 }">
                                            <img width="20" height="20" src="./images/check.png">
                                        </c:if>
                                    </td>
                                    <td>${qnaBoard.qna_nick}</td>
                                    <td><fmt:formatDate value="${qnaBoard.qna_register }"
                                                        pattern="yyyy-MM-dd"/></td>
                                    <td>${qnaBoard.qna_readcount}</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <div style="display: flex; justify-content: center;">
            <div style="width: 38% ; margin-right: 30px;">              <!-- 세번째 박스-->

                <!-- 글 목록 출력 -->
                <table class="table table-hover">
                    <div style="font-family: Consolas; cursor: pointer;"
                         onclick="window.location.href= 'study_list.study'" class="tag-head">
                        <h3> &nbsp; <img src="./images/study.png" style="width: 7%; padding-bottom: 10px;">스터디게시판</h3>
                    </div>
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody class="oval-border">
                    <c:if test="${empty studyMainList}">
                    <tr>
                        <td colspan="7">데이터가 없습니다</td>
                    </tr>
                    </c:if>

                    <c:if test="${not empty studyMainList}">

                    <!-- 컨트롤러에서 정한 화면 출력번호no를 set태그로 설정 -->
                    <c:forEach var="studyBoard" items="${studyMainList}">
                    <!-- del 상태값이 1 인 경우: 글 삭제 -->
                        <%--<!--
                        <c:if test="${studyBoard.study_del == 1}"> &lt;%&ndash; test: if의 조건문 &ndash;%&gt;
                            <tr></tr>
                            <td colspan="7">삭제된 데이터 입니다</td>
                        </c:if>
                        -->--%>
                    <tr>
                        <c:if test="${studyBoard.study_del != 1}"><!-- 살아있는 글 제목에 링크걸기 -->
                        <!-- 글 번호값, 페이지번호값 가져가기 -->
                        <td><a href="studyView.study?study_no=${studyBoard.study_no}&pageNum=${pp.currentPage}"
                               class="btn btn-default">${studyBoard.study_subject}</a>
                            <c:if test="${studyBoard.study_readcount >= 20 }"><img width="15" height="20"
                                                                                   src="./images/hot.png"></c:if>

                            <c:if test="${studyBoard.study_mozip == 1}">
                                <button type="button" class="btn btn-outline-danger">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                         fill="currentColor" class="bi bi-calendar-check" viewBox="0 0 16 16">
                                        <path d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z"></path>
                                        <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z"></path>
                                    </svg>&nbsp;모집완료
                                </button>
                            </c:if>
                        </td>
                        <td>${studyBoard.study_nick}</td>
                        <td><fmt:formatDate value="${studyBoard.study_register}" pattern="yyyy-MM-dd"/></td>
                        <td>${studyBoard.study_readcount}</td>
                        </c:if>
                    </tr>

                    </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>

            <div style="width: 38%; margin-left: 30px;">            <!-- 네번째 박스 -->

                <!-- 글 목록 출력 -->
                <table class="table table-hover">
                    <div style="font-family: Consolas; cursor: pointer;"
                         onclick="window.location.href= 'free_list.free'" class="tag-head">
                        <h3> &nbsp; <img src="./images/happy.png" style="width: 7%; padding-bottom: 10px;">자유게시판</h3>
                    </div>
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody class="oval-border">
                    <c:if test="${empty freeMainList }">
                        <tr>
                            <td colspan="5">데이터가 없습니다</td>
                        </tr>
                    </c:if>

                    <c:if test="${not empty freeMainList }">
                        <!-- 컨트롤러에서 정한 화면 출력번호no를 set태그로 설정 -->
                        <c:forEach var="freeboard" items="${freeMainList }">
                            <!-- 살아있는 글 제목에 링크걸기 -->
                            <tr>
                                <c:if test="${freeboard.free_del == '1' }">
                                    <td colspan="4">삭제된 게시글 입니다.</td>
                                </c:if>
                                <c:if test="${freeboard.free_del == '0' }">
                                    <td><a
                                            href="free_view.free?free_no=${freeboard.free_no}&pageNum=${pp.currentPage}"
                                            class="btn btn-default"> ${freeboard.free_subject}</a>
                                        <!-- 글 번호값, 페이지번호값 가져가기 -->
                                        <c:if test="${freeboard.free_readcount >= 20 }"><img width="15" height="20"
                                                                                             src="./images/hot.png"></c:if>
                                    </td>
                                    <td>${freeboard.free_nick}</td>
                                    <td>${freeboard.free_regdate}</td>
                                    <td>${freeboard.free_readcount}</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>

        </div>
        <!-- Q&A-->
        <br>
    </div>
    <!--------- 기술 소개 --------->
    <!-- 1 -->
    <div class="row">

        <!--------- 슬라이드------- -->
        <%--	<div class="slideshow-container">--%>


        <%--<img src="./images/communityMain.jpg" style="width: 100%;">--%>

        <%--

                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="./images/communityMain.jpg" style="width: 100%">
                    <div class="text"></div>
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="./images/communityMain.jpg" style="width: 100%">
                    <div class="text"></div>
                </div>
        --%>

        <%--		<a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
                    onclick="plusSlides(1)">❯</a>--%>

        <%--	</div>--%>
        <div class="slideshow-container">
            <div class="mySlides fade">
                <div class="numbertext">1 / 2</div>
                <div class="column">
                    <div class="content">
                        <img src="./images/java.jpeg" alt="Mountains" style="width: 80%">
                        <%-- <h3>JAVA</h3>--%>
                        <%--<p>객체 지향 프로그래밍 언어로서 보안성이 뛰어나며 컴파일한 코드는 다른 운영 체제에서 사용할 수 있도록
                            클래스(class)로 제공된다. 객체 지향 언어인 C++ 언어의 객체 지향적인 장점을 살리면서 분산 환경을 지원하며 더욱
                            효율적이다.</p>--%>
                    </div>
                </div>
                <!-- 2 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/spring.png" alt="Lights" style="width: 80%">
                        <%--   <h3>Spring Framework</h3>--%>
                        <%--<p>자바 플랫폼을 위한 오픈 소스 애플리케이션 프레임워크로서 간단히 스프링(Spring)이라고도 한다. 동적인 웹
                            사이트를 개발하기 위한 여러 가지 서비스를 제공하고 있다. 대한민국 공공기관의 웹 서비스 개발 시 사용을 권장하고 있는
                            전자정부 표준프레임워크의 기반 기술로서 쓰이고 있다.</p>--%>
                    </div>
                </div>
                <div class="text"></div>

                <!-- 3 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/css.jpeg" alt="Nature" style="width: 80%">
                        <%--   <h3>CSS</h3>--%>
                        <%-- <p>HTML 등의 마크업 언어로 작성된 문서가 실제로 웹사이트에 표현되는 방법을 정해주는 스타일 시트 언어.</p--%>>
                    </div>
                </div>

                <!-- 4 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/javascript.png" alt="Mountains" style="width: 80%">
                        <%--  <h3>JavaScript</h3>--%>
                        <%-- <p>Ecma International의 프로토타입 기반의 프로그래밍 언어로, 스크립트 언어에 해당된다.JavaScript는 클라이언트 단에서 웹 페이지가
                             동작하는 것을 담당한다.</p>--%>
                    </div>
                </div>
            </div>
            <div class="mySlides fade">
                <div class="numbertext">2 / 2</div>
                <!-- 5 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/html.png" alt="Mountains" style="width: 80%">
                        <%-- <h3><br>HTML</h3>--%>
                        <%--  <p>인터넷 서비스의 하나인 월드 와이드 웹을 통해 볼 수 있는 문서를 만들 때 사용하는 웹 언어의 한 종류이다.
                              웹 문서를 만들기 위하여 사용하는 기본적인 웹 언어의 한 종류이다. 하이퍼텍스트를 작성하기 위해 개발되었다</p>--%>
                    </div>
                </div>
                <div class="text"></div>


                <!-- 6 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/oracle.jpg" alt="Lights" style="width: 80%">
                        <%--  <h3>Oracle Database</h3>--%>
                        <%--   <p>오라클 데이터베이스(Oracle Database 또는 Oracle RDBMS)는 미국
                               오라클(Oracle)사에서 판매하는 관계형 데이터베이스 관리 시스템이다. 은행 등 대다수의 대기업체에서 많이 사용된다.</p>--%>
                    </div>
                </div>
                <!-- 7 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/c.png" alt="Nature" style="width: 80%">
                        <%-- <h3>C</h3>--%>
                        <%-- <p>벨 연구소에서 1971년에 리치(D.M.Ritchie)등에 의해 개발된 시스템 프로그래밍 언어이다.
                             프로그램을 간결하게 쓸 수 있고, 프로그래밍하기 쉬운 편리한 언어이다.</p>--%>
                    </div>
                </div>
                <!-- 8 -->
                <div class="column">
                    <div class="content">
                        <img src="./images/python.jpg" alt="Mountains" style="width: 80%">
                        <%--<h3>python</h3>--%>
                        <%-- <p>C언어를 기반으로 한 오픈소스 고급 프로그래밍 언어로, 초보자뿐만 아니라 전문가들도 포함하는 매우 다양한
                             사용자층을 가지고 있으며, 플랫폼 독립적이기 때문에 다양한 플랫폼에서 사용 가능하고 또한 기본 제공되는 라이브러리가
                             매우 많다.</p>--%>
                    </div>
                    <div class="text"></div>

                    <a class="prev" onclick="plusSlides(-1)">❮</a> <a class="next"
                                                                      onclick="plusSlides(1)">❯</a>

                </div>
            </div>
        </div>
        <div class=row></div>

        <div style="text-align: center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
        </div>

        <script>
            let slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                if (n > slides.length) {
                    slideIndex = 1;
                }
                if (n < 1) {
                    slideIndex = slides.length;
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }


            setInterval(function () {
                plusSlides(1);
            }, 2500);
        </script>

    </div>
    <!-- END GRID -->
</div>
<!-- END MAIN -->
</div>
<!-- footer -->
<jsp:include page="./footer.jsp"></jsp:include>
<!------------------------------ 전체 프레임 end ------------------------------>

</body>
</html>
