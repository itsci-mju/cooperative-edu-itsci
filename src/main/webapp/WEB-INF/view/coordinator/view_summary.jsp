<%@ page import="it_sci.model.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div>
<div>
<%--    <input type="text" value="${student.semester}" disabled>--%>
</div>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">คะแนนพี่เลี้ยงเฉลี่ย</td>
        <td align="center">คะแนนอาจารย์เฉลี่ย</td>
    </tr>
    <%--        ${students}--%>
    <c:forEach var="list" items="${list_students}">
            <c:set var="startdate" value="${list.startdate}" />
            <c:set var="enddate" value="${list.enddate}"/>
            <tr>
                <td align="center"> ${list.student_id}</td>
                <td align="center"> ${list.student_name} ${list.student_lastname}</td>
                <td align="center">${list.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                </td>
                <td align="center">${list.sumScoreMentor}</td>
<%--                <td align="center">${list.sumScoreTeacher}</td>--%>
            </tr>
    </c:forEach>
</table>

</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
