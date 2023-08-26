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
    <link href="${pageContext.request.contextPath}/assets/css/mentor/liststudent.css" rel="stylesheet">
</head>

<body>
<jsp:include page="/WEB-INF/view/layout/navbar.jsp"/>

<form action="${pageContext.request.contextPath}/mentor/submit_evaluate_by_mentor/<%=mentor.getMentor_id()%>" method="POST" >
    <div class="navbar2"><br><br><br>
        <div style="margin-left: 160px">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
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

<p>ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 60 คะแนน) </p>

<table style="margin-left: 165px;">
    <tr>
        <td>ข้อที่</td>
        <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td>คะแนน</td>
    </tr>
    <tr>
        <td>1</td>
        <td>ความเข้าใจในงานที่ได้รับมอบหมายและสามารถปฏิบัติงานได้ตามที่กำหนดหรือคาดหวัง</td>
        <td>
            <input type="radio" name="score1" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score1" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score1" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score1" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score1" value="1" onclick="getSumAndSet()">1
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>ปริมาณงาน และคุณภาพของงานที่นักศึกษาสามารถปฏิบัติสำเร็จ  </td>
        <td><input type="radio" name="score2" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score2" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score2" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score2" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score2" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>3</td>
        <td>การมีความคิดสร้างสรรค์ในการพัฒนางานที่ได้รับมอบหมาย</td>
        <td>
            <input type="radio" name="score3" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score3" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score3" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score3" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score3" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>4</td>
        <td>ความเป็นผู้มีระเบียบวินัย ตรงต่อเวลา รับผิดชอบต่อหน้าที่ที่ได้รับมอบหมาย</td>
        <td>
            <input type="radio" name="score4" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score4" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score4" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score4" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score4" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>5</td>
        <td>ความสามารถในการใช้ทักษะทางเทคโนโลยีสารสนเทศในการทำงาน</td>
        <td>
            <input type="radio" name="score5" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score5" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score5" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score5" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score5" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>6</td>
        <td>ความสามารถการทำงานร่วมกับผู้อื่นและการมีมนุษยสัมพันธ์ที่ดี</td>
        <td>
            <input type="radio" name="score6" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score6" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score6" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score6" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score6" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>7</td>
        <td>ทักษะการแก้ไขปัญหาด้วยตนเองเมื่อประสบปัญหาระหว่างทำงาน</td>
        <td>
            <input type="radio" name="score7" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score7" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score7" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score7" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score7" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>8</td>
        <td>ความสามารถในการสื่อสารกับผู้ที่เกี่ยวข้องทั้งภาษาไทยและภาษาอังกฤษ</td>
        <td>
            <input type="radio" name="score8" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score8" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score8" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score8" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score8" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>9</td>
        <td>มีการเรียนรู้ศึกษาค้นคว้าหาความรู้เพิ่มเติมด้วยตนเอง</td>
        <td>
            <input type="radio" name="score9" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score9" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score9" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score9" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score9" value="1" onclick="getSumAndSet()">1
        </td>

    </tr>
    <tr>
        <td>10</td>
        <td>การส่งมอบงานเป็นไปตามระยะเวลาที่พี่เลี้ยงกำหนด</td>
        <td>
            <input type="radio" name="score10" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score10" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score10" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score10" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score10" value="1" onclick="getSumAndSet()">1
        </td>
    </tr>
    <tr>
        <td>11</td>
        <td>ความพึงพอใจต่อการฝึกปฏิบัติสหกิจของนักศึกษาครั้งนี้โดยรวมท่านจะให้กี่คะแนน</td>
        <td>
            <input type="radio" name="score11" value="10" onclick="getSumAndSet()">10
            <input type="radio" name="score11" value="9" onclick="getSumAndSet()">9
            <input type="radio" name="score11" value="8" onclick="getSumAndSet()">8
            <input type="radio" name="score11" value="7" onclick="getSumAndSet()">7
            <input type="radio" name="score11" value="6" onclick="getSumAndSet()">6
            <input type="radio" name="score11" value="5" onclick="getSumAndSet()">5
            <input type="radio" name="score11" value="4" onclick="getSumAndSet()">4
            <input type="radio" name="score11" value="3" onclick="getSumAndSet()">3
            <input type="radio" name="score11" value="2" onclick="getSumAndSet()">2
            <input type="radio" name="score11" value="1" onclick="getSumAndSet()">1
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
        <td>1</td>
        <td>ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้  มีจุดเด่นในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง</td>
        <td><input name="answerText1" style="width: 200px; height: 25px"/></td>
    </tr>
    <tr>
        <td>2</td>
        <td>ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้ มีจุดด้อยในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง</td>
        <td><input name="answerText2" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr>
        <td>3</td>
        <td>จากข้อก่อนหน้า นักศึกษาควรได้รับการพัฒนาปรับปรุงทักษะใดเพิ่มเติม เพื่อให้มีความพร้อมสำหรับการทำงานสายไอทีและเป็นไปตามที่บริษัทต้องการ</td>
        <td><input name="answerText3" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr>
        <td>4</td>
        <td>ในปีการศึกษาถัดไป บริษัทมีความต้องการรับนักศึกษาสาขาวิชาเทคโนโลยีสารสนเทศ มหาวิทยาลัยแม่โจ้ เข้าฝึกปฏิบัติสหกิจศึกษาอีกหรือไม่?</td>
        <td><input name="answerText4" style="width: 200px; height: 25px"/></td>

    </tr>
    <tr>
        <td>5</td>
        <td>ความคิดเห็นอื่นๆ (ถ้ามี)</td>
        <td><input name="answerText5" style="width: 200px; height: 25px"/></td>
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
<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
