<%@ page import="it_sci.model.Teacher" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script>
        var stt = '<%= request.getParameter("stt") %>';
        console.log("STT : " + stt);
        if (stt === 'true') {
            alert('บันทึกสำเร็จ');
        }
    </script>

</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>

<body><br><br>
<%
    Teacher teacher = (Teacher) session.getAttribute("teacher");
%>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
        <p class="editpro_header2">รายชื่อบริษัท</p>
    </div><br><br><br><br><br><br><br><br>
    <div align="center">
        <form action="${pageContext.request.contextPath}/teacher/<%=teacher.getTeacher_id()%>/select_semester_list_company" name="frm">
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
            <input type="submit" value="ค้นหา" onclick="return checkScript(frm)" />
        </form>
        <label id="selectedLabel"></label>

    </div><br>

    <table class="table table-hover">
        <tr class="table-primary" id="font">
            <td align="center">รหัสบริษัท</td>
            <td>ชื่อบริษัท</td>
            <td align="center">จำนวนนักศึกษา</td>
            <td align="center">ข้อมูลบริษัท</td>
            <td align="center">ประเมินผลนักศึกษา</td>
        </tr>
        <%--        ${students}--%>
        <c:forEach var="company" items="${companies}">
            <tr>
                <td align="center"> ${company.company_id}</td>
                <td> ${company.company_name}</td>
                <td align="center">${company.students.size()}</td>
                <td align="center">
                    <a href="${pageContext.request.contextPath}/company/${company.company_id}/view_company_detail">
                        <i class="bi bi-postcard" style="font-size: 28px;"></i>
                    </a>
                </td>
                <td align="center">
                    <c:set var="t" value="${term}"/>
                    <c:set var="term" value="${fn:replace(t,'/','_')}"/>
                    <form action="${pageContext.request.contextPath}/teacher/<%= teacher.getTeacher_id()%>/list_student_by_teacher/${company.company_id}/${term}">
                        <input type="submit" class="btn btn-primary" value="ประเมินผลนักศึกษา" onclick="return assessmentTeacher()">
                    </form>

                </td>
            </tr>
        </c:forEach>
    </table>

</div>
</body>
<script>
    function assessmentTeacher() {
        const semesterSelect = document.getElementById('semesterSelect');
        var termFormat = semesterSelect.value;
        if (termFormat === "กรุณาเลือกเทอม") {
            alert("กรุณาเลือกภาคการศึกษา");
            return false;
        }
    }
</script>
</html>

