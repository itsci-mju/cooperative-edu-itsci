<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
<%--    <link href="${pageContext.request.contextPath}/assets/css/mentor/liststudent.css" rel="stylesheet">--%>
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>

<body>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br>
<div class="navbar2"><br><br><br>
    <div style="margin-left: 160px">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div><br>
    <table class="table table-hover" >
        <tr>
            <td>รหัสนักศึกษา</td>
            <td>ชื่อนักศึกษา</td>
            <td>ตำแหน่ง</td>
            <td>วันที่การประเมิน</td>
            <td>คะแนน</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="mentorevaluate" items="${mentorevaluate}">
        <tr>
            <td> ${mentorevaluate.student.student_id}</td>
            <td> ${mentorevaluate.student.student_name} ${mentorevaluate.student.student_lastname}</td>
            <td>${mentorevaluate.student.workstation}</td>
            <td>${mentorevaluate.assessment_date}</td>
            <td>${mentorevaluate.score}</td>
        </tr>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
