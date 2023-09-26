<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>assign_teacher</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/teacher/assign_teacher.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">กำหนดอาจารย์นิเทศ</p>
    </div>
</div><br><br>
<h3 style="font-family: 'Prompt', sans-serif; margin-left: 50px; color: #990D28">กำหนดอาจารย์นิเทศในบริษัท  ${companies.company_name}</h3>
<hr style="height: 3px; width: 800px; background-color: #990D28; margin: -5px 0px 0px 50px; border: none; box-shadow: 0 4px 6px #990D28;"><br><br>

<form action="${pageContext.request.contextPath}/teacher/${companies.company_id}/submit_evaluate" method="POST" >
<table align="center" id="myTable" >
    <tr>
            <td colspan="4" style="padding-left: 40%;">ภาคการศึกษา<select name="semester" id="semester" style="display: inline-block; margin-left: 20px;">
                <option value="ภาคเรียนที่1/2566">ภาคเรียนที่1/2566</option>
                <option value="ภาคเรียนที่3/2565">ภาคเรียนที่3/2565</option>
                <option value="ภาคเรียนที่2/2565">ภาคเรียนที่2/2565</option>
                <option value="ภาคเรียนที่2/2563">ภาคเรียนที่2/2563</option>
            </select>
            </td>
        </tr>
<%--    <tr >--%>
<%--        <td><p>ภาคการศึกษา</p></td>--%>
<%--        <td><input type="text" value="${student.semester}" disabled></td>--%>
<%--    </tr>--%>
    <tr >
        <td style=" padding-left: 30px;">วันที่นิเทศ</td>
        <td style=" padding-left: 30px;"><input type="date" name="teachersupervisiondate" id="teachersupervisiondate"></td>
        <td style=" padding-left: 30px;">เวลานิเทศ</td>
        <td style=" padding-left: 30px;"><input type="text" name="teachersupervisiontime" id="teachersupervisiontime"></td>
    </tr>
    <tr>
        <td colspan="4" style="padding: 30px 0px 30px 150px; background-color: #bee5eb">เลือกอาจารย์</td>
    </tr>
    <tr>
        <td colspan="4" style="padding: 20px 0px 30px 500px;">
            <c:forEach var="teacher" items="${teachers}">
                <input type="radio" name="teacher" value="${teacher.teacher_id}" style="margin-top: 30px;">${teacher.teacher_name} ${teacher.teacher_lastname}<br>
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
<div style="margin: 35px 0px 100px 640px;" class="btn">
    <button type="submit" class="btn btn-success">บันทึก</button>
    <button type="button" class="btn btn-warning">ยกเลิก</button>
</div>
</form>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</body>
</html>
