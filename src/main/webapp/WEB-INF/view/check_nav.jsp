<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="it_sci.model.Mentor" %>
<%@ page import="it_sci.model.Teacher" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 25/8/2566
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
    Teacher teacher = (Teacher) session.getAttribute("teacher");

    String user = "";
    if (mentor != null) {
        user = "mentor";
    }else if (teacher != null) {
        if (teacher.getTeacher_type().equals("3")){
            user = "coordinator";
        }else {
            user = "teacher";
        }
    }else {
        user = "";
    }
%>

<c:set var="user" value="<%= user %>"></c:set>
<c:choose>
    <c:when test="${user.equals('mentor')}">
        <jsp:include page="/WEB-INF/view/mentor/navbar.jsp"/>
    </c:when>
    <c:when test="${user.equals('coordinator')}">
        <jsp:include page="/WEB-INF/view/coordinator/navbar.jsp"/>
    </c:when>
    <c:when test="${user.equals('teacher')}" >
        <jsp:include page="/WEB-INF/view/teacher/navbar.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/view/navbar.jsp"/>
    </c:otherwise>
</c:choose>