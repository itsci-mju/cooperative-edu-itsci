<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form:form method="POST" action="${pageContext.request.contextPath}/teacher/manage_mentor_login/${mentors.mentor_id}">
    <div id="profile">
        <div class="row">
            <div class="column">
                <label for="email">อีเมล</label>
                <input type="email" id="email" name="email" value="${mentors.mentor_email}" disabled>
            </div>
            <div class="column">
                <label for="password">รหัสผ่าน</label>
                <input type="password" id="password" name="password"><br>
                <input type="password" id="confirm" name="confirm" onkeyup="checkPasswordMatch()"><br>
                <p id="passwordMatch">กรุณากรอกรหัสผ่านให้ตรงกัน</p>
            </div>
        </div>
        <div class="button-group">
            <input type="submit" value="บันทึก">
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
</html>
