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

    .table table-hover input[type="text"]{
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>

<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body ><br>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br>

<form action="${pageContext.request.contextPath}/teacher/submit_evaluate_by_teacher/${ass_id}" method="POST" >

    <div class="navbar2" style="margin-top: 40px;"><br>
        <div style="margin-left: 160px;">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
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
            <td><p style="text-align: right;">&nbsp;&nbsp; วันที่ประเมิน &nbsp;&nbsp;</p></td>
            <td><input type="text"  disabled></td>
        </tr>
    </table><br><br>

    <div id="form1" class="tabcontent">

<h5 style="font-family: 'Kanit', sans-serif; font-weight: bold; color: #990D28">ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 20 คะแนน) </h5>
<br>
<table class="table table-hover">
    <tr class="table-primary" id="font">
        <td  align="center">ข้อที่</td>
        <td style="padding-left: 100px;">เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td  align="center">คะแนน</td>
    </tr>
    <tr>
        <td ></td>
        <td ></td>
        <td style="padding-left: 130px;">
            <span style="margin-right: 30px; font-size: 16px;">10</span>
            <span style="margin-right: 30px; font-size: 16px;">9</span>
            <span style="margin-right: 30px; font-size: 16px;">8</span>
            <span style="margin-right: 30px; font-size: 16px;">7</span>
            <span style="margin-right: 30px; font-size: 16px;">6</span>
            <span style="margin-right: 30px; font-size: 16px;">5</span>
            <span style="margin-right: 30px; font-size: 16px;">4</span>
            <span style="margin-right: 30px; font-size: 16px;">3</span>
            <span style="margin-right: 30px; font-size: 16px;">2</span>
            <span>1</span>
        </td>
    </tr>
    <tr>
        <td align="center">1</td>
        <td style="padding-left: 100px;">คะแนนพฤติกรรมและความรับผิดชอบ</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score1" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score1" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>
    </tr>
    <tr >
        <td align="center">2</td>
        <td style="padding-left: 100px;">คะแนนด้านศักยภาพการทำงานและการพัฒนาตัวเอง</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score2" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score2" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">3</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจจากพี่เลี้ยงที่มีต่อนักศึกษา</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score3" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score3" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">4</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการดูแลของพี่เลี้ยง</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score4" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score4" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">5</td>
        <td style="padding-left: 100px;">นักศึกษามีทักษะการเรียนรู้เทคโนโลยีและการแก้ไขปัญหาในการทำงานเป็นที่พึงพอใจของบริษัท</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score5" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score5" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>

    </tr>
    <tr >
        <td align="center">6</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการนิเทศสหกิจศึกษาในภาพรวม</td>
        <td style="padding-left: 130px;">
            <input type="radio" name="score6" value="10" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="9" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="8" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="7" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="6" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="5" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="4" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="3" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="2" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
            <input type="radio" name="score6" value="1" onclick="getSumAndSet()" style="margin-right: 25px; width: 15px; height: 15px;">
        </td>
    </tr>
</table><br><br>
        <div align="center">
            <button  type="button" onclick="openForm2()" id="next" class="btn btn-success" style="margin-bottom: 20px"; >ต่อไป</button>
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
    <tr>
        <td align="center">1</td>
        <td style="padding-left: 10px;">นักศึกษาได้ปฏิบัติงานตรงตามตำแหน่งที่สาขาวิชาส่งไปหรือไม่?</td>
        <td>
            <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                <textarea name="answerText1" style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
            </div>
        </td>
    </tr>
    <tr>
        <td align="center">2</td>
        <td style="padding-left: 10px;">ข้อความบันทึก/หมายเหตุเพิ่มเติม (ถ้ามี)</td>
        <td>
            <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                <textarea name="answerText2" style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
            </div>
        </td>
    </tr>
</table>
    <div align="center" style="display: inline-block; width: 100%; margin-top: 20px;">
        <div style="display: inline-block;"><button type="button" onclick="openForm1()" id="back" class="btn btn-warning" >ย้อนกลับ</button></div>
        <div style="display: inline-block;"><button type="submit" class="btn btn-success">บันทึก</button></div>
    </div>
    </div>
</form>

<script>
    function getSumAndSet () {
        var sumScore = 0;
        for (let i = 0; i < 6; i++) {
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
</script><br><br><br><br>

</html>
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
