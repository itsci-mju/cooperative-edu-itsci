<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">ข้อมูลนักศึกษา</p>
    </div>
</div><br><br>

<h5 style="margin-left: 200px; font-family: 'Kanit', sans-serif; font-weight: bold;">ข้อมูลนักศึกษา</h5>
<hr style="height: 3px; width: 1060px; background-color: #990D28; border: none; box-shadow: 0 4px 6px #990D28; margin-left: 200px;"><br>
<table class="student_detail" align="center">
    <tr>
        <td align="center"><p>รหัสนักศึกษา</p></td>
        <td  align="center"><input type="text" value="${student_detail.student_id}" disabled></td>
    </tr>
    <tr >
        <td align="center"><p>ชื่อนักศึกษา</p></td>
        <td align="center"><input type="text"  value="${student_detail.student_name}" disabled></td>
        <td align="center"><p>นามสกุล</p></td>
        <td align="center"><input type="text"  value="${student_detail.student_lastname}" disabled></td>
    </tr>
</table><br>
<hr style="height: 3px; width: 1060px;  background-color: #990D28; border: none; box-shadow: 0 4px 6px #990D28; margin-left: 200px;"><br>

<h5 style="margin-left: 200px; font-family: 'Kanit', sans-serif; font-weight: bold;">ข้อมูลสหกิจศึกษา</h5>
<table align="center"><br>
    <tr>
        <td><p>ชื่อบริษัท</p></td>
        <td><input type="text"  value="${student_detail.company.company_name}" disabled></td>
    </tr>
    <tr>
        <td><p>ตำแหน่ง</p></td>
        <td><input type="text" value="${student_detail.workposition}" disabled></td>
    </tr>
    <tr>
        <td><p>เวลาเริ่มสหกิจศึกษา</p></td>
        <td align="center">
            <input type="text" value="${student_detail.startdate}" disabled></td>
<%--        <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" />--%>
        </td>
        <td><p>เวลาสิ้นสุด</p></td>
        <td align="center">
            <input type="text" value="${student_detail.startdate}" disabled></td>
<%--        <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />--%>
        </td>

    </tr>
</table><br>
<hr style="height: 3px; width: 1060px;  background-color: #990D28; border: none; box-shadow: 0 4px 6px #990D28; margin-left: 200px;"><br>

<h5 style="margin-left: 200px; font-family: 'Kanit', sans-serif; font-weight: bold;">ข้อมูลพนักงานพี่เลี้ยง</h5>
<table class="table table-hover" style="width: 1000px;" align="center"><br>
    <tr class="table-primary" align="center">
        <td align="center">ชื่อพนักงานพี่เลี้ยง</td>
        <td align="center">นามสกุล</td>
        <td align="center">ชื่อเล่น</td>
        <td align="center">อีเมล</td>
    </tr>
    <%--        ${students}--%>
<c:forEach var="mentor" items="${mentors}">
            <tr align="center">
                <td align="center"> ${mentor.mentor_name}</td>
                <td align="center"> ${mentor.mentor_lastname}</td>
                <td align="center">${mentor.mentor_nickname}</td>
                <td align="center">${mentor.mentor_email}</td>

            </tr>
</c:forEach>
</table>

</body>
</head>
<body>

</body>
</html>
