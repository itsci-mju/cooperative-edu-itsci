<%@ page import="it_sci.model.Mentor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    Mentor mentor = (Mentor) session.getAttribute("mentor");
%>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>
<%--    <script>--%>
<%--        function openForm2() {--%>
<%--            // ตรวจสอบว่าผู้ใช้เลือก radio ครบหรือไม่ ในแบบฟอร์ม 1--%>
<%--            const radioInputs = document.querySelectorAll('#form1 input[type="radio"]');--%>
<%--            let allChecked = true;--%>
<%--            radioInputs.forEach((input) => {--%>
<%--                if (!input.checked) {--%>
<%--                    allChecked = false;--%>
<%--                }--%>
<%--            });--%>

<%--            if (!allChecked) {--%>
<%--                // แสดง alert ถ้ายังไม่ได้เลือก radio ครบ--%>
<%--                alert("กรุณาเลือกทุกตัวเลือกในแบบฟอร์ม 1 ก่อน");--%>
<%--                return;--%>
<%--            }--%>
<%--        }--%>
<%--    </script>--%>
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
</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br><br><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/>
<br>

<form action="${pageContext.request.contextPath}/mentor/submit_evaluate_by_mentor/${mentor_id}" method="POST">
    <div class="navbar2"><br>
        <div style="margin-left: 160px; margin-top: 0px;">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
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
        <h5 style="margin-left: 76px; font-family: 'Prompt', sans-serif; color: #990D28">ส่วนที่ 1 ให้คะแนนความประพฤติกรรมการปฏิบัติงานสหกิจศึกษาของนักศึกษาในแต่ละด้านและความพึงพอใจโดยรวม (คะแนนเต็ม
            60 คะแนน) </h5>
        <table align="center" class="table table-hover" style="width: 90%">
            <tr class="table-primary">
                <td align="center">ข้อที่</td>
                <td style="padding-left: 100px;">เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
                <td align="center">คะแนน</td>
            </tr>
            <tr>
                <td align="center">1</td>
                <td style="padding-left: 100px;">
                    ความเข้าใจในงานที่ได้รับมอบหมายและสามารถปฏิบัติงานได้ตามที่กำหนดหรือคาดหวัง
                </td>
                <td align="center">
                    <input type="text" name="score1" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>
            </tr>
            <tr>
                <td align="center">2</td>
                <td style="padding-left: 100px;">ปริมาณงาน และคุณภาพของงานที่นักศึกษาสามารถปฏิบัติสำเร็จ</td>
                <td align="center">
                    <input type="text" name="score2" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">3</td>
                <td style="padding-left: 100px;">การมีความคิดสร้างสรรค์ในการพัฒนางานที่ได้รับมอบหมาย</td>
                <td align="center">
                    <input type="text" name="score3" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">4</td>
                <td style="padding-left: 100px;">ความเป็นผู้มีระเบียบวินัย ตรงต่อเวลา
                    รับผิดชอบต่อหน้าที่ที่ได้รับมอบหมาย
                </td>
                <td align="center">
                    <input type="text" name="score4" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">5</td>
                <td style="padding-left: 100px;">ความสามารถในการใช้ทักษะทางเทคโนโลยีสารสนเทศในการทำงาน</td>
                <td align="center">
                    <input type="text" name="score5" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">6</td>
                <td style="padding-left: 100px;">ความสามารถการทำงานร่วมกับผู้อื่นและการมีมนุษยสัมพันธ์ที่ดี</td>
                <td align="center">
                    <input type="text" name="score6" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">7</td>
                <td style="padding-left: 100px;">ทักษะการแก้ไขปัญหาด้วยตนเองเมื่อประสบปัญหาระหว่างทำงาน</td>
                <td align="center">
                    <input type="text" name="score7" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">8</td>
                <td style="padding-left: 100px;">ความสามารถในการสื่อสารกับผู้ที่เกี่ยวข้องทั้งภาษาไทยและภาษาอังกฤษ</td>
                <td align="center">
                    <input type="text" name="score8" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">9</td>
                <td style="padding-left: 100px;">มีการเรียนรู้ศึกษาค้นคว้าหาความรู้เพิ่มเติมด้วยตนเอง</td>
                <td align="center">
                    <input type="text" name="score9" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>

            </tr>
            <tr>
                <td align="center">10</td>
                <td style="padding-left: 100px;">การส่งมอบงานเป็นไปตามระยะเวลาที่พี่เลี้ยงกำหนด</td>
                <td align="center">
                    <input type="text" name="score10" style="width: 15%;text-align: center;"> / 5 คะแนน
                </td>
            </tr>
            <tr>
                <td align="center">11</td>
                <td style="padding-left: 100px;"> ความพึงพอใจต่อการฝึกปฏิบัติสหกิจของนักศึกษาครั้งนี้โดยรวมท่านจะให้กี่คะแนน</td>
                <td align="center">
                    <input type="text" name="score11" style="width: 15%;text-align: center; margin-left: 8px;"> / 10 คะแนน
                </td>
            </tr>
        </table>
        <br><br>

        <div align="center">
            <button  type="button" onclick="return validateForm();" id="next" class="btn btn-success" style="margin-bottom: 20px"; >ต่อไป</button>
        </div>
    </div>

    <div id="form2" class="tabcontent">

        <h5 style="margin-left: 76px; font-family: 'Prompt', sans-serif; color: #990D28">ส่วนที่ 2 ความคิดเห็นเกี่ยวกับการฝึกปฏิบัติสหกิจศึกษาของนักศึกษา </h5>

        <table align="center" class="table table-hover" style="width: 90%">
            <tr class="table-primary" align="center">
                <td>ข้อที่</td>
                <td>เกณฑ์การประเมินการฝึกสหกิจศึกษา</td>
                <td>ความคิดเห็น</td>
            </tr>
            <tr>
                <td align="center">1</td>
                <td style="padding-left: 10px;">ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้
                    มีจุดเด่นในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง?
                </td>
                <td>
                    <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                        <textarea name="answerText1"
                                  style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">2</td>
                <td style="padding-left: 10px;">ท่านคิดว่านักศึกษาที่เข้ารับการฝึกปฏิบัติสหกิจศึกษาครั้งนี้
                    มีจุดด้อยในการปฏิบัติงานสหกิจศึกษาอะไรบ้าง
                </td>
                <td>
                    <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                        <textarea name="answerText2"
                                  style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">3</td>
                <td style="padding-left: 10px;">จากข้อก่อนหน้า นักศึกษาควรได้รับการพัฒนาปรับปรุงทักษะใดเพิ่มเติม
                    เพื่อให้มีความพร้อมสำหรับการทำงานสายไอทีและเป็นไปตามที่บริษัทต้องการ
                </td>
                <td>
                    <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                        <textarea name="answerText3"
                                  style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">4</td>
                <td style="padding-left: 10px;">ในปีการศึกษาถัดไป
                    บริษัทมีความต้องการรับนักศึกษาสาขาวิชาเทคโนโลยีสารสนเทศ มหาวิทยาลัยแม่โจ้
                    เข้าฝึกปฏิบัติสหกิจศึกษาอีกหรือไม่?
                </td>
                <td>
                    <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                        <textarea name="answerText4"
                                  style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="center">5</td>
                <td style="padding-left: 10px;">ความคิดเห็นอื่นๆ (ถ้ามี)</td>
                <td>
                    <div style="width: 100%; max-width: 400px; margin: 0 auto;">
                        <textarea name="answerText5"
                                  style="padding: 5px; border: 1px solid #ccc; border-radius: 5px; width: 100%; height: 80px;"></textarea>
                    </div>
                </td>
            </tr>
        </table>
        <div align="center" style="display: inline-block; width: 100%; margin-top: 20px;">
            <div style="display: inline-block;">
                <button type="button" onclick="openForm1()" id="back" class="btn btn-warning">ย้อนกลับ</button>
            </div>
            <div style="display: inline-block;">
                <button type="submit" class="btn btn-success" id="btnSave">บันทึก</button>
            </div>
        </div>
    </div>
</form>
</body>
<script>
    function getSumAndSet() {
        var sumScore = 0;
        for (let i = 0; i < 11; i++) {
            let radio = document.getElementsByName("score" + (i + 1));
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



    function openForm2() {
        // แสดงฟอร์มที่ 2
        document.getElementById("form2").style.display = "block";
        // ซ่อนฟอร์มที่ 1 (ถ้ามี)
        document.getElementById("form1").style.display = "none";

        document.getElementById("back").style.display = "block"

        document.getElementById("next").style.display = "none"
    }


    function validateForm() {
            openForm2();
    }
    function openForm1() {
        // แสดงฟอร์มที่ 1
        document.getElementById("form1").style.display = "block";
        // ซ่อนฟอร์มที่ 2 (ถ้ามี)
        document.getElementById("form2").style.display = "none";

        document.getElementById("next").style.display = "block"

        document.getElementById("back").style.display = "none"
    }

    function validateForm() {
        var score1 = document.getElementsByName("score1")[0].value;
        if (score1.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score1Value = parseInt(score1);
            if (isNaN(score1Value) || score1Value < 1 || score1Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
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
            if (isNaN(score2Value) || score2Value < 1 || score2Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
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
            if (isNaN(score3Value) || score3Value < 1 || score3Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
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
            if (isNaN(score4Value) || score4Value < 1 || score4Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
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
            if (isNaN(score5Value) || score5Value < 1 || score5Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
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
            if (isNaN(score6Value) || score6Value < 1 || score6Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
                document.getElementsByName("score6")[0].value = "";
                return false;
            }
        }
        var score7 = document.getElementsByName("score7")[0].value;
        if (score7.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score7Value = parseInt(score7);
            if (isNaN(score7Value) || score7Value < 1 || score7Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
                document.getElementsByName("score7")[0].value = "";
                return false;
            }
        }
        var score8 = document.getElementsByName("score8")[0].value;
        if (score8.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score8Value = parseInt(score8);
            if (isNaN(score8Value) || score8Value < 1 || score8Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
                document.getElementsByName("score8")[0].value = "";
                return false;
            }
        }
        var score9 = document.getElementsByName("score9")[0].value;
        if (score9.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score9Value = parseInt(score9);
            if (isNaN(score9Value) || score9Value < 1 || score9Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
                document.getElementsByName("score9")[0].value = "";
                return false;
            }
        }
        var score10 = document.getElementsByName("score10")[0].value;
        if (score10.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score10Value = parseInt(score10);
            if (isNaN(score10Value) || score10Value < 1 || score10Value > 5) {
                alert("คะแนนต้องอยู่ในช่วง 1-5");
                document.getElementsByName("score10")[0].value = "";
                return false;
            }
        }
        var score11 = document.getElementsByName("score11")[0].value;
        if (score11.trim() === "") {
            alert("กรุณากรอกคะแนน");
            return false;
        } else {
            var score11Value = parseInt(score11);
            if (isNaN(score11Value) || score11Value < 1 || score11Value > 10) {
                alert("คะแนนต้องอยู่ในช่วง 1-10");
                document.getElementsByName("score11")[0].value = "";
                return false;
            }
        }
        openForm2();
    }

    document.getElementById("btnSave").addEventListener('click', function() {
        // Get the text areas
        const answerText1 = document.querySelector('textarea[name="answerText1"]');
        const answerText2 = document.querySelector('textarea[name="answerText2"]');
        const answerText3 = document.querySelector('textarea[name="answerText3"]');
        const answerText4 = document.querySelector('textarea[name="answerText4"]');
        const answerText5 = document.querySelector('textarea[name="answerText5"]');

        // Check if the text areas are empty
        if (answerText1.value.trim() === '' || answerText2.value.trim() === '' || answerText3.value.trim() === '' || answerText4.value.trim() === '' || answerText5.value.trim() === '') {
            alert('กรุณากรอกข้อมูลให้ครบถ้วน');
            event.preventDefault(); // ป้องกันการดำเนินการต่อไปของเหตุการณ์ click
        }
    });



</script>

<script>
    var stt = '<%= request.getParameter("stt") %>';
    console.log(stt);
    if (stt === 'true') {
        alert('บันทึกข้อมูลสำเร็จ');
    }
</script>

<br><br><br><br>
</html>
