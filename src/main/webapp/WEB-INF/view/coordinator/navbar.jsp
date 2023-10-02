<%@ page import="it_sci.model.Mentor" %>
<%@ page import="it_sci.model.Teacher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@200;300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">



</head>
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
<body>
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>
<header id="header" class="fixed-top header-transparent" style="background: #990D28">
<%--    <div class="container d-flex align-items-center justify-content-between position-relative">--%>
<%--        <div class="logo">--%>
<%--            <h1 class="text-light"><a href="index.html"><span>Squadfree</span></a></h1>--%>
<%--            <!-- Uncomment below if you prefer to use an image logo -->--%>
<%--            <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->--%>
<%--        </div>--%>
<nav id="navbar" class="navbar">
    <ul>
        <li style="margin-left: 150px"><a class="nav-link scrollto active" href="${pageContext.request.contextPath}/" style="font-family: 'Prompt', sans-serif">หน้าแรก</a></li>
        <li class="dropdown"><a><span style="font-family: 'Prompt', sans-serif; color: #FFFFFF">จัดการข้อมูลการประเมินสหกิจศึกษา</span> <i class="bi bi-chevron-down text-white"></i></a>
            <ul >
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/teacher/<%=teacher.getTeacher_id()%>/list_company_by_teacher" style="font-family: 'Prompt', sans-serif">ประเมินผลการฝึกสหกิจศึกษา</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/teacher/list_evaluate_by_teacher/<%=teacher.getTeacher_id()%>" style="font-family: 'Prompt', sans-serif">ผลการประเมินการฝึกสหกิจศึกษา</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/teacher/list_status/" style="font-family: 'Prompt', sans-serif">ตรวจสอบสถานะ</a></li>
                <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/mentor/view_summary" style="font-family: 'Prompt', sans-serif">ดูผลสรุปคะแนน</a></li>
            </ul>
        <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/company/list_company/" style="font-family: 'Prompt', sans-serif">กำหนดอาจารย์นิเทศ</a></li>
        <li><a class="nav-link scrollto" href="${pageContext.request.contextPath}/" style="font-family: 'Prompt', sans-serif">จัดการการเข้าสู่ระบบของพี่เลี้ยง</a></li>
        <li style="color: #fff; margin-left: 150px; font-family: 'Prompt', sans-serif"><%= "ผู้ใช้งานระบบ : " + teacher.getTeacher_name() + " " + teacher.getTeacher_lastname() %></li>
        <li class="nav-item">
            <a class="nav-link" style="color: #FFFFFF; font-family: 'Prompt', sans-serif" href="${pageContext.request.contextPath}/doLogout" >ออกจากระบบ</a>
        </li>
    </ul>
    <i class="bi bi-list mobile-nav-toggle"></i>
</nav><!-- .navbar -->
    </div>
</header><!-- End Header -->
</body>
</html>
