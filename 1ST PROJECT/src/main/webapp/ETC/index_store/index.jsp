<%@page import="Model.T_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Twenty by HTML5 UP</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>



<!-- 상단바 시작  -->
<body class="index is-preload">

<!-- 세션 받아오기 시작 -->
<% request.setCharacterEncoding("utf-8"); %>
<% T_MemberDTO info = (T_MemberDTO)session.getAttribute("info");  %>
<!-- 세선 받아오기 끝 -->




    <div id="page-wrapper">
        <!-- Header -->
        <header id="header" class="alt">
            <h1 id="logo"><a href="index.jsp">SafeZone <span>by NewPizza</span></a></h1>
            <nav id="nav">
                <ul>
                    <li class="current"><a href="index.jsp">Home</a></li>
                    <li class="current"><a href="AboutUs.jsp">About us</a></li>
                    <li class="current"><a href="FAQ.jsp">FAQ</a></li>
                    <li class="current"><a href="BoardMain.jsp">Board Main</a></li>

<%
if(info != null){
/* 관리자 로그인 */
	if(info.getMem_id().equals("admin")){ %>
                    <li class="submenu">
                        <a href="#">관리자메뉴</a>
                        <ul>
                            <li><a href="AdminMemberSelect.jsp">전체 회원 조회</a></li>
                            <li><a href="AdminMemberUpdate.jsp">회원 정보 수정</a></li>
                            <li><a href="AdminSensorStandard.jsp">창고 센서조건 설정</a></li>
                            <li><a href="AdminSensorValueMonitoring.jsp">전체창고센서 모니터링</a></li>
                            <li><a href="AdminWarehouseInsert.jsp">창고 추가</a></li>
                            <li><a href="AdminWareHouseUpdate.jsp">창고 정보 수정</a></li>
                            <li class="submenu">
                                <a href="#">Submenu</a>
                                <ul>
                                    <li><a href="#">Dolore Sed</a></li>
                                    <li><a href="#">Consequat</a></li>
                                    <li><a href="#">Lorem Magna</a></li>
                                    <li><a href="#">Sed Magna</a></li>
                                    <li><a href="#">Ipsum Nisl</a></li>
                                </ul>
                            </li>
                        </ul>
<!-- 회원 로그인 -->                        
<% } else {%>                        
                        <li class="submenu">
                        <a href="#">마이 페이지</a>
                        <ul>
                            <li><a href="MemberUpdate.jsp">내 정보 수정</a></li>
                            <li><a href="MemberMonitoring.jsp">내 창고 모니터링</a></li>
                            <li class="submenu">
                                <a href="#">Submenu</a>
                                <ul>
                                    <li><a href="#">Dolore Sed</a></li>
                                    <li><a href="#">Consequat</a></li>
                                    <li><a href="#">Lorem Magna</a></li>
                                    <li><a href="#">Sed Magna</a></li>
                                    <li><a href="#">Ipsum Nisl</a></li>
                                </ul>
                            </li>
                        </ul>
                    <li><a href="LogoutServiceCon.do" class="button primary">로그아웃</a></li>    
                        
                    </li>
                    
<!-- 비로그인 -->                    
<% } %>
                    <li><a href="Join.jsp" class="button primary">회원가입</a></li>
                    <li><a href="Login.jsp" class="button primary">로그인</a></li>
<% } %>                    
                    <li><a href="LogoutServiceCon.do" class="button primary">로그아웃</a></li>
                </ul>
            </nav>
        </header>

        <!-- Banner -->
        <section id="banner">

            <!--
						".inner" is set up as an inline-block so it automatically expands
						in both directions to fit whatever's inside it. This means it won't
						automatically wrap lines, so be sure to use line breaks where
						appropriate (<br />).
					-->
            <div class="inner">

                <header>
                    <h2>TWENTY</h2>
                </header>
                <p>This is <strong>Twenty</strong>, a free
                    <br /> responsive template
                    <br /> by <a href="http://html5up.net">HTML5 UP</a>.</p>
                <footer>
                    <ul class="buttons stacked">
                        <li><a href="#main" class="button fit scrolly">Tell Me More</a></li>
                    </ul>
                </footer>

            </div>

        </section>

        <!-- Main -->
        <article id="main">

            <header class="special container">
                <span class="icon solid fa-chart-bar"></span>
                <h2>As this is my <strong>twentieth</strong> freebie for HTML5 UP
                    <br /> I decided to give it a really creative name.</h2>
                <p>Turns out <strong>Twenty</strong> was the best I could come up with. Anyway, lame name aside,
                    <br /> it's minimally designed, fully responsive, built on HTML5/CSS3, and, like all my stuff,
                    <br /> released for free under the <a href="http://html5up.net/license">Creative Commons Attribution 3.0</a> license. Have fun!</p>
            </header>

            <!-- One -->
            <section class="wrapper style2 container special-alt">
                <div class="row gtr-50">
                    <div class="col-8 col-12-narrower">

                        <header>
                            <h2>Behold the <strong>icons</strong> that visualize what you’re all about. or just take up space. your call bro.</h2>
                        </header>
                        <p>Sed tristique purus vitae volutpat ultrices. Aliquam eu elit eget arcu comteger ut fermentum lorem. Lorem ipsum dolor sit amet. Sed tristique purus vitae volutpat ultrices. eu elit eget commodo. Sed tristique purus vitae volutpat
                            ultrices. Aliquam eu elit eget arcu commodo.</p>
                        <footer>
                            <ul class="buttons">
                                <li><a href="#" class="button">Find Out More</a></li>
                            </ul>
                        </footer>

                    </div>
                    <div class="col-4 col-12-narrower imp-narrower">

                        <ul class="featured-icons">
                            <li><span class="icon fa-clock"><span class="label">Feature 1</span></span>
                            </li>
                            <li><span class="icon solid fa-volume-up"><span class="label">Feature 2</span></span>
                            </li>
                            <li><span class="icon solid fa-laptop"><span class="label">Feature 3</span></span>
                            </li>
                            <li><span class="icon solid fa-inbox"><span class="label">Feature 4</span></span>
                            </li>
                            <li><span class="icon solid fa-lock"><span class="label">Feature 5</span></span>
                            </li>
                            <li><span class="icon solid fa-cog"><span class="label">Feature 6</span></span>
                            </li>
                        </ul>

                    </div>
                </div>
            </section>

            <!-- Two -->
            <section class="wrapper style1 container special">
                <div class="row">
                    <div class="col-4 col-12-narrower">

                        <section>
                            <span class="icon solid featured fa-check"></span>
                            <header>
                                <h3>This is Something</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat ultrices. Aliquam eu elit eget arcu commodo suscipit dolor nec nibh. Proin a ullamcorper elit, et sagittis turpis. Integer ut fermentum.</p>
                        </section>

                    </div>
                    <div class="col-4 col-12-narrower">

                        <section>
                            <span class="icon solid featured fa-check"></span>
                            <header>
                                <h3>Also Something</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat ultrices. Aliquam eu elit eget arcu commodo suscipit dolor nec nibh. Proin a ullamcorper elit, et sagittis turpis. Integer ut fermentum.</p>
                        </section>

                    </div>
                    <div class="col-4 col-12-narrower">

                        <section>
                            <span class="icon solid featured fa-check"></span>
                            <header>
                                <h3>Probably Something</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat ultrices. Aliquam eu elit eget arcu commodo suscipit dolor nec nibh. Proin a ullamcorper elit, et sagittis turpis. Integer ut fermentum.</p>
                        </section>

                    </div>
                </div>
            </section>

            <!-- Three -->
            <section class="wrapper style3 container special">

                <header class="major">
                    <h2>Next look at this <strong>cool stuff</strong></h2>
                </header>

                <div class="row">
                    <div class="col-6 col-12-narrower">

                        <section>
                            <a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
                            <header>
                                <h3>A Really Fast Train</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                        </section>

                    </div>
                    <div class="col-6 col-12-narrower">

                        <section>
                            <a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
                            <header>
                                <h3>An Airport Terminal</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                        </section>

                    </div>
                </div>
                <div class="row">
                    <div class="col-6 col-12-narrower">

                        <section>
                            <a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
                            <header>
                                <h3>Hyperspace Travel</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                        </section>

                    </div>
                    <div class="col-6 col-12-narrower">

                        <section>
                            <a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
                            <header>
                                <h3>And Another Train</h3>
                            </header>
                            <p>Sed tristique purus vitae volutpat commodo suscipit amet sed nibh. Proin a ullamcorper sed blandit. Sed tristique purus vitae volutpat commodo suscipit ullamcorper sed blandit lorem ipsum dolore.</p>
                        </section>

                    </div>
                </div>

                <footer class="major">
                    <ul class="buttons">
                        <li><a href="#" class="button">See More</a></li>
                    </ul>
                </footer>

            </section>

        </article>

        <!-- CTA -->
        <section id="cta">

            <header>
                <h2>Ready to do <strong>something</strong>?</h2>
                <p>Proin a ullamcorper elit, et sagittis turpis integer ut fermentum.</p>
            </header>
            <footer>
                <ul class="buttons">
                    <li><a href="#" class="button primary">Take My Money</a></li>
                    <li><a href="#" class="button">LOL Wut</a></li>
                </ul>
            </footer>

        </section>

        <!-- Footer -->
        <footer id="footer">

            <ul class="icons">
                <li><a href="#" class="icon brands circle fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon brands circle fa-facebook-f"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon brands circle fa-google-plus-g"><span class="label">Google+</span></a></li>
                <li><a href="#" class="icon brands circle fa-github"><span class="label">Github</span></a></li>
                <li><a href="#" class="icon brands circle fa-dribbble"><span class="label">Dribbble</span></a></li>
            </ul>

            <ul class="copyright">
                <li>&copy; Untitled</li>
                <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
            </ul>

        </footer>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>

</html>