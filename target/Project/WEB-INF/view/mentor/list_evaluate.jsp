<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>
<div class="navbar2">
    <div style="margin-left: 160px; margin-top: 65px;">
        <p class="editpro_header1" style="padding-top: 18px;">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div>
    <table class="table table-hover" >
        <tr class="table-primary" id="font">
            <td  align="center">รหัสนักศึกษา</td>
            <td  align="center">ชื่อนักศึกษา</td>
            <td  align="center">ตำแหน่ง</td>
            <td  align="center">วันที่การประเมิน</td>
            <td  align="center">คะแนน</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="mentorevaluates" items="${mentorevaluate}">
            <c:set var="assessmentdate" value="${mentorevaluates.assessment_date}" />
        <tr>
            <td  align="center"> ${mentorevaluates.student.student_id}</td>
            <td  align="center"> ${mentorevaluates.student.student_name} ${mentorevaluates.student.student_lastname}</td>
            <td  align="center">${mentorevaluates.student.workposition}</td>
            <td align="center">${mentorevaluates.assessment_date}</td>
<%--            <td align="center">--%>
<%--                <fmt:formatDate pattern="dd/MM/yyyy" value="${assessmentdate}"/>--%>
<%--            </td>--%>
            <td  align="center">${mentorevaluates.score}</td>
        </tr>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
