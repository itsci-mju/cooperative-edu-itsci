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

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br><br>
    <div style="margin-left: 160px">
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">รายชื่อบริษัท</p>
    </div>
</div>
    <table class="table table-hover" >
        <tr class="table-primary" id="font">
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
            <td><a href="${pageContext.request.contextPath}/company/${company.company_id}/view_company_detail">
                <i class="bi bi-postcard" style="font-size: 28px;"></i>
            </a>
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
