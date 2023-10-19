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
        function submitForm () {
            document.forms[0].submit();
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

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบตรวจสอบสถานะการประเมิน (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">ตรวจสอบสถานะการประเมิน</p>
    </div>
</div><br><br>

<div align="center">
    <p style="display: inline-block">ภาคการศึกษา</p>
    <form action="${pageContext.request.contextPath}/teacher/test_status_teacher">
        <select id="semesterSelect" name="semesterSelect" onchange="submitForm()">
            <option selected>กรุณาเลือกเทอม</option>
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
</div><br><br>
<table class="table table-hover"  >
    <tr class="table-primary" id="font">
        <td align="center">รหัสนักศึกษา</td>
        <td align="center">ชื่อนักศึกษา</td>
        <td align="center">ตำแหน่ง</td>
        <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>
        <td align="center">ผู้ประเมิน</td>
        <td align="center">สถานะการประเมิน</td>
    </tr>

    <c:forEach var="list" items="${list_evaluate_status}" >
        <tr>
            <td>${list.student.student_id}</td>
            <td>${list.student.student_name} ${list.student.student_lastname}</td>
            <td>${list.student.workposition}</td>
            <td>
                <fmt:formatDate pattern="dd/MM/yyyy" value="${list.student.startdate}" var="startdate"/>
                <fmt:formatDate pattern="dd/MM/yyyy" value="${list.student.enddate}" var="enddate"/>

                ${startdate} - ${enddate}
            </td>
            <td>${list.teacher.teacher_name} ${list.teacher.teacher_lastname}</td>
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

    <%--        ${students}--%>
<%--    <c:forEach var="mentorEvaluate" items="${list_mentor_status}">--%>
<%--        <c:set var="startdate" value="${mentorEvaluate.student.startdate}" />--%>
<%--        <c:set var="enddate" value="${mentorEvaluate.student.enddate}"/>--%>
<%--        <tr>--%>
<%--            <td align="center"> ${mentorEvaluate.student.student_id}</td>--%>
<%--            <td align="center"> ${mentorEvaluate.student.student_name} ${mentorEvaluate.student.student_lastname}</td>--%>
<%--            <td align="center">${mentorEvaluate.student.workposition}</td>--%>
<%--            <td align="center">--%>
<%--                <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />--%>
<%--            </td>--%>
<%--            <td align="center">--%>
<%--                    ${mentorEvaluate.student.company.company_name}--%>
<%--            </td>--%>
<%--            <td align="center">--%>
<%--                    ${mentorEvaluate.mentor.mentor_name} ${mentorEvaluate.mentor.mentor_lastname}--%>
<%--            </td>--%>
<%--            <td align="center">--%>
<%--                <c:if test="${mentorEvaluate.assessment_status == 'ประเมินแล้ว'}">--%>
<%--                    <p style="color: green">ประเมินแล้ว</p>--%>
<%--                </c:if>--%>
<%--                <c:if test="${mentorEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">--%>
<%--                    <p style="color: red">ยังไม่ได้ประเมิน</p>--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
</table>

<%--<div align="center">--%>
<%--    <div class="hr_line"></div>--%>
<%--    <button onclick="openForm2()" id="next"class="btn btn-outline-dark" style="margin-bottom: 30px">อาจารย์</button>--%>
<%--    <button onclick="openForm1()" id="back" class="btn btn-outline-dark" style="margin-bottom: 30px">พนักงานพี่เลี้ยง</button>--%>
<%--</div>--%>

<%--<div id="form1" class="tabcontent">--%>
<%--    <table class="table table-hover"  >--%>
<%--        <tr class="table-primary" id="font">--%>
<%--            <td align="center">รหัสนักศึกษา</td>--%>
<%--            <td align="center">ชื่อนักศึกษา</td>--%>
<%--            <td align="center">ตำแหน่ง</td>--%>
<%--            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>--%>
<%--            <td align="center">อาจารย์</td>--%>
<%--            <td align="center">สถานะการประเมิน</td>--%>
<%--        </tr>--%>

<%--&lt;%&ndash;        <form action="/view_summary" method="get">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <select name="semester">&ndash;%&gt;--%>
<%--&lt;%&ndash;                <option value="">เลือก Semester</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <c:forEach items="${list_semesters}" var="semester">&ndash;%&gt;--%>
<%--&lt;%&ndash;                    <option value="${semester}">${semester}</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                </c:forEach>&ndash;%&gt;--%>
<%--&lt;%&ndash;            </select>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <button type="submit">ค้นหา</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>


<%--        <c:forEach var="teacherEvaluate" items="${list_evaluate_status}">--%>
<%--            <c:set var="startdate" value="${teacherEvaluate.student.startdate}" />--%>
<%--            <c:set var="enddate" value="${teacherEvaluate.student.enddate}"/>--%>
<%--            <tr>--%>
<%--                <td align="center"> ${teacherEvaluate.student.student_id}</td>--%>
<%--                <td align="center"> ${teacherEvaluate.student.student_name} ${teacherEvaluate.student.student_lastname}</td>--%>
<%--                <td align="center">${teacherEvaluate.student.workposition}</td>--%>
<%--                <td align="center">--%>
<%--                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                        ${teacherEvaluate.teacher.teacher_name} ${teacherEvaluate.teacher.teacher_lastname}--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                    <c:if test="${teacherEvaluate.assessment_status == 'ประเมินแล้ว'}">--%>
<%--                        <p style="color: green">ประเมินแล้ว</p>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${teacherEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">--%>
<%--                        <p style="color: red">ยังไม่ได้ประเมิน</p>--%>
<%--                    </c:if>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>

<%--<div id="form2" class="tabcontent">--%>
<%--    <table class="table table-hover"  >--%>
<%--        <tr class="table-primary" id="font">--%>
<%--            <td align="center">รหัสนักศึกษา</td>--%>
<%--            <td align="center">ชื่อนักศึกษา</td>--%>
<%--            <td align="center">ตำแหน่ง</td>--%>
<%--            <td align="center">ระยะเวลาการฝึกสหกิจศึกษา</td>--%>
<%--            <td align="center">บริษัท</td>--%>
<%--            <td align="center">พี่เลี้ยง</td>--%>
<%--            <td align="center">สถานะการประเมิน</td>--%>
<%--        </tr>--%>
<%--        &lt;%&ndash;        ${students}&ndash;%&gt;--%>
<%--        <c:forEach var="mentorEvaluate" items="${list_mentor_status}">--%>
<%--            <c:set var="startdate" value="${mentorEvaluate.student.startdate}" />--%>
<%--            <c:set var="enddate" value="${mentorEvaluate.student.enddate}"/>--%>
<%--            <tr>--%>
<%--                <td align="center"> ${mentorEvaluate.student.student_id}</td>--%>
<%--                <td align="center"> ${mentorEvaluate.student.student_name} ${mentorEvaluate.student.student_lastname}</td>--%>
<%--                <td align="center">${mentorEvaluate.student.workposition}</td>--%>
<%--                <td align="center">--%>
<%--                    <fmt:formatDate pattern="dd/MM/yyyy" value="${startdate}" /> -  <fmt:formatDate pattern="dd/MM/yyyy" value="${enddate}" />--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                        ${mentorEvaluate.student.company.company_name}--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                        ${mentorEvaluate.mentor.mentor_name} ${mentorEvaluate.mentor.mentor_lastname}--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                    <c:if test="${mentorEvaluate.assessment_status == 'ประเมินแล้ว'}">--%>
<%--                        <p style="color: green">ประเมินแล้ว</p>--%>
<%--                    </c:if>--%>
<%--                    <c:if test="${mentorEvaluate.assessment_status == 'ยังไม่ได้ประเมิน'}">--%>
<%--                        <p style="color: red">ยังไม่ได้ประเมิน</p>--%>
<%--                    </c:if>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>
<%--</div>--%>

<script>
    document.getElementById("form1").style.display = "block";
    function openList(evt, list_name) {
        var i, tabcontent, tablinks;
        tabcontent = document.getElementsByClassName("tabcontent");
        for (i = 0; i < tabcontent.length; i++) {
            tabcontent[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablinks");
        for (i = 0; i < tablinks.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" active", "");
        }
        document.getElementById(list_name).style.display = "block";
        evt.currentTarget.className += " active";
    }
    // document.getElementById("form1").style.display = "block";
    // document.getElementById("back").style.display = "none"
    function openForm1() {
        // แสดงฟอร์มที่ 1
        document.getElementById("form2").style.display = "block";
        // ซ่อนฟอร์มที่ 2 (ถ้ามี)
        document.getElementById("form1").style.display = "none";

        // document.getElementById("next").style.display = "block"
        //
        // document.getElementById("back").style.display = "none"
    }

    function openForm2() {
        // แสดงฟอร์มที่ 2
        document.getElementById("form1").style.display = "block";
        // ซ่อนฟอร์มที่ 1 (ถ้ามี)
        document.getElementById("form2").style.display = "none";

        // document.getElementById("back").style.display = "block"
        //
        // document.getElementById("next").style.display = "none"
    }

    // ตัวอย่างโค้ด JavaScript สำหรับส่งคำขอ GET
    function selectSemester(selectedSemester) {
        // ทำสิ่งที่คุณต้องการกับ selectedSemester
        // เช่น นำ selectedSemester ไปใช้ในการส่งคำขอ GET

        window.location.href = "/test_status?semesterSelect=" + selectedSemester;
    }

</script>



</body><br><br><br><br>
</html>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
