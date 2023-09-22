<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>
<style>
    /* ซ่อนฟอร์มทั้งหมด */
    .tabcontent {
        display: none;
    }
</style>

<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>

<form action="${pageContext.request.contextPath}/teacher/submit_evaluate_by_teacher/${ass_id}" method="POST" >

    <div class="navbar2" style="margin-top: 40px;"><br>
        <div style="margin-left: 160px;">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
            <p class="editpro_header2">รายชื่อนักศึกษา/ประเมินการฝึกสหกิจศึกษา</p>
        </div>
    </div>

    <table class="evaluate" align="center"><br><br>
        <tr align="center">
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

<p>ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 20 คะแนน) </p>

<table class="table table-hover" align="center">
    <tr class="table-primary" id="font" align="center">
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>คะแนน</td>
    </tr>
    <tr align="center">
        <td>1</td>
        <td>คะแนนพฤติกรรมและความรับผิดชอบ</td>
        <td>
            <input type="radio" name="score1" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score1" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score1" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score1" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score1" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score1" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score1" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score1" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score1" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score1" value="1" onclick="getSumAndSet()">1
        </td>
    </tr>
    <tr align="center">
        <td>2</td>
        <td>คะแนนด้านศักยภาพการทำงานและการพัฒนาตัวเอง</td>
        <td>
            <input type="radio" name="score2" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score2" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score2" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score2" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score2" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score2" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score2" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score2" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score2" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score2" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr align="center">
        <td>3</td>
        <td>คะแนนความพอพึงใจจากพี่เลี้ยงที่มีต่อนักศึกษา</td>
        <td>
            <input type="radio" name="score3" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score3" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score3" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score3" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score3" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score3" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score3" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score3" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score3" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score3" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr align="center">
        <td>4</td>
        <td>คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการดูแลของพี่เลี้ยง</td>
        <td>
            <input type="radio" name="score4" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score4" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score4" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score4" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score4" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score4" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score4" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score4" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score4" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score4" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr align="center">
        <td>5</td>
        <td>นักศึกษามีทักษะการเรียนรู้เทคโนโลยีและการแก้ไขปัญหาในการทำงานเป็นที่พึงพอใจของบริษัท</td>
        <td>
            <input type="radio" name="score5" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score5" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score5" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score5" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score5" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score5" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score5" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score5" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score5" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score5" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr align="center">
        <td>6</td>
        <td>คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการนิเทศสหกิจศึกษาในภาพรวม</td>
        <td>
            <input type="radio" name="score6" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score6" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score6" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score6" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score6" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score6" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score6" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score6" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score6" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score6" value="1" onclick="getSumAndSet()">1
        </td>
    </tr>
</table><br><br>
        <div align="center">
            <button  type="button" onclick="openForm2()" id="next" class="btn btn-success" style="margin-bottom: 30px"; >ต่อไป</button>
        </div>

    </div>

    <div id="form2" class="tabcontent">

<p>ส่วนที่ 2 ความคิดเห็นเกี่ยวกับการฝึกปฏิบัติสหกิจศึกษาของนักศึกษา </p>

<table class="table table-hover" align="center">
    <tr class="table-primary" id="font" align="center">
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>ความคิดเห็น</td>
    </tr>
    <tr align="center">
        <td>1</td>
        <td>นักศึกษาได้ปฏิบัติงานตรงตามตำแหน่งที่สาขาวิชาส่งไปหรือไม่?</td>
        <td><input name="answerText1" /></td>
    </tr>
    <tr align="center">
        <td>2</td>
        <td>ข้อความบันทึก/หมายเหตุเพิ่มเติม (ถ้ามี)</td>
        <td><input name="answerText2" /></td>
    </tr>
</table>
    <div align="center" style="display: inline-block; width: 100%">
        <div style="display: inline-block;"><button type="submit" class="btn btn-success">บันทึก</button></div>
        <div style="display: inline-block;"><button type="button" onclick="openForm1()" id="back" class="btn btn-primary" style="margin-bottom: 30px">ย้อนกลับ</button></div>
    </div>
    </div>
</form>

<%--<div align="center">--%>
<%--    <div class="hr_line"></div>--%>
<%--    &lt;%&ndash;    <button id="backButton" class="tablinks" onclick="openList(event, 'form1')">ย้อนกลับ</button>&ndash;%&gt;--%>
<%--    &lt;%&ndash;    <button id="nextButton" class="tablinks" onclick="openList(event, 'form2')">ต่อไป</button>&ndash;%&gt;--%>
<%--    --%>
<%--</div>--%>
<script>
    function getSumAndSet () {
        var sumScore = 0;
        for (let i = 0; i < 5; i++) {
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
