<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div style="margin-left: 160px; margin-top: 0px;" >
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">รายชื่อบริษัท</p>
    </div>
</div>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสบริษัท</td>
        <td>ชื่อบริษัท</td>
        <td align="center">จำนวนนักศึกษา</td>
        <td align="center">ข้อมูลบริษัท</td>
        <td align="center">ประเมินผลนักศึกษา</td>
    </tr>
    <%--        ${students}--%>
    <c:forEach var="company" items="${companies}">
        <tr>
            <td align="center"> ${company.company_id}</td>
            <td> ${company.company_name}</td>
            <td align="center">${company.students.size()}</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/company/${company.company_id}/view_company_detail">
                    <i class="bi bi-postcard" style="font-size: 28px;"></i>
                </a>
            </td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/teacher/${teacher_id}/list_student_by_teacher/${company.company_id}">
                    <i class="bi bi-file-person" style="font-size: 28px;"></i>
                </a>
            </td>
        </tr>
    </c:forEach>
<%--    <c:forEach var="company" items="${companies}">--%>
<%--        <c:forEach var="stu" items="${company.students}">--%>
<%--            <tr>--%>
<%--                <td> ${stu.company.company_name}</td>--%>
<%--                <td> ${stu.student_name}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </c:forEach>--%>
</table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
