<%@ page import="it_sci.model.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
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
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>
<style>
    /* ซ่อนฟอร์มทั้งหมด */
    .tabcontent {
        display: none;
    }
</style>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div><br>
<%--<div>--%>
<%--    <input type="text" value="${student.semester}" disabled>--%>
<%--</div>--%>

<br>

<div align="center" >
    <p style="display: inline-block;">ตรวจสอบสถานะการประเมิน</p><select name="semester" id="semester" style="display: inline-block; margin-left: 20px;">
    <option value="ภาคเรียนที่1/2566" >ภาคเรียนที่1/2566</option>
    <option value="ภาคเรียนที่3/2565">ภาคเรียนที่3/2565</option>
    <option value="ภาคเรียนที่2/2565">ภาคเรียนที่2/2565</option>
    <option value="ภาคเรียนที่2/2563">ภาคเรียนที่2/2563</option>
</select>
</div>

<div align="center">
    <div class="hr_line"></div>
    <button onclick="openForm2()" id="next"class="btn btn-outline-dark" style="margin-bottom: 30px">อาจารย์</button>
    <button onclick="openForm1()" id="back" class="btn btn-outline-dark" style="margin-bottom: 30px">พนักงานพี่เลี้ยง</button>
</div>

<div id="form1" class="tabcontent">
    <table class="table table-hover"  >
        <tr class="table-primary" id="font">
            <td align="center">รหัสนักศึกษา</td>
            <td align="center">ชื่อนักศึกษา</td>
            <td align="center">ตำแหน่ง</td>
            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td align="center">อาจารย์</td>
            <td align="center">สถานะการประเมิน</td>
        </tr>
        <%--        ${students}--%>
        <c:forEach var="teacherEvaluate" items="${list_teacher_status}">
            <c:set var="startdate" value="${teacherEvaluate.student.startdate}" />
            <c:set var="enddate" value="${teacherEvaluate.student.enddate}"/>
            <tr>
                <td align="center"> ${teacherEvaluate.student.student_id}</td>
                <td align="center"> ${teacherEvaluate.student.student_name} ${teacherEvaluate.student.student_lastname}</td>
                <td align="center">${teacherEvaluate.student.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                </td>
                <td align="center">
                        ${teacherEvaluate.teacher.teacher_name} ${teacherEvaluate.teacher.teacher_lastname}
                </td>
                <td align="center">
                    <c:if test="${teacherEvaluate.assessment_status == 'ประเมินแล้ว'}">
                        <p style="color: green">ประเมินแล้ว</p>
                    </c:if>
                    <c:if test="${teacherEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">
                        <p style="color: red">ยังไม่ได้ประเมิน</p>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div id="form2" class="tabcontent">
    <table class="table table-hover"  >
        <tr class="table-primary" id="font">
            <td align="center">รหัสนักศึกษา</td>
            <td align="center">ชื่อนักศึกษา</td>
            <td align="center">ตำแหน่ง</td>
            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td align="center">บริษัท</td>
            <td align="center">พี่เลี้ยง</td>
            <td align="center">สถานะการประเมิน</td>
        </tr>
        <%--        ${students}--%>
        <c:forEach var="mentorEvaluate" items="${list_mentor_status}">
            <c:set var="startdate" value="${mentorEvaluate.student.startdate}" />
            <c:set var="enddate" value="${mentorEvaluate.student.enddate}"/>
            <tr>
                <td align="center"> ${mentorEvaluate.student.student_id}</td>
                <td align="center"> ${mentorEvaluate.student.student_name} ${mentorEvaluate.student.student_lastname}</td>
                <td align="center">${mentorEvaluate.student.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                </td>
                <td align="center">
                        ${mentorEvaluate.student.company.company_name}
                </td>
                <td align="center">
                        ${mentorEvaluate.mentor.mentor_name} ${mentorEvaluate.mentor.mentor_lastname}
                </td>
                <td align="center">
                    <c:if test="${mentorEvaluate.assessment_status == 'ประเมินแล้ว'}">
                        <p style="color: green">ประเมินแล้ว</p>
                    </c:if>
                    <c:if test="${mentorEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">
                        <p style="color: red">ยังไม่ได้ประเมิน</p>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    document.getElementById("form1").style.display = "block";
    function openList(evt, list_name) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(list_name).style.display = "block";
        evt.currentTarget.className += " active";
    }
    // document.getElementById("form1").style.display = "block";
    // document.getElementById("back").style.display = "none"
    function openForm1() {
        // แสดงฟอร์มที่ 1
        document.getElementById("form2").style.display = "block";
        // ซ่อนฟอร์มที่ 2 (ถ้ามี)
        document.getElementById("form1").style.display = "none";

        // document.getElementById("next").style.display = "block"
        //
        // document.getElementById("back").style.display = "none"
    }

    function openForm2() {
        // แสดงฟอร์มที่ 2
        document.getElementById("form1").style.display = "block";
        // ซ่อนฟอร์มที่ 1 (ถ้ามี)
        document.getElementById("form2").style.display = "none";

        // document.getElementById("back").style.display = "block"
        //
        // document.getElementById("next").style.display = "none"
    }
</script>



</body>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
