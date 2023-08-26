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
<div class="navbar2"><br><br>
    <div style="margin-left: 160px">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div><br>
    <table class="table table-hover"  >
        <tr>
            <td>รหัสนักศึกษา</td>
            <td>ชื่อนักศึกษา</td>
            <td>ตำแหน่ง</td>
            <td>ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td>ประเมินผลนักศึกษา</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="teacherEvaluate" items="${ListStudents}">
        <tr>
            <td> ${teacherEvaluate.student.student_id}</td>
            <td> ${teacherEvaluate.student.student_name} ${teacherEvaluate.student.student_lastname}</td>
            <td>${teacherEvaluate.student.startdate} - ${teacherEvaluate.student.enddate}</td>
            <td>${teacherEvaluate.student.workstation}</td>
            <td>
                <a href="${pageContext.request.contextPath}/teacher/${teacherEvaluate.student.student_id}/evaluate">
                    <button type="submit" class="btn btn-success">ประเมินนักศึกษา</button>
                </a>


            </td>
        </tr>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
