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
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">รายชื่อบริษัท</p>
    </div>
</div><br><br>

<div align="center">
    <form action="${pageContext.request.contextPath}/company/select_semester_list_company_supervision" name="frm">
        <p style="display: inline-block">ภาคการศึกษา</p>
        <select id="semesterSelect" name="semesterSelect" >
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

</div>

<div style="margin-left: 1309px;">
    <c:set var="t" value="${term}"/>
    <c:set var="termFormat" value="${fn:replace(t,'/','_')}"/>
    <input type="button" value="ส่งออก รายชื่ออาจารย์นิเทศ" id="exportAssign"
           onclick="return exportExcel()"
           class="btn btn-success" style="width: 210px;" />
</div>

<table class="table table-hover">
    <tr class="table-primary" id="font">
        <td align="center">รหัสบริษัท</td>
        <td>ชื่อบริษัท</td>
        <td align="center">เบอร์โทรศัพท์</td>
        <td align="center">ข้อมูลบริษัท</td>
        <td align="center">กำหนดอาจารย์นิเทศ</td>
    </tr>
    <c:forEach var="coms" items="${companies}">
        <tr>
            <td align="center">${coms.company_id}</td>
            <td>${coms.company_name}</td>
            <td align="center">${coms.phone_number}</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/company/${coms.company_id}/view_company_detail">
                    <i class="bi bi-postcard" style="font-size: 28px;"></i>
                </a>
            </td>

            <c:set var="found" value="false"/>
                <c:forEach var="listEval" items="${company_assign}" varStatus="loopStatus">
                    <c:choose>
                        <c:when test="${coms.company_id eq listEval.student.company.company_id and not found}">
                            <td align="center">
                                <c:set var="t" value="${term}"/>
                                <c:set var="termFormat" value="${fn:replace(t,'/','_')}"/>
                                <a href="${pageContext.request.contextPath}/teacher/${listEval.student.company.company_id}/update_assign_teacher/${termFormat}">
                                    <button type="button" class="btn btn-warning">แก้ไขการมอบหมาย</button>
                                </a>
                            </td>
                            <c:set var="found" value="true"/>
                        </c:when>
                    </c:choose>
                </c:forEach>

            <c:if test="${!found}">
                <td align="center">
                    <c:set var="t" value="${term}"/>
                    <c:set var="termFormat" value="${fn:replace(t,'/','_')}"/>
                    <a href="${pageContext.request.contextPath}/teacher/${coms.company_id}/assign_teacher/${termFormat}">
                        <button type="button" class="btn btn-primary" id="AssignTeacher" onclick="return assignTeacher()">มอบหมายอาจารย์</button>
                    </a>
                </td>
            </c:if>
        </tr>
    </c:forEach>

</table>

</body>
<br><br><br><br>

<script>

        var stt = '<%= request.getParameter("stt") %>';
        console.log(stt);
        if (stt === 'true') {
            alert('บันทึกข้อมูลสำเร็จ');
        }

    const semesterSelect = document.getElementById('semesterSelect');
    const dateVision = document.getElementById('dateVision');

    const selectBox = document.getElementById('teachersupervisiontime');
    const assTime = document.getElementById('assTime');


    selectBox.addEventListener('change', function() {
        // รับค่าที่เลือก
        const selectedOption = selectBox.options[selectBox.selectedIndex];
        assTime.value = selectedOption.value;
        console.log("assTime : " + assTime.value)
    });



    function exportExcel(){
        const semesterSelect = document.getElementById('semesterSelect');
        var termFormat = semesterSelect.value;
        termFormat = termFormat.replace("/","_");
            window.location.href=`${pageContext.request.contextPath}/company/`+termFormat+`/downloadExcel_List_assign_teacher`;



    if (`${status_update}` === "true"){
        alert("บันทึกข้อมูลสำเร็จ")
    }
    }




</script>




</html>
