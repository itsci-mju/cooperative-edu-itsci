<%@ page import="it_sci.model.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="it_sci.model.TeacherEvaluate" %>
<%@ page import="java.util.Arrays" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div>
<br><br>


<div align="center">
    <form action="${pageContext.request.contextPath}/teacher/select_semester_summary" name="frm">
        <p style="display: inline-block">ภาคการศึกษา</p>
        <select id="semesterSelect" name="semesterSelect" onchange="submitForm()">
<%--            <option>กรุณาเลือกเทอม</option>--%>
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
        <input type="submit" value="ค้นหา" onclick="return checkScript(frm)" />
    </form>
    <label id="selectedLabel"></label>

</div>

<table style="width: 100%; text-align: right;">
    <tr>
        <td style="width: 0">
                <c:set var="t" value="${term}"/>
                <c:set var="termFormat" value="${fn:replace(t,'/','_')}"/>
                <input type="button" value="ส่งออก คำตอบอาจารย์นิเทศ"
                       onclick="return exportTeacherAnswer()"
                       class="btn btn-success" style="width: 210px;"/>

            <input type="button" value="ส่งออก คำตอบพี่เลี้ยง"
                   onclick="return exportMentorAnswer()"
                   class="btn btn-success" style="width: 170px;"/>

            <input type="button" value="ส่งออก ผลคะแนนทั้งหมด"
                   onclick="return exportSummary()"
                   class="btn btn-success" style="width: 200px;"/>
        </td>
    </tr>
</table>

<table class="table table-hover">
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">คะแนนพี่เลี้ยงเฉลี่ย(60)</td>
        <td align="center">คะแนนอาจารย์เฉลี่ย(20)</td>
    </tr>

    <%-----------    BackUp --------------%>
    <c:forEach var="list" items="${list_student}">
        <c:set var="startdate" value="${list.startdate}"/>
        <c:set var="enddate" value="${list.enddate}"/>
        <tr>
            <td align="center"> ${list.student_id}</td>
            <td align="center"> ${list.student_name} ${list.student_lastname}</td>
            <td align="center">${list.workposition}</td>
            <td align="center">
                <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}"/> - <fmt:formatDate pattern="dd/MM/yyyy"
                                                                                              value="${enddate}"/>
            </td>
            <td align="center">

                <c:choose>
                    <c:when test="${list.sumScoreMentor == 0}">
                        -
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${list.sumScoreMentor}" type="number" pattern="#,##0.00"/>
                    </c:otherwise>
                </c:choose>

            </td>
            <td align="center">

                <c:choose>
                    <c:when test="${list.sumScoreTeacher == 0}">
                        -
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${list.sumScoreTeacher}" type="number" pattern="#,##0.00"/>
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>
    </c:forEach>
    <%-----------    BackUp --------------%>
</table>

</body>
<script>
    function exportSummary(){
        const semesterSelect = document.getElementById('semesterSelect');
        var termFormat = semesterSelect.value;
        termFormat = termFormat.replace("/","_");
        window.location.href=`${pageContext.request.contextPath}/teacher/`+termFormat+`/downloadExcel_summary`;
    }

    function exportTeacherAnswer(){
        const semesterSelect = document.getElementById('semesterSelect');
        var termFormat = semesterSelect.value;
        termFormat = termFormat.replace("/","_");
        window.location.href=`${pageContext.request.contextPath}/teacher/`+termFormat+`/downloadExcel_teacherAnswer`;
    }

    function exportMentorAnswer(){
        const semesterSelect = document.getElementById('semesterSelect');
        var termFormat = semesterSelect.value;
        termFormat = termFormat.replace("/","_");
        window.location.href=`${pageContext.request.contextPath}/teacher/`+termFormat+`/downloadExcel_mentorAnswer`;
    }
</script>


</html>

