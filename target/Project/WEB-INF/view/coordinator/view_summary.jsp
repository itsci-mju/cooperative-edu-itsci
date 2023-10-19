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
        function submitForm () {
            document.forms[0].submit();
        }
    </script>

</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div>
<br><br>


<div align="center">
    <p style="display: inline-block">ภาคการศึกษา</p>
        <form action="${pageContext.request.contextPath}/teacher/testlist">
            <select id="semesterSelect" name="semesterSelect" onchange="submitForm()">
                <option >กรุณาเลือกเทอม</option>
                <c:forEach items="${list_semester}" var="listsemester">

                    <option value="${listsemester}">${listsemester}</option>
<%--                    <c:choose>--%>
<%--                        <c:when test="${listsemester eq select_semester}">--%>
<%--                            <option value="${listsemester}">${listsemester}</option>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <option value="${listsemester}">${listsemester}</option>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
                </c:forEach>
            </select>
        </form>

        <label id="selectedLabel"></label>
<%--    ---------    BackUp --------------%>

<%--        <select id="semesterSelect" name="semesterSelect">--%>
<%--            <c:forEach var="semester" items="${list_semester}">--%>
<%--                <option value="${semester}">${semester}</option>--%>
<%--            </c:forEach>--%>
<%--        </select>--%>

<%--    <select id="semesterSelect" name="semesterSelect" onchange="showSelectedData()">--%>
<%--        <c:forEach var="semester" items="${list_semester}">--%>
<%--            <option value="${semester}">${semester}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>
<%--    <label id="selected"></label>--%>

<%--    <div id="tableContainer">--%>
<%--        <!-- ตารางจะถูกสร้างและแอปเนิคที่นี่ -->--%>
<%--    </div>--%>

    <%--    <c:forEach var="semester" items="${list_semester}">--%>
    <%--        <div id="data${semester}" class="semesterData" style="display: none"></div>--%>
    <%--    </c:forEach>--%>
</div>

<%--<div align="center">--%>
<%--    <p style="display: inline-block">ภาคการศึกษา</p>--%>
<%--    <select >--%>
<%--        <c:forEach items="${list_semester}" var="listsemester">--%>
<%--            <option value="${listsemester}">${listsemester}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>
<%--</div>--%>


<div style="margin-left: 1350px;>">
    <c:set var="t" value="${term}"/>
    <c:set var="termFormat" value="${fn:replace(t,'/','_')}"/>
    <input type="button" value="Export Excel File"
           onclick="window.location.href='${pageContext.request.contextPath}/teacher/${termFormat}/downloadExcel'; return false;"
           class="btn btn-success" style="width: 170px;"/>
</div>

<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">คะแนนพี่เลี้ยงเฉลี่ย(60)</td>
        <td align="center">คะแนนอาจารย์เฉลี่ย(20)</td>
    </tr>

<%-----------    BackUp --------------%>
    <c:forEach var="list" items="${list_students}">
            <c:set var="startdate" value="${list.startdate}" />
            <c:set var="enddate" value="${list.enddate}"/>
            <tr>
                <td align="center"> ${list.student_id}</td>
                <td align="center"> ${list.student_name} ${list.student_lastname}</td>
                <td align="center">${list.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                </td>
                <td align="center">${list.sumScoreMentor}</td>
                <td align="center">${list.sumScoreTeacher}</td>
            </tr>
    </c:forEach>
<%-----------    BackUp --------------%>
</table>

</body>
<br><br><br><br>


</html>

<%--<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>--%>
