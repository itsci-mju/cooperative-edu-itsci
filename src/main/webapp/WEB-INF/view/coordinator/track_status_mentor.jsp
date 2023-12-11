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
    <script>

        var term = document.getElementById("semesterSelect").value = 0;

        function checkScript(frm){
            if (frm.semesterSelect.value === "กรุณาเลือกเทอม"){
                alert("กรุณาเลือกภาคการศึกษา")
                return false
            }else {
                term = 1
            }
        }
    </script>
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
    tr td {
        text-align: center;
    }
</style>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div><br><br>

<div align="center">
    <form action="${pageContext.request.contextPath}/teacher/select_semester_mentor_status" name="frm">
        <p style="display: inline-block">ภาคการศึกษา</p>
        <select id="semesterSelect" name="semesterSelect" onchange="submitForm()">
            <c:forEach items="${list_semester}" var="listsemester">
                <c:choose>
                    <c:when test="${listsemester.equals(term)}">
                        <option value="${listsemester}" selected>${listsemester}</option>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${listsemester ne ''}">
                            <option value="${listsemester}">${listsemester}</option>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </select>
        <input type="submit" value="ค้นหา" onclick="return checkScript(frm)"/>
    </form>
    <label id="selectedLabel"></label>

</div><br>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">บริษัท</td>
        <td align="center">ผู้ประเมิน</td>
        <td align="center">สถานะการประเมิน</td>
    </tr>

    <c:forEach var="list" items="${list_mentor_status}" >
        <tr>
            <td>${list.student.student_id}</td>
            <td>${list.student.student_name} ${list.student.student_lastname}</td>
            <td>${list.student.workposition}</td>
            <td>
                <fmt:formatDate pattern="dd/MM/yyyy" value="${list.student.startdate}" var="startdate"/>
                <fmt:formatDate pattern="dd/MM/yyyy" value="${list.student.enddate}" var="enddate"/>

                    ${startdate} - ${enddate}
            </td>
            <td>${list.student.company.company_name}</td>
            <td>${list.mentor.mentor_name} ${list.mentor.mentor_lastname}</td>
            <td>
                <c:if test="${list.assessment_status == 'ประเมินแล้ว'}">
                    <p style="color: green">ประเมินแล้ว</p>
                </c:if>
                <c:if test="${list.assessment_status == 'ยังไม่ได้ประเมิน'}">
                    <p style="color: red">ยังไม่ได้ประเมิน</p>
                </c:if>
            </td>
        </tr>
    </c:forEach>

</table>

</body><br><br><br><br>
</html>
