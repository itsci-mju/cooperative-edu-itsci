<%@ page import="it_sci.model.Mentor" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br><br>
    <div style="margin-left: 160px">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div><br>
    <table class="table table-hover"  >
        <tr class="table-primary" id="font">
            <td>รหัสนักศึกษา</td>
            <td>ชื่อนักศึกษา</td>
            <td>ตำแหน่ง</td>
            <td>ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td>ประเมินผลนักศึกษา</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="student" items="${students}">
        <tr>
            <td> ${student.student_id}</td>
            <td> ${student.student_name} ${student.student_lastname}</td>
            <td>${student.workstation}</td>
            <td>${student.startdate} - ${student.enddate}</td>
            <td>
                <a href="${pageContext.request.contextPath}/mentor/${student.student_id}/evaluate/<%=mentor.getMentor_id()%>">
<%--                    <input type="submit" value="ประเมิน" class="sub_editprofile">--%>
                    <button type="submit" class="btn btn-success">ประเมิน</button>
                </a>
            </td>
        </tr>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
