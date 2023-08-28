<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>assign_teacher</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>

<body><br><br>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br><br>
    <div style="margin-left: 160px">
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">กำหนดอาจารย์นิเทศ</p>
    </div>
</div><br>
<h3>กำหนดอาจารย์นิเทศในบริษัท${companies.company_name}</h3>
<form action="${pageContext.request.contextPath}/teacher/${companies.company_id}/submit_evaluate" method="POST" >

<table class="dropdown" align="center">
<%--    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
<%--        ภาคการศึกษา--%>
<%--    </button>--%>
<%--    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--%>
<%--        <a class="dropdown-item" href="#">ภาคเรียนที่2/2563</a>--%>
<%--        <a class="dropdown-item" href="#">ภาคเรียนที่2/2565</a>--%>
<%--        <a class="dropdown-item" href="#">ภาคเรียนที่3/2565</a>--%>
<%--    </div>--%>
    <tr>
        <td colspan="4">ภาคการศึกษา<select name="semester" id="semester">
            <option value="ภาคเรียนที่2/2563">ภาคเรียนที่2/2563</option>
            <option value="ภาคเรียนที่2/2565">ภาคเรียนที่2/2565</option>
            <option value="ภาคเรียนที่3/2565">ภาคเรียนที่3/2565</option>
            <option value="ภาคเรียนที่1/2566">ภาคเรียนที่1/2566</option>
        </select>
        </td>
    </tr>
    <tr>
        <td>วันที่นิเทศ</td>
        <td><input type="date" name="teachersupervisiondate" id="teachersupervisiondate"></td>
        <td>เวลานิเทศ</td>
        <td><input type="text" name="teachersupervisiontime" id="teachersupervisiontime"></td>
    </tr>
    <tr>
        <td colspan="2">กำหนดอาจารย์นิเทศ</td>
    </tr>
    <tr>
        <td colspan="2">
            <c:forEach var="teacher" items="${teachers}">
                <input type="radio" name="teacher" value="${teacher.teacher_id}" >${teacher.teacher_name} ${teacher.teacher_lastname}<br>
            </c:forEach>
<%--            <input type="radio" name="teacher" value="${teachers}" >ผศ.ดร.สายัณห์ อุ่นนันกาศ<br>--%>
<%--            <input type="radio" name="teacher" value="อ.ดร.จักรกฤช เตโช" >อ.ดร.จักรกฤช เตโช<br>--%>
<%--            <input type="radio" name="teacher" value="อ.ดร.ภรต รัตนปิณฑะ" >อ.ดร.ภรต รัตนปิณฑะ<br>--%>
<%--            <input type="radio" name="teacher" value="อ.ดร.วัชรินทร์ สาระไชย" >อ.ดร.วัชรินทร์ สาระไชย<br>--%>
<%--            <input type="radio" name="teacher" value="อ.พิชชยานิดา คำวิชัย" >อ.พิชชยานิดา คำวิชัย<br>--%>
<%--            <input type="radio" name="teacher" value="อ.จิราวรรณ รอนราญ" >อ.จิราวรรณ รอนราญ<br>--%>
<%--            <input type="radio" name="teacher" value="อ.ดร.วรรณวิมล นาดี" >อ.ดร.วรรณวิมล นาดี<br>--%>
        </td>
    </tr>
</table>
<div style="margin: 35px 0px 100px 640px;">
    <button type="submit" class="btn btn-success">บันทึก</button>
    <button type="button" class="btn btn-warning">ยกเลิก</button>
</div>
</form>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</body>
</html>
