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
        var stt = '<%= request.getParameter("stt") %>';
        console.log("STT : " + stt);
        if (stt === 'true') {
            alert('บันทึกสำเร็จ');
        }
    </script>

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
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<body><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
        <p class="editpro_header2">รายชื่อนักศึกษา</p>
    </div>
</div><br>

<div align="center">
    <form action="${pageContext.request.contextPath}/mentor/<%=mentor.getMentor_id()%>/select_semester_list_student_by_mentor" name="frm">
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
        <input type="submit" value="ค้นหา" id="search" onclick="return checkScript(frm)" />
    </form>
    <label id="selectedLabel"></label>

</div><br>

    <table class="table table-hover" >
        <tr class="table-primary" id="font">
            <td align="center">รหัสนักศึกษา</td>
            <td align="center">ชื่อนักศึกษา</td>
            <td align="center">ตำแหน่ง</td>
            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
            <td align="center">ประเมินผลนักศึกษา</td>
        </tr>
<%--        ${students}--%>
            <c:forEach var="mentor" items="${mentors}">
                <c:forEach items="${mentor.students}" var="student">
                    <c:set var="mId" value="<%=mentor.getMentor_id()%>" />
                    <c:set var="startdate" value="${student.startdate}" />
                    <c:set var="enddate" value="${student.enddate}"/>
                    <c:if test="${mId == mentor.mentor_id}">
                        <c:choose>
                            <c:when test="${mentorEvaluates.size() == 0}">
                                <%--                    <c:forEach var="mentorEvaluate" items="${mentorEvaluates}">--%>
                                <%--                        <c:if test="${mentor.mentor_id != mentorEvaluate.mentor.mentor_id && student.student_id != mentorEvaluate.student.student_id || mentorEvaluate == null}">--%>
                                <%--                            <c:set var="status" value="fail"/>--%>
                                <%--                        </c:if>--%>
                                <%--                        <c:otherwise>--%>
                                <%--                            <c:set var="status" value="pass"/>--%>
                                <%--                        </c:otherwise>--%>
                                <%--                    </c:forEach>--%>
                                <%--                <c:if test="${mentorEvaluates == null || status == 'fail'}">--%>
                                <%--                <c:forEach var="mentorEvaluate" items="${mentorEvaluates}">--%>
                                <%--                    <c:if test="${student.student_id != mentorEvaluate.student.student_id}">--%>
                                <tr>
                                    <td align="center"> ${student.student_id}</td>
                                    <td align="center"> ${student.student_name} ${student.student_lastname}</td>
                                    <td align="center">${student.workposition}</td>
                                    <td align="center">
                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />
                                    </td>
                                    <td align="center">
                                        <a href="${pageContext.request.contextPath}/mentor/${student.student_id}/evaluate/<%=mentor.getMentor_id()%>">
                                            <button type="submit" class="btn btn-success">ประเมินนักศึกษา</button>
                                        </a>
                                    </td>
                                </tr>
                                <%--                    </c:if>--%>
                                <%--                </c:forEach>--%>
                                <%--                </c:if>--%>
                            </c:when>
                            <c:otherwise>

                            </c:otherwise>
                        </c:choose>
<%--                        <c:forEach items="${mentorEvaluates}" var="mentorEV">--%>
<%--                            <c:if test="${mentorEV.student.student_id != student.student_id}">--%>

<%--                            </c:if>--%>
<%--                        </c:forEach>--%>
                    </c:if>
                </c:forEach>
            </c:forEach>
    </table>


</body><br><br><br><br>
<script>
    // function search(){
    //     document.getElementById("search").click();
    // }
    // window.addEventListener('load',search);
</script>

</html>

