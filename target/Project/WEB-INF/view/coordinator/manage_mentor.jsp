<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>

</head>
<body>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">ชื่อพนักงานพี่เลี้ยง</td>
        <td align="center">ชื่อบริษัท</td>
        <td align="center">จัดการเข้าสู่ระบบพี่เลี้ยง</td>
    </tr>

    <%--        ${students}--%>
    <c:forEach var="list" items="${mentors}">
            <tr>
                <td align="center"> ${list.mentor_name} ${list.mentor_lastname}</td>
                <td align="center">${list.mentor_position}</td>
                <td align="center">
                    <a href="${pageContext.request.contextPath}/teacher/manage_mentor_login/${list.mentor_id}">
                        <button type="submit" class="btn btn-success">ประเมินนักศึกษา</button>
                    </a>


                </td>
            </tr>
    </c:forEach>
</table>

</body>
</html>
