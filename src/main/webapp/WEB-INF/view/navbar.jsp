<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top header-transparent" style="background: #990D28">
    <div class="container d-flex align-items-center justify-content-between position-relative">

        <div class="logo">
            <h1 class="text-light"><a href="index.html"><span>Squadfree</span></a></h1>
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero" style="font-family: 'Kanit', sans-serif">หน้าแรก</a></li>
                <li><a class="nav-link scrollto" href="#about">About Us</a></li>
                <li><a class="nav-link scrollto" href="#services">Services</a></li>
                <li><a class="nav-link scrollto" href="#portfolio">Portfolio</a></li>
                <li><a class="nav-link scrollto" href="#team">Team</a></li>
                <li class="dropdown"><a href="#"><span style="font-family: 'Kanit', sans-serif">เข้าสู่ระบบ</span> <i class="bi bi-chevron-down"></i></a>
                    <ul >
                        <li ><a style="font-family: 'Kanit', sans-serif" href="${pageContext.request.contextPath}/loginTeacher">เข้าสู่ระบบอาจารย์</a></li>
                        <li ><a style="font-family: 'Kanit', sans-serif" href="${pageContext.request.contextPath}/loginMentor">เข้าสู่ระบบพนักงานพี่เลี้ยง</a></li>
                    </ul>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
</body>
</html>
