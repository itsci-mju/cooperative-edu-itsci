<%@ page import="it_sci.model.Mentor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<style>
    /* ซ่อนฟอร์มทั้งหมด */
    .tabcontent {
        display: none;
    }
</style>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>

<form action="${pageContext.request.contextPath}/mentor/submit_evaluate_by_mentor/<%=mentor.getMentor_id()%>" method="POST" >
    <div class="navbar2"><br>
        <div style="margin-left: 160px">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
            <p class="editpro_header2">รายชื่อนักศึกษา/ประเมินการฝึกสหกิจศึกษา</p>
        </div>
    </div>
    <table class="evaluate" align="center"><br><br>
        <tr >
            <td><p>ภาคการศึกษา</p></td>
            <td><input type="text" value="${student.semester}" disabled></td>
        </tr>

        <tr >
            <td><p>รหัสนักศึกษา </p></td>
            <td><input type="text"  value="${student.student_id}" name="studentId" id="studentId" disabled></td>
            <td><p style="text-align: right;">&nbsp;&nbsp; ชื่อนักศึกษา &nbsp;&nbsp;</p></td>
            <td><input type="text"  value="${student.student_name} ${student.student_lastname}" disabled></td>
        </tr>

        <tr >
            <td><p>ตำแหน่งงานที่ฝึกปฎิบัติ</p></td>
            <td><input type="text"  value="${student.workposition}" disabled></td>
            <td><p style="text-align: right;">&nbsp;&nbsp; ระยะเวลาการประเมิน &nbsp;&nbsp;</p></td>
            <td><input type="text"  disabled></td>
        </tr>
    </table><br><br>

    <div id="form1" class="tabcontent">
<p>ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 60 คะแนน) </p>

<table class="table table-hover" >
    <tr class="table-primary">
        <td align="center">ข้อที่</td>
        <td style="padding-left: 100px;">เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td align="center">คะแนน</td>
    </tr>
    <tr>
        <td ></td>
        <td ></td>
        <td style="padding-left: 280px;">
            <span style="margin-right: 30px; font-size: 16px;">5</span>
            <span style="margin-right: 30px; font-size: 16px;">4</span>
            <span style="margin-right: 30px; font-size: 16px;">3</span>
            <span style="margin-right: 30px; font-size: 16px;">2</span>
            <span>1</span>
        </td>
    </tr>
    <tr >
        <td align="center">1</td>
        <td style="padding-left: 100px;">ความเข้าใจในงานที่ได้รับมอบหมายและสามารถปฏิบัติงานได้ตามที่กำหนดหรือคาดหวัง</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score1" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>
    </tr>
    <tr >
        <td align="center">2</td>
        <td style="padding-left: 100px;">ปริมาณงาน และคุณภาพของงานที่นักศึกษาสามารถปฏิบัติสำเร็จ  </td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score2" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">3</td>
        <td style="padding-left: 100px;">การมีความคิดสร้างสรรค์ในการพัฒนางานที่ได้รับมอบหมาย</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score3" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">4</td>
        <td style="padding-left: 100px;">ความเป็นผู้มีระเบียบวินัย ตรงต่อเวลา รับผิดชอบต่อหน้าที่ที่ได้รับมอบหมาย</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score4" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">5</td>
        <td style="padding-left: 100px;">ความสามารถในการใช้ทักษะทางเทคโนโลยีสารสนเทศในการทำงาน</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score5" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr>
        <td align="center">6</td>
        <td style="padding-left: 100px;">ความสามารถการทำงานร่วมกับผู้อื่นและการมีมนุษยสัมพันธ์ที่ดี</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score6" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">7</td>
        <td style="padding-left: 100px;">ทักษะการแก้ไขปัญหาด้วยตนเองเมื่อประสบปัญหาระหว่างทำงาน</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score7" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score7" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score7" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score7" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score7" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">8</td>
        <td style="padding-left: 100px;">ความสามารถในการสื่อสารกับผู้ที่เกี่ยวข้องทั้งภาษาไทยและภาษาอังกฤษ</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score8" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score8" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score8" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score8" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score8" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">9</td>
        <td style="padding-left: 100px;">มีการเรียนรู้ศึกษาค้นคว้าหาความรู้เพิ่มเติมด้วยตนเอง</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score9" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score9" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score9" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score9" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score9" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">10</td>
        <td style="padding-left: 100px;">การส่งมอบงานเป็นไปตามระยะเวลาที่พี่เลี้ยงกำหนด</td>
        <td style="padding-left: 275px;">
            <input type="radio" name="score10" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score10" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score10" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score10" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score10" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>
    </tr>
    <tr>
        <td align="center">11</td>
        <td style="padding-left: 100px;">ความพึงพอใจต่อการฝึกปฏิบัติสหกิจของนักศึกษาครั้งนี้โดยรวมท่านจะให้กี่คะแนน</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score11" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">10
            <input type="radio" name="score11" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">9
            <input type="radio" name="score11" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">8
            <input type="radio" name="score11" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">7
            <input type="radio" name="score11" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">6
            <input type="radio" name="score11" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">5
            <input type="radio" name="score11" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">4
            <input type="radio" name="score11" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">3
            <input type="radio" name="score11" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">2
            <input type="radio" name="score11" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">1
        </td>
    </tr>
</table><br><br>

        <div align="center">
            <button  type="button" onclick="openForm2()" id="next" class="btn btn-success" style="margin-bottom: 20px"; >ต่อไป</button>
        </div>
    </div>

    <div id="form2" class="tabcontent">

<p>ส่วนที่ 2 ความคิดเห็นเกี่ยวกับการฝึกปฏิบัติสหกิจศึกษาของนักศึกษา </p>

<table class="table table-hover">
    <tr class="table-primary" align="center">
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>ความคิดเห็น</td>
    </tr>
    <tr >
        <td align="center">1</td>
        <td style="padding-left: 100px;">ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้  มีจุดเด่นในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง</td>
        <td align="center"><input name="answerText1" style="width: 200px; height: 25px"/></td>
    </tr>
    <tr >
        <td align="center">2</td>
        <td style="padding-left: 100px;">ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้ มีจุดด้อยในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง</td>
        <td align="center"><input name="answerText2" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr >
        <td align="center">3</td>
        <td style="padding-left: 100px;">จากข้อก่อนหน้า นักศึกษาควรได้รับการพัฒนาปรับปรุงทักษะใดเพิ่มเติม เพื่อให้มีความพร้อมสำหรับการทำงานสายไอทีและเป็นไปตามที่บริษัทต้องการ</td>
        <td align="center"><input name="answerText3" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr >
        <td align="center">4</td>
        <td style="padding-left: 100px;">ในปีการศึกษาถัดไป บริษัทมีความต้องการรับนักศึกษาสาขาวิชาเทคโนโลยีสารสนเทศ มหาวิทยาลัยแม่โจ้ เข้าฝึกปฏิบัติสหกิจศึกษาอีกหรือไม่?</td>
        <td align="center"><input name="answerText4" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr >
        <td align="center">5</td>
        <td style="padding-left: 100px;">ความคิดเห็นอื่นๆ (ถ้ามี)</td>
        <td align="center"><input name="answerText5" style="width: 200px; height: 25px"/></td>
    </tr>
</table>
        <div align="center" style="display: inline-block; width: 100%; margin-top: 20px;">
            <div style="display: inline-block;"><button type="button" onclick="openForm1()" id="back" class="btn btn-warning" >ย้อนกลับ</button></div>
            <div style="display: inline-block;"><button type="submit" class="btn btn-success">บันทึก</button></div>
        </div>
    </div>
</form>
<%--<div class="list_course_detail" align="center">--%>
<%--    <div class="hr_line"></div>--%>
<%--    <button id="FClick" class="tablinks" onclick="openList(event, 'form1')">ย้อนกลับ</button>--%>
<%--    <button class="tablinks" onclick="openList(event, 'form2')">ต่อไป</button>--%>
<%--</div>--%>
<%--<div class="list_course_detail" align="center">--%>
<%--    <div class="hr_line"></div>--%>
<%--&lt;%&ndash;    <button id="backButton" class="tablinks" onclick="openList(event, 'form1')">ย้อนกลับ</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <button id="nextButton" class="tablinks" onclick="openList(event, 'form2')">ต่อไป</button>&ndash;%&gt;--%>
<%--    <button onclick="openForm2()" id="next" class="btn btn-success" style="margin-bottom: 30px">ต่อไป</button>--%>
<%--    <button onclick="openForm1()" id="back" class="btn btn-primary" style="margin-bottom: 30px">ย้อนกลับ</button>--%>
<%--</div>--%>

<script>
    function getSumAndSet () {
        var sumScore = 0;
        for (let i = 0; i < 11; i++) {
            let radio = document.getElementsByName("score"+(i+1));
            for (let j = 0; j < radio.length; j++) {
                if (radio[j].checked) {
                    //console.log(radio[j].value);
                    sumScore = sumScore + parseInt(radio[j].value);
                }
            }
        }
        console.log("SUM IS : " + sumScore);
        document.getElementById("score").value = sumScore;
    }


</script>

</body>

<script>
    <%--window.addEventListener('DOMContentLoaded', (event) => {--%>
    <%--    var backButton = document.getElementById('backButton');--%>
    <%--    var nextButton = document.getElementById('nextButton');--%>
    <%--    var evaluationForm = document.getElementById('evaluationForm');--%>

    <%--    backButton.style.display = "none"; // ซ่อนปุ่มย้อนกลับตอนเริ่มต้น--%>

    <%--    // เมื่อคลิกปุ่ม "ต่อไป"--%>
    <%--    nextButton.addEventListener('click', function () {--%>
    <%--        backButton.style.display = "inline-block"; // แสดงปุ่มย้อนกลับ--%>
    <%--        nextButton.style.display = "none"; // ซ่อนปุ่มต่อไป--%>
    <%--        evaluationForm.action = "${pageContext.request.contextPath}/mentor/submit_evaluate_by_mentor/<%=mentor.getMentor_id()%>";--%>
    <%--    });--%>

    <%--    // เมื่อคลิกปุ่ม "ย้อนกลับ"--%>
    <%--    backButton.addEventListener('click', function () {--%>
    <%--        backButton.style.display = "none"; // ซ่อนปุ่มย้อนกลับ--%>
    <%--        nextButton.style.display = "inline-block"; // แสดงปุ่มต่อไป--%>
    <%--        evaluationForm.action = "${pageContext.request.contextPath}/mentor/back_to_form1";--%>
    <%--    });--%>
    <%--});--%>
    <%--// window.addEventListener('DOMContentLoaded', (event) => {--%>
    <%--//     var button = document.getElementById('FClick');--%>
    <%--//     button.click()--%>
    <%--// });--%>
    <%--function openList(evt, list_name) {--%>
    <%--    var i, tabcontent, tablinks;--%>
    <%--    tabcontent = document.getElementsByClassName("tabcontent");--%>
    <%--    for (i = 0; i < tabcontent.length; i++) {--%>
    <%--        tabcontent[i].style.display = "none";--%>
    <%--    }--%>
    <%--    tablinks = document.getElementsByClassName("tablinks");--%>
    <%--    for (i = 0; i < tablinks.length; i++) {--%>
    <%--        tablinks[i].className = tablinks[i].className.replace(" active", "");--%>
    <%--        // tablinks[i].style.display = "none";--%>
    <%--    }--%>
    <%--    document.getElementById(list_name).style.display = "block";--%>
    <%--    evt.currentTarget.className += " active";--%>
    <%--}--%>
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
    document.getElementById("form1").style.display = "block";
    document.getElementById("back").style.display = "none"
    function openForm1() {
        // แสดงฟอร์มที่ 1
        document.getElementById("form1").style.display = "block";
        // ซ่อนฟอร์มที่ 2 (ถ้ามี)
        document.getElementById("form2").style.display = "none";

        document.getElementById("next").style.display = "block"

        document.getElementById("back").style.display = "none"
    }

    function openForm2() {
        // แสดงฟอร์มที่ 2
        document.getElementById("form2").style.display = "block";
        // ซ่อนฟอร์มที่ 1 (ถ้ามี)
        document.getElementById("form1").style.display = "none";

        document.getElementById("back").style.display = "block"

        document.getElementById("next").style.display = "none"
    }
</script>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
