<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
</head>

<body><br><br>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>

<form action="${pageContext.request.contextPath}/teacher/submit_evaluate_by_teacher/${ass_id}" method="POST" >

    <div class="navbar2"><br><br><br>
        <div style="margin-left: 160px">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
            <p class="editpro_header2">รายชื่อนักศึกษา/ประเมินการฝึกสหกิจศึกษา</p>
        </div>
    </div>

    <table class="evaluate" align="center"><br><br>
        <tr>
            <td><p>ภาคการศึกษา</p></td>
            <td><input type="text" value="${student.semester}" disabled></td>
        </tr>

        <tr>
            <td><p>รหัสนักศึกษา </p></td>
            <td><input type="text"  value="${student.student_id}" name="studentId" id="studentId" readonly></td>
            <td><p style="text-align: right;">&nbsp;&nbsp; ชื่อนักศึกษา &nbsp;&nbsp;</p></td>
            <td><input type="text"  value="${student.student_name} ${student.student_lastname}" disabled></td>
        </tr>

        <tr>
            <td><p>ตำแหน่งงานที่ฝึกปฎิบัติ</p></td>
            <td><input type="text"  value="${student.workstation}" disabled></td>
            <td><p style="text-align: right;">&nbsp;&nbsp; ระยะเวลาการประเมิน &nbsp;&nbsp;</p></td>
            <td><input type="text"  disabled></td>
        </tr>
    </table><br><br>

<p>ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 20 คะแนน) </p>

<table align="center">
    <tr>
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>คะแนน</td>
    </tr>
    <tr>
        <td></td>
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
    <tr>
        <td></td>
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
    <tr>
        <td></td>
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
    <tr>
        <td></td>
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
    <tr>
        <td></td>
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
    <tr>
        <td></td>
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
<p>ส่วนที่ 2 ความคิดเห็นเกี่ยวกับการฝึกปฏิบัติสหกิจศึกษาของนักศึกษา </p>

<table align="center">
    <tr>
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>ความคิดเห็น</td>
    </tr>
    <tr>
        <td></td>
        <td>นักศึกษาได้ปฏิบัติงานตรงตามตำแหน่งที่สาขาวิชาส่งไปหรือไม่?</td>
        <td><input name="answerText1" /></td>
    </tr>
    <tr>
        <td></td>
        <td>ข้อความบันทึก/หมายเหตุเพิ่มเติม (ถ้ามี)</td>
        <td><input name="answerText2" /></td>
    </tr>
</table>
    <div style="margin: 35px 0px 100px 640px;">
        <button type="submit" class="btn btn-success">บันทึก</button>
        <button type="button" class="btn btn-warning">ยกเลิก</button>
    </div>
</form>

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
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
