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
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">รายชื่อบริษัท</p>
    </div>
</div><br>
    <table class="table table-hover" >
        <tr>
            <td>รหัสบริษัท</td>
            <td>ชื่อบริษัท</td>
            <td>เบอร์โทรศัพท์</td>
            <td>ข้อมูลบริษัท</td>
            <td>กำหนดอาจารย์นิเทศ</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="company" items="${companies}">
        <tr>
            <td> ${company.company_id}</td>
            <td> ${company.company_name}</td>
            <td>${company.phone_number}</td>
            <td><i class="fas fa-id-card" style="width: 50px"></i></td>
            <td>
                <a href="${pageContext.request.contextPath}/teacher/${company.company_id}/assign_teacher">
                    <button type="button" class="btn btn-primary">มอบหมายอาจารย์</button>
                </a>
            </td>
        </tr>
        </c:forEach>
    </table>


</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
