<%@ page import="it_sci.model.Teacher" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="it_sci.model.TeacherEvaluate" %>
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
//    List<String> semesters = null;
//    try {
//        semesters = (List)request.getAttribute("list_semester");
//
//    } catch (Exception e) {
//
//    }
////    String semester = (String)request.getAttribute("list_semester");
%>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div><br><br>

<div align="center">
    <p style="display: inline-block">ภาคการศึกษา</p>
    <select>
        <c:forEach items="${list_semester}" var="semester">
            <option value="${semester}">${semester}</option>
        </c:forEach>
    </select>
</div>






<%--<select name="searchDate" id="searchDate" >--%>
<%--    <%for(int i = 0; i < semesters.size(); i++){ %>--%>
<%--&lt;%&ndash;    <%if(semesters.get(i).equals(getSemester)){ %>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <option selected value="<%=semesters.get(i)%>"><%=semesters.get(i)%></option>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <%}else{ %>&ndash;%&gt;--%>
<%--    <option value="<%=semesters.get(i)%>"><%=semesters.get(i)%></option>--%>
<%--    <%} %>--%>
<%--&lt;%&ndash;    <%} %>&ndash;%&gt;--%>
<%--</select>--%>

<%--<form action="/view_summary" method="get">--%>
<%--    <select name="selectedSemester">--%>
<%--        <option value="">เลือก Semester</option>--%>
<%--        <th:block th:each="semester : ${list_semesters}">--%>
<%--            <option th:value="${semester}" th:text="${semester}" th:selected="${semester == selectedSemester}"></option>--%>
<%--        </th:block>--%>
<%--    </select>--%>
<%--    <button type="submit">ค้นหา</button>--%>
<%--</form>--%>


<%--<div align="center" >--%>
<%--    <p style="display: inline-block;">ภาคการศึกษา</p><select name="semester" id="semester" style="display: inline-block; margin-left: 20px;">--%>
<%--    <option value="ภาคเรียนที่1/2566" >ภาคเรียนที่1/2566</option>--%>
<%--    <option value="ภาคเรียนที่3/2565">ภาคเรียนที่3/2565</option>--%>
<%--    <option value="ภาคเรียนที่2/2565">ภาคเรียนที่2/2565</option>--%>
<%--    <option value="ภาคเรียนที่2/2563">ภาคเรียนที่2/2563</option>--%>
<%--</select>--%>
<%--</div>--%>

<div style="margin-left: 1365px;">
    <a href="${pageContext.request.contextPath}/">
        <button type="submit" class="btn btn-success">Export Excel File</button>
    </a>
</div>

<div>

<%--    <input type="text" value="${student.semester}" disabled>--%>
</div>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">คะแนนพี่เลี้ยงเฉลี่ย</td>
        <td align="center">คะแนนอาจารย์เฉลี่ย</td>
    </tr>
    <%--        ${students}--%>

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
</table>

</body><br><br><br><br>

</html>

<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
