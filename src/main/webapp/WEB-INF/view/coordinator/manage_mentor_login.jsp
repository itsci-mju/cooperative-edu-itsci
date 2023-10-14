<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>

</head>
<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>

<style>
    #boder {
        background-color: #f2f2f2; /* สีเทาอ่อน */
        border-collapse: collapse; /* รวมเส้นกรอบของเซลล์ */
        width: 40%;
        height: 300px;
        margin: 0 auto; /* จัดตารางตรงกลาง */
        padding: 20px; /* เพิ่มระยะห่างรอบตาราง 20px */
        border-radius: 50px;
        overflow: hidden;
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    }
</style>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br>
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
        <p class="editpro_header1">ระบบจัดการเข้าสู่ระบบพี่เลี้ยง (อาจารย์ผู้ประสานงาน)</p>
        <p class="editpro_header2">รายชื่อพนักงานพี่เลี้ยง</p>
    </div>
</div><br><br>

<form:form method="POST" action="${pageContext.request.contextPath}/teacher/manage_mentor_login/${mentors.mentor_id}" onsubmit="disableSubmitButton()">
    <div id="boder" align="center">
        <div class="row">
            <div class="column">
                <label for="email" style="padding: 0px 50px 30px 0px;">อีเมล</label>
                <input type="email" id="email" name="email" value="${mentors.mentor_email}" disabled>
            </div>
            <div class="column">
                <label for="password" style="padding: 0px 30px 30px 0px;">รหัสผ่าน</label>
                <input type="password" id="password" name="password" ><br>
                <input type="password" id="confirm" name="confirm" onkeyup="checkPasswordMatch()" style="margin-left: 91px;"><br>
                <label id="passwordMatch" style="margin: 20px 20px 10px 90px;">กรุณากรอกรหัสผ่านให้ตรงกัน</label>
            </div>
        </div><br>
        <div class="button-group" style="margin-left: 100px;">
            <input type="submit" class="btn btn-success" value="บันทึก" id="submitBtn">
            <button type="button" class="btn btn-warning">ยกเลิก</button>
        </div>
    </div>
</form:form>
</body>

<script>
    const newPasswordInput = document.getElementById("password");
    const confirmPasswordInput = document.getElementById("confirm");
    const passwordMatchMessage = document.getElementById("passwordMatch");

    function checkPasswordMatch() {
        const newPassword = newPasswordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        if (newPassword === confirmPassword) {
            passwordMatchMessage.textContent = "Passwords match.";
            passwordMatchMessage.style.color = "green";
        } else {
            passwordMatchMessage.textContent = "Passwords do not match.";
            passwordMatchMessage.style.color = "red";

        }
    }
</script>
<script>
    function disableSubmitButton() {
        document.getElementById("submitBtn").disabled = true;
    }
</script>

</html>
