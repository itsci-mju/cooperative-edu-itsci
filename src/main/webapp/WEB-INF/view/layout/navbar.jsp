
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Other meta tags and stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Prompt:wght@200;300&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<style>
    .navbar.navbar-expand-lg{
        background-color: #990D28;
    }
</style>
<body>
<%--<div>--%>
<%--        <div class="navbar3" >--%>
<%--            <a  href="${pageContext.request.contextPath}/">หน้าหลัก</a>--%>
<%--            <a  href="${pageContext.request.contextPath}/mentor/1/edit_profile">แก้ไขข้อมูลส่วนตัว</a>--%>
<%--            <a  href="${pageContext.request.contextPath}/mentor/list_student_by_mentor">ประเมินผลการฝึกสหกิจศึกษา</a>--%>
<%--            <a  href="ListRegister.html">ผลการประเมินการฝึกสหกิจศึกษา</a>--%>
<%--        </div>--%>
<%--</div>--%>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav" >
            <ul class="navbar-nav" >
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" style="color: #FFFFFF" href="${pageContext.request.contextPath}/">หน้าแรก</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: #FFFFFF" href="${pageContext.request.contextPath}/mentor/1/edit_profile">แก้ไขข้อมูลส่วนตัว</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: #FFFFFF" href="${pageContext.request.contextPath}/mentor/list_student_by_mentor">ประเมินผลการฝึกสหกิจศึกษา</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" style="color: #FFFFFF" href="${pageContext.request.contextPath}/mentor/list_evaluate_by_mentor">ผลการประเมินการฝึกสหกิจศึกษา</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
