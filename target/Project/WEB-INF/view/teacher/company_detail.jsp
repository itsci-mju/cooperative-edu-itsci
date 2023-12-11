<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<style>
    /* สไตล์สำหรับตาราง */
    .company_detail {
        margin-left: 80px;
        width: 60%; /* กำหนดความกว้างของตาราง */
        border-collapse: collapse;
    }


    /* สไตล์สำหรับ input และ textarea */
    .company_detail textarea {
        width: 100%; /* กำหนดความกว้างเต็มหน้าจอ */
        height: 200px;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .company_detail input[type="text"]{
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    /* สไตล์สำหรับหัวข้อ */
    .company_detail p {
        font-weight: bold;
    }
</style>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">ข้อมูลบริษัท</p>
    </div>
</div><br><br>

<%--<h5 style="margin-left: 200px; font-family: 'Kanit', sans-serif; font-weight: bold;">ข้อมูลบริษัท</h5>--%>
<%--<hr style="height: 3px; width: 1060px; background-color: #990D28; border: none; box-shadow: 0 4px 6px #990D28; margin-left: 200px;"><br>--%>

<table class="company_detail" style="margin-left: 220px;"><br><br>
    <tr>
        <td><p>ชื่อบริษัท</p></td>
        <td ><input type="text" value="${company_detail.company_id}" disabled style="margin-right: 180px;"></td>
    </tr>

    <tr>
        <td><p>ที่อยู่บริษัท</p></td>
        <td style="padding: 20px 0px 20px 0px;"><textarea disabled>${company_detail.company_address} </textarea></td>
    </tr>

    <tr>
        <td><p>ผู้ประสานงาน</p></td>
        <td ><input type="text"  value="${company_detail.coordinator_name}" disabled></td>
    </tr>
    <tr>
        <td><p>เบอร์โทรศัพท์</p></td>
        <td style="padding: 20px 0px 20px 0px;"><input type="text"  value="${company_detail.phone_number}" disabled></td>
    </tr>
</table><br><br><br><br>
</body>
</html>
