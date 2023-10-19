<%@ page import="it_sci.model.Mentor" %>
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
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<body><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div>
    <table class="table table-hover"  >
        <tr class="table-primary" id="font">
            <td align="center">รหัสนักศึกษา</td>
            <td align="center">ชื่อนักศึกษา</td>
            <td align="center">ตำแหน่ง</td>
            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td align="center">ประเมินผลนักศึกษา</td>
        </tr>
<%--        ${students}--%>
        <c:forEach var="mentor" items="${mentors}">
            <c:forEach var="student" items="${mentor.students}">
                <c:set var="startdate" value="${student.startdate}" />
                <c:set var="enddate" value="${student.enddate}"/>
<%--                    <c:forEach var="mentorEvaluate" items="${mentorEvaluates}">--%>
<%--                        <c:if test="${mentor.mentor_id != mentorEvaluate.mentor.mentor_id && student.student_id != mentorEvaluate.student.student_id || mentorEvaluate == null}">--%>
<%--                            <c:set var="status" value="fail"></c:set>--%>
<%--                        </c:if>--%>
<%--                        <c:otherwise>--%>
<%--                            <c:set var="status" value="pass"></c:set>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:forEach>--%>
<%--                <c:if test="${mentorEvaluates == null || status == 'fail'}">--%>
                    <tr>
                        <td align="center"> ${student.student_id}</td>
                        <td align="center"> ${student.student_name} ${student.student_lastname}</td>
                        <td align="center">${student.workposition}</td>
                        <td align="center">
                            <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                        </td>
<%--                        <td align="center">--%>
<%--                            <a href="${pageContext.request.contextPath}/mentor/${student.student_id}/evaluate/<%=mentor.getMentor_id()%>">--%>
<%--                                <button type="submit" class="btn btn-success">ประเมินนักศึกษา</button>--%>
<%--                            </a>--%>
<%--                        </td>--%>
                        <td align="center">
                            <a href="${pageContext.request.contextPath}/mentor/${student.student_id}/evaluate/<%=mentor.getMentor_id()%>">
                                <button type="submit" class="btn btn-success">ประเมิน</button>
                            </a>
                        </td>
                    </tr>
<%--                </c:if>--%>
                </c:forEach>
        </c:forEach>
    </table>


</body><br><br><br><br>

</html>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
