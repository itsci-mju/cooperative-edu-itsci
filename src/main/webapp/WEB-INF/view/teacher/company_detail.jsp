<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา/ข้อมูลบริษัท</p>
    </div>
</div>

<table class="company_detail" style="margin-left: 80px;"><br><br>
    <tr>
        <td><p>ชื่อบริษัท</p></td>
        <td><input type="text" value="${company_detail.company_id}" disabled></td>
    </tr>

    <tr>
        <td><p>ที่อยู่บริษัท</p></td>
        <td><textarea disabled>${company_detail.company_address} </textarea></td>
    </tr>

    <tr>
        <td><p>ผู้ประสานงาน</p></td>
        <td><input type="text"  value="${company_detail.coordinator_name}" disabled></td>
    </tr>
    <tr>
        <td><p>เบอร์โทรศัพท์</p></td>
        <td><input type="text"  value="${company_detail.phone_number}" disabled></td>
    </tr>
</table><br><br>
</body>
</html>
