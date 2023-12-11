<%@ page import="it_sci.model.Mentor" %>
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
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">ผลการประเมินการฝึกสหกิจศึกษา</p>
    </div>
</div><br>
<div align="center">
    <form action="${pageContext.request.contextPath}/mentor/<%=mentor.getMentor_id()%>/select_semester_list_mentor_evaluate" name="frm">
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

<table class="table table-hover">
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">วันที่การประเมิน</td>
        <td align="center">คะแนน</td>
    </tr>
    <%--        ${students}--%>
    <c:forEach var="mentorevaluates" items="${list_mentor_evaluate}">
        <c:set var="assessmentdate" value="${mentorevaluates.assessment_date}"/>
        <c:if test="${mentorevaluates.assessment_status == 'ประเมินแล้ว' && mentor_id == mentorevaluates.mentor.mentor_id}">
            <tr>
                <td align="center">${mentorevaluates.student.student_id}</td>
                <td align="center">${mentorevaluates.student.student_name} ${mentorevaluates.student.student_lastname}</td>
                <td align="center">${mentorevaluates.student.workposition}</td>
                <td align="center">
                    <fmt:formatDate pattern="dd/MM/yyyy" value="${assessmentdate}"/>
                </td>
                <td align="center">${mentorevaluates.score}</td>
            </tr>
        </c:if>
    </c:forEach>
</table>


</body>
<br><br><br><br>

</html>

