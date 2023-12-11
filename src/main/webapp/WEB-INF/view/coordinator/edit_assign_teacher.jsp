<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>assign_teacher</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/teacher/assign_teacher.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
    <script>
        var index = 0;
        var time = `${company.teacher_super_vision_time}`;
        console.log("time " + `${company.teacher_super_vision_time}`)
        if (time === "09.00-12.00 น.") {
            index = 0;
        } else if (time === "13.00-16.00 น.") {
            index = 1;
        }
        window.onload = function () {
            document.getElementById("teachersupervisiontime").selectedIndex = index;
        };
    </script>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>

<style>
    #myTable1 {
        background-color: #f2f2f2; /* สีเทาอ่อน */
        border-collapse: collapse; /* รวมเส้นกรอบของเซลล์ */
        width: 80%; /* กว้างของตารางเท่ากับ 80% ของพื้นที่ที่มีอยู่ */
        margin: 0 auto; /* จัดตารางตรงกลาง */
        padding: 20px; /* เพิ่มระยะห่างรอบตาราง 20px */
        border-radius: 20px;
        overflow: hidden;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    /* สีพื้นหลังของเซลล์ */
    #myTable1 td {
        background-color: #fff; /* สีขาว */
        padding: 10px; /* เพิ่มระยะห่างรอบเซลล์ 10px */
        border: 2px solid #ddd; /* สร้างเส้นกรอบด้วยสีเทาอ่อน */
        font-weight: bold;
    }

    /* สีขอบของเซลล์เมื่อชี้ไปที่เซลล์ */
    #myTable1 td:hover {
        background-color: #f0f0f0; /* เปลี่ยนสีพื้นหลังเมื่อชี้ไปที่เซลล์เป็นสีเทาอ่อน */
    }
    /* สีพื้นหลังของตาราง */
    #myTable {
        background-color: #f2f2f2; /* สีเทาอ่อน */
        border-collapse: collapse; /* รวมเส้นกรอบของเซลล์ */
        width: 80%; /* กว้างของตารางเท่ากับ 80% ของพื้นที่ที่มีอยู่ */
        margin: 0 auto; /* จัดตารางตรงกลาง */
        padding: 20px; /* เพิ่มระยะห่างรอบตาราง 20px */
        border-radius: 50px;
        overflow: hidden;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }

    /* สีพื้นหลังของเซลล์ */
    #myTable td {
        background-color: #fff; /* สีขาว */
        padding: 10px; /* เพิ่มระยะห่างรอบเซลล์ 10px */
        border: 2px solid #ddd; /* สร้างเส้นกรอบด้วยสีเทาอ่อน */
        font-weight: bold;
    }

    /* สีขอบของเซลล์เมื่อชี้ไปที่เซลล์ */
    #myTable td:hover {
        background-color: #f0f0f0; /* เปลี่ยนสีพื้นหลังเมื่อชี้ไปที่เซลล์เป็นสีเทาอ่อน */
    }

    /* สีขอบของปุ่มเมื่อชี้ไปที่ปุ่มแต่ปุ่มยกเลิก */
    .btn.btn-warning:hover {
        background-color: #ec5b0c; /* เปลี่ยนสีพื้นหลังเมื่อชี้ไปที่ปุ่มยกเลิกเป็นสีส้ม */
        border: 1px solid #f2b933; /* เปลี่ยนสีเส้นกรอบของปุ่มยกเลิกเมื่อชี้ไปที่ปุ่ม */
    }

    /* สีขอบของปุ่มเมื่อชี้ไปที่ปุ่มบันทึก */
    .btn.btn-success:hover {
        background-color: #367342; /* เปลี่ยนสีพื้นหลังเมื่อชี้ไปที่ปุ่มบันทึกเป็นสีเขียว */
        border: 1px solid #4CAF50; /* เปลี่ยนสีเส้นกรอบของปุ่มบันทึกเมื่อชี้ไปที่ปุ่ม */
    }


</style>
<%--style="background-color: #fcfaf1;"--%>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br><br><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบการกำหนดอาจารย์นิเทศการฝึกสหกิจศึกษา (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">แก้ไขการกำหนดอาจารย์นิเทศ</p>
    </div>
</div>
<br><br>
<h3 style="font-family: 'Prompt', sans-serif; margin-left: 50px; color: #990D28">
    กำหนดอาจารย์นิเทศในบริษัท ${company.student.company.company_name}</h3>
<hr style="height: 3px; width: 800px; background-color: #990D28; margin: -5px 0px 0px 50px; border: none; box-shadow: 0 4px 6px #990D28;">
<br><br>

<form action="${pageContext.request.contextPath}/teacher/${company_id}/update_assign_teacher_by_company"
      method="POST"
      id="evaluationForm" onsubmit="return disableSubmitButton();">
    <table align="center" id="myTable1">
        <tr>
            <td colspan="5" style="padding-left: 40%;">ภาคการศึกษา
                <input type="text" name="formatTerm" value="${formatTerm}" disabled>
                <input type="hidden" name="format_term" value="${formatTerm}">
            </td>
        </tr>
        <tr>
            <td style=" padding-left: 30px;">วันที่นิเทศ</td>
            <td style=" padding-left: 30px;">
<%--                <fmt:formatDate value="${showInputValue}" pattern="yyyy 'ค.ศ.' แปลงเป็น พ.ศ. 'ร.'" />--%>
                <input type="date" name="teachersupervisiondate"
                       id="teachersupervisiondate"  value="${company.teacher_super_vision_date}" oninput="showInputValue()"/>
            </td>
            <td style="padding-left: 30px;">
                <select name="teachersupervisiontime" id="teachersupervisiontime">
                    <option value="09.00-12.00 น.">09.00-12.00 น.</option>
                    <option value="13.00-16.00 น.">13.00-16.00 น.</option>
                </select>
        </tr>
    </table>
</form>

<form action="${pageContext.request.contextPath}/teacher/${company_id}/update_assign_by_company_submit"
      method="post" id="updateAssign2">
    <table id="myTable">
        <tr>
            <td>
                <input type="hidden" name="default_vision_date" id="default_vision_date" value="${select_teacher.teacherEvaluates.get(0).teacher_super_vision_date}">
                <input type="hidden" name="default_vision_time" id="default_vision_time" value="${select_teacher.teacherEvaluates.get(0).teacher_super_vision_time}">
                <input type="hidden" name="default_semester" id="default_semester" value="${select_teacher.teacherEvaluates.get(0).semester}">

                <input type="hidden" name="dateVision" id="dateVision">
                <input type="hidden" name="assTime" id="assTime">
                <input type="hidden" name="termUp" id="termUp" value="${term}">
            </td>
        </tr>
        <tr>
            <td style="padding: 30px 0px 30px 150px; background-color: #bee5eb">เลือกอาจารย์</td>
        </tr>
        <tr>
            <td style="padding-left: 500px">
                <c:forEach var="list_teacher" items="${update_teacher}">
                    <c:choose>
                        <c:when test="${list_teacher.teacher_id == select_teacher.teacher_id}">
                            <input type="radio" name="teacher" checked value="${list_teacher.teacher_id}" style="margin-top: 30px;"/>${list_teacher.teacher_name} ${list_teacher.teacher_lastname}<br>
                        </c:when>
                        <c:otherwise>
                            <input type="radio" name="teacher" value="${list_teacher.teacher_id}" style="margin-top: 30px;"/>${list_teacher.teacher_name} ${list_teacher.teacher_lastname}<br>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <input type="submit" class="btn btn-success" value="บันทึก">
                <a href="${pageContext.request.contextPath}/company/list_company"><button type="button" class="btn btn-warning">ย้อนกลับ</button></a>
            </td>
        </tr>
    </table>
</form>


<br><br><br><br>
<script>
    var index = 0;
    var time = `${company.teacher_super_vision_time}`;
    console.log("time " + `${company.teacher_super_vision_time}`)
    if (time === "09.00-12.00 น.") {
        index = 0;
    } else if (time === "13.00-16.00 น.") {
        index = 1;
    }
    window.onload = function () {
        document.getElementById("teachersupervisiontime").selectedIndex = index;
    };


</script>

<script>
    const teachervisiondate = document.getElementById('teachersupervisiondate');
    const dateVision = document.getElementById('dateVision');

    const selectBox = document.getElementById('teachersupervisiontime');
    const assTime = document.getElementById('assTime');


    selectBox.addEventListener('change', function() {
        // รับค่าที่เลือก
        const selectedOption = selectBox.options[selectBox.selectedIndex];
        assTime.value = selectedOption.value;
        console.log("assTime : " + assTime.value)
    });

    assTime.value = selectBox.value;
    dateVision.value = teachervisiondate.value;


    function showInputValue() {
        // รับค่าจาก input
        var teachersupervisiondate = document.getElementById("teachersupervisiondate").value;
        var dateVision = document.getElementById("dateVision")
        dateVision.value = teachersupervisiondate;

        // แสดงค่าที่รับมา
        console.log("dateVision : " + dateVision.value)
    }

</script>

<script>
    var status_update = '<%= request.getParameter("status_update") %>';

    if (status_update === "false") {
        alert("แก้ไขข้อมูลไม่สำเร็จ เนื่องจากมีการมอบหมายอาจารย์ไปยังบริษัทอื่นในวันและเวลาดังกล่าวแล้ว");
        console.log("status_update : " + status_update);
    }
</script>

<script>
    const dateInput = document.getElementById('teachersupervisiondate');

    const today = new Date();

    today.setDate(today.getDate() + 1);

    const tomorrow = today.toISOString().split('T')[0];

    dateInput.setAttribute('min', tomorrow);
</script>


</html>
