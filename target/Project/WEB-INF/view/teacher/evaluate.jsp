<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
</head>
<style>
    /* ซ่อนฟอร์มทั้งหมด */
    .tabcontent {
        display: none;
    }

    table.evaluate tr td{
        vertical-align: middle;
        width: 180px;
        height: 50px;
        padding-left: 25px;
    }
</style>

<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body ><br>
<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br><br>

<form id="evaluationForm" action="${pageContext.request.contextPath}/teacher/submit_evaluate_by_teacher/${ass_id}" method="POST" onsubmit="return validateForm();">

    <div class="navbar2" style="margin-top: 40px;"><br>
        <div style="margin-left: 160px;">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (อาจารย์นิเทศ)</p>
            <p class="editpro_header2">ประเมินการฝึกสหกิจศึกษา</p>
        </div>
    </div>

    <table class="evaluate" align="center"><br><br>
        <tr>
            <td>ภาคการศึกษา</td>
            <td><input type="text" value="${student.semester}" disabled></td>
        </tr>

        <tr>
            <td>รหัสนักศึกษา</td>
            <td>
                <input type="text" value="${student.student_id}" name="studentId" id="studentId" disabled>
                <input type="hidden" value="${student.student_id}" name="stdId" id="stdId">
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ชื่อนักศึกษา</td>
            <td><input type="text" value="${student.student_name} ${student.student_lastname}" disabled></td>
        </tr>

        <tr>
            <td>ตำแหน่งงานที่ฝึกปฎิบัติ</td>
            <td><input type="text" value="${student.workposition}" disabled></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;ระยะเวลาฝึกสหกิจ</td>
            <td>
                <fmt:formatDate pattern="dd/MM/yyyy" var="startDate" value="${student.startdate}"/>
                <fmt:formatDate pattern="dd/MM/yyyy" var="endDate" value="${student.enddate}"/>
                <input type="text" value="${startDate}-${endDate}" disabled>
            </td>
        </tr>

    </table>
    <br><br><br>

    <div id="form1" class="tabcontent">

<h5 style="margin-left: 76px; font-family: 'Prompt', sans-serif; color: #990D28">ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม 20 คะแนน) </h5>
<br>
<table align="center" class="table table-hover" style="font-family: 'Prompt', sans-serif; width: 90% ">
    <tr class="table-primary" >
        <td  align="center">ข้อที่</td>
        <td style="padding-left: 100px;">เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
        <td  align="center">คะแนน</td>
    </tr>
    <tr>
        <td align="center">1</td>
        <td style="padding-left: 100px;">คะแนนพฤติกรรมและความรับผิดชอบ</td>
        <td align="center">
            <input type="text" name="score1" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>
    </tr>
    <tr >
        <td align="center">2</td>
        <td style="padding-left: 100px;">คะแนนด้านศักยภาพการทำงานและการพัฒนาตัวเอง</td>
        <td align="center">
            <input type="text" name="score2" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>

    </tr>
    <tr >
        <td align="center">3</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจจากพี่เลี้ยงที่มีต่อนักศึกษา</td>
        <td align="center">
            <input type="text" name="score3" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>

    </tr>
    <tr >
        <td align="center">4</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการดูแลของพี่เลี้ยง</td>
        <td align="center">
            <input type="text" name="score4" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>

    </tr>
    <tr >
        <td align="center">5</td>
        <td style="padding-left: 100px;">นักศึกษามีทักษะการเรียนรู้เทคโนโลยีและการแก้ไขปัญหาในการทำงานเป็นที่พึงพอใจของบริษัท</td>
        <td align="center">
            <input type="text" name="score5" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>

    </tr>
    <tr >
        <td align="center">6</td>
        <td style="padding-left: 100px;">คะแนนความพอพึงใจของอาจารย์นิเทศสหกิจที่มีต่อการนิเทศสหกิจศึกษาในภาพรวม</td>
        <td align="center">
            <input type="text" name="score6" style="width: 15%;text-align: center;"> / 10 คะแนน
        </td>
    </tr>
</table><br><br>
        <div align="center">
            <button  type="button" onclick="return validateForm();" id="next" class="btn btn-success" style="margin-bottom: 20px"; >ต่อไป</button>
        </div>
    </div>

    <div id="form2" class="tabcontent">

<h5 style="margin-left: 76px; font-family: 'Prompt', sans-serif; color: #990D28">ส่วนที่ 2 ความคิดเห็นเกี่ยวกับการฝึกปฏิบัติสหกิจศึกษาของนักศึกษา </h5>
<table align="center" class="table table-hover" style="width: 90%">
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
        <div style="display: inline-block;"><button type="submit" class="btn btn-success" id="btnSave">บันทึก</button></div>
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


    function validateForm() {
        var score1 = document.getElementsByName("score1")[0].value;
        if (score1.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score1Value = parseInt(score1);
            if (isNaN(score1Value) || score1Value < 1 || score1Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score1")[0].value = "";
                return false;
            }
        }
        var score2 = document.getElementsByName("score2")[0].value;
        if (score2.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score2Value = parseInt(score2);
            if (isNaN(score2Value) || score2Value < 1 || score2Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score2")[0].value = "";
                return false;
            }
        }
        var score3 = document.getElementsByName("score3")[0].value;
        if (score3.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score3Value = parseInt(score3);
            if (isNaN(score3Value) || score3Value < 1 || score3Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score3")[0].value = "";
                return false;
            }
        }
        var score4 = document.getElementsByName("score4")[0].value;
        if (score4.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score4Value = parseInt(score4);
            if (isNaN(score4Value) || score4Value < 1 || score4Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score4")[0].value = "";
                return false;
            }
        }
        var score5 = document.getElementsByName("score5")[0].value;
        if (score5.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score5Value = parseInt(score5);
            if (isNaN(score5Value) || score5Value < 1 || score5Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score5")[0].value = "";
                return false;
            }
        }
        var score6 = document.getElementsByName("score6")[0].value;
        if (score6.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score6Value = parseInt(score6);
            if (isNaN(score6Value) || score6Value < 1 || score6Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score6")[0].value = "";
                return false;
            }
        }
            openForm2();
    }

    document.getElementById("btnSave").addEventListener('click', function() {
        // Get the text areas
        const answerText1 = document.querySelector('textarea[name="answerText1"]');
        const answerText2 = document.querySelector('textarea[name="answerText2"]');

        // Check if the text areas are empty
        if (answerText1.value.trim() === '' || answerText2.value.trim() === '') {
            alert('กรุณากรอกข้อมูลให้ครบถ้วน');
            event.preventDefault(); // ป้องกันการดำเนินการต่อไปของเหตุการณ์ click
        }
    });


</script><br><br><br><br>

</html>
