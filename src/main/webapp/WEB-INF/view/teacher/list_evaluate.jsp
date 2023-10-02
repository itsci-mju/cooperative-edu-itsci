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
<body ><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ผลการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
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
        <c:forEach var="teacherevaluates" items="${list_teacher_evaluate}">
            <c:set var="assessmentdate" value="${teacherevaluates.assessment_date}" />
        <c:if test="${teacherevaluates.assessment_status == 'ประเมินแล้ว'}">
            <tr>
                <td  align="center"> ${teacherevaluates.student.student_id}</td>
                <td  align="center"> ${teacherevaluates.student.student_name} ${teacherevaluates.student.student_lastname}</td>
                <td  align="center">${teacherevaluates.student.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${assessmentdate}"/>
                </td>
                <td  align="center">${teacherevaluates.score}</td>
            </tr>
        </c:if>
        </c:forEach>
    </table>


</body><br><br><br><br>

</html>

<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
