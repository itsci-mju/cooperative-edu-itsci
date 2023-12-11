<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<style>
    .navbar .dropdown ul a {
        padding: 10px 20px;
        font-size: 15px;
        text-transform: none;
        font-weight: 600;
        color: #070707;
    }

    .navbar .dropdown ul a i {
        font-size: 12px;
    }

    .navbar .dropdown ul a:hover,
    .navbar .dropdown ul .active:hover,
    .navbar .dropdown ul li:hover>a {
        color: #a1a0a0;
    }
</style>
<body><br><br>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top header-transparent" style="background: #990D28">
    <div class="container d-flex align-items-center justify-content-between position-relative">
            <a>
                <img src="${pageContext.request.contextPath}/assets/img/LogoIT.png" style="width: 250px">
            </a>

        <nav id="navbar" class="navbar" style="padding-right: 120px;">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero" style="font-family: 'Kanit', sans-serif; font-size: 14px">หน้าแรก</a></li>
<%--                <li><a class="nav-link scrollto" href="#about">About Us</a></li>--%>
<%--                <li><a class="nav-link scrollto" href="#team">Team</a></li>--%>
                <li class="dropdown" style="margin-left: 700px;"><a href="#"><span style="font-family: 'Kanit', sans-serif; font-size: 14px">เข้าสู่ระบบ</span> <i class="bi bi-chevron-down" ></i></a>
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
