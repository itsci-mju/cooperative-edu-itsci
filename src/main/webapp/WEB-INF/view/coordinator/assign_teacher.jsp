<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>assign_teacher</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/teacher/assign_teacher.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/date/jquery.datetimepicker.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/date/jquery.js"></script>
    <link href="${pageContext.request.contextPath}/assets/date/bootstrap-datepicker-thai/css/datepicker.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/date/bootstrap-datepicker-thai/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/date/bootstrap-datepicker-thai/js/bootstrap-datepicker-thai.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/date/bootstrap-datepicker-thai/js/locales/bootstrap-datepicker.th.js"></script>
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>

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
        <p class="editpro_header2">กำหนดอาจารย์นิเทศ</p>
    </div>
</div>
<br><br>
<h3 style="font-family: 'Prompt', sans-serif; margin-left: 50px; color: #990D28">
    กำหนดอาจารย์นิเทศในบริษัท ${companies.company_name}</h3>
<hr style="height: 3px; width: 800px; background-color: #990D28; margin: -5px 0px 0px 50px; border: none; box-shadow: 0 4px 6px #990D28;">
<br><br>

<form action="${pageContext.request.contextPath}/teacher/${companies.company_id}/assign_teacher_by_company" method="POST"
      id="evaluationForm" onsubmit="return disableSubmitButton();">
    <table align="center" id="myTable1">
        <tr>
            <td colspan="5" style="padding-left: 40%;">ภาคการศึกษา
                <input type="text" name="formatTerm" value="${formatTerm}" disabled>
                <input type="hidden" name="format_term" value="${formatTerm}">
            </td>
        </tr>
        <tr>
        </tr>
        <tr>
            <td style=" padding-left: 30px;">วันที่นิเทศ</td>
            <td style=" padding-left: 30px;">
                <input type="date" name="teachersupervisiondate" id="teachersupervisiondate" lang="th" value="${thaiDateString}"></td>
            <td style=" padding-left: 30px;">เวลานิเทศ</td>
            <td style="padding-left: 30px;">
                <select name="teachersupervisiontime" id="teachersupervisiontime">
                    <option value="09.00-12.00 น.">09.00-12.00 น.</option>
                    <option value="13.00-16.00 น.">13.00-16.00 น.</option>
                </select>
            </td>
            <td>
                <input type="submit" value="ค้นหา" onclick="return validateForm()">
            </td>
        </tr>
    </table>
</form>

<form action="${pageContext.request.contextPath}/teacher/${companies.company_id}/assign_teacher_by_company_submit" method="post">
    <table id="myTable">
        <tr>
            <td>
                <input type="hidden" name="dateVision" value="${thaiDateString}">
                <input type="hidden" name="comId" value="${companies.company_id}">
                <input type="hidden" name="assTime" value="${assigntime}">
                <input type="hidden" name="formatTerm" value="${formatTerm}">
            </td>
        </tr>
        <tr>
            <td style="padding: 30px 0px 30px 150px; background-color: #bee5eb">เลือกอาจารย์</td>
        </tr>
        <tr>
            <td style="padding-left: 500px">
                <c:forEach var="list_teacher" items="${assign_teacher}">
                    <input type="radio" name="teacher" value="${list_teacher.teacher_id}"
                           style="margin-top: 30px;"/>${list_teacher.teacher_name} ${list_teacher.teacher_lastname}<br>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <input type="submit" class="btn btn-success" value="บันทึก" onclick="return radioForm()">
                <a href="${pageContext.request.contextPath}/company/list_company"><button type="button" class="btn btn-warning">ย้อนกลับ</button></a>
            </td>
        </tr>
    </table>
</form>



<br><br><br><br>
<script>
    var index = 0;
    var time = `${assigntime}`;
    console.log("time " + `${assigntime}`)
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
    function validateForm() {
        var dateInput = document.getElementById("teachersupervisiondate");

        if (dateInput.value === "") {
            alert("กรุณาเลือกวันที่");
            return false;
        }

        return true;
    }

    const dateInput = document.getElementById('teachersupervisiondate');

    const today = new Date();

    today.setDate(today.getDate() + 1);

    const tomorrow = today.toISOString().split('T')[0];

    dateInput.setAttribute('min', tomorrow);


</script>

<script>
    function radioForm() {
        var radioOptions = document.getElementsByName("teacher");
        var selectedOption = false;

        for (var i = 0; i < radioOptions.length; i++) {
            if (radioOptions[i].checked) {
                selectedOption = true;
                break;
            }
        }

        if (!selectedOption) {
            alert("กรุณาเลือกอาจารย์ อย่างน้อย 1 คน");
            return false;
        }

        return true;
    }
</script>

</body>

</html>
