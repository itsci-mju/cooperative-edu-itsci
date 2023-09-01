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
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div>
    <table class="table table-hover"  >
        <tr class="table-primary" id="font">
            <td align="center">รหัสนักศึกษา</td>
            <td align="center">ชื่อนักศึกษา</td>
            <td align="center">ตำแหน่ง</td>
            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td align="center">ประเมินผลนักศึกษา</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="teacherEvaluate" items="${ListStudents}">
            <c:if test="${teacherEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">
                <c:set var="startdate" value="${teacherEvaluate.student.startdate}" />
                <c:set var="enddate" value="${teacherEvaluate.student.enddate}"/>
        <tr>
            <td align="center"> ${teacherEvaluate.student.student_id}</td>
            <td align="center"> ${teacherEvaluate.student.student_name} ${teacherEvaluate.student.student_lastname}</td>
            <td align="center">${teacherEvaluate.student.workposition}</td>
            <td align="center">
                <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
            </td>

            <td align="center">
                <a href="${pageContext.request.contextPath}/teacher/${teacherEvaluate.student.student_id}/evaluate/<%=teacher.getTeacher_id()%>/${teacherEvaluate.assessment_id}">
                    <button type="submit" class="btn btn-success">ประเมินนักศึกษา</button>
                </a>


            </td>
        </tr>
            </c:if>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
