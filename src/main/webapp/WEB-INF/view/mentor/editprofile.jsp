<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${title}</title>
    <link href="${pageContext.request.contextPath}/assets/css/navbar.css" rel="stylesheet">
    <jsp:include page="/WEB-INF/view/layout/nav_style.jsp"/>

    <script>
        function previewImage(input) {
            var preview = document.getElementById('preview');
            var fileInput = document.getElementById('fileInput');

            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    preview.src = e.target.result;
                    preview.style.display = 'block';
                };

                reader.readAsDataURL(input.files[0]);
            } else {
                preview.src = '';
                preview.style.display = 'none';
            }
        }
    </script>

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

    <style>
        .img{
            width: 280px;
            height: 280px;
            object-fit: cover;
            border: #990D28 solid 10px;
            border-radius: 50%;
            /*box-shadow: 0px 0px 13px 2px #454545;*/
        }
        .imgPreview{
            position: absolute;
            margin-top: -279px;
            margin-left: -139px;
            width: 280px;
            height: 280px;
            object-fit: cover;
            border: #990D28 solid 10px;
            border-radius: 50%;
        }
    </style>
</head>

<jsp:include page="/WEB-INF/view/layout/layout_nav.jsp"/>
<body><br><br>

<jsp:include page="/WEB-INF/view/check_nav.jsp"/><br><br><br><br>

<form action="${pageContext.request.contextPath}/mentor/${mentor_profile.mentor_id}/update_mentor_profile" method="POST" enctype="multipart/form-data" >
<div class="navbar2"><br>
    <div style="margin-left: 160px; margin-top: 0px;">
            <p class="editpro_header1">ระบบการแก้ไขข้อมูลส่วนตัว (พนักงานพี่เลี้ยง)</p>
            <p class="editpro_header2">แก้ไขข้อมูลส่วนตัว</p>
        </div>
    </div><br>
    <center>
<%--        <img src="C:/Cooperative_ITSCI/Cooperative_Education_ITSCI/target/Project/uploads/mentor_profile/${mentor_profile.mentor_image}" class="img"/>--%>
        <img src="${pageContext.request.contextPath}/uploads/mentor_profile/${mentor_profile.mentor_image}" class="img"/>
    </center>

    <div align="center">
        <label for="profile-image" class="profile-image-label">
<%--            <img class="profile" src="${pageContext.request.contextPath}/assets/img/mentor_profile/${mentor_profile.mentor_image}">--%>
            <img id="preview"  src="${pageContext.request.contextPath}/uploads/mentor_profile/${mentor_profile.mentor_image}" class="imgPreview" style="display: none">
<%--            <i class="bi bi-pencil-square"></i>--%>
        </label><br>
        <input type="hidden" name="original_file" value="${mentor_profile.mentor_image}" >
        <input type="file" id="profile-image" accept="image/*" name="mentor_profile" class="profile-image-input" onchange="previewImage(this)" style="margin-left: 500px; width: 77px">
        <c:if test="${not empty mentor_profile.mentor_image}">
            <input type="hidden" name="original_img" value="${mentor_profile.mentor_image}">
            <img src="${pageContext.request.contextPath}/uploads/mentor_profile/${mentor_profile.mentor_image}" style=" opacity: 0;position: absolute;">
        </c:if>
    </div><br><br>
    <h5 style="margin-left: 200px; font-family: 'Kanit', sans-serif; font-weight: bold;">ข้อมูลพนักงานพี่เลี้ยง</h5>
    <hr style="height: 3px; width: 1060px; background-color: #990D28; border: none; box-shadow: 0 4px 6px #990D28; margin-left: 200px;"><br>
<table class="edit_profile" align="center">
    <tr>
        <td ><p>รหัสพนักงาน</p></td>
        <td ><input type="text" value="${mentor_profile.mentor_id}" disabled></td>
    </tr>
    <tr>
        <td ><p>ชื่อพนักงาน</p></td>
        <td ><input type="text" id="mentor_name" name="mentor_name" value="${mentor_profile.mentor_name}"></td>
        <td ><p >&nbsp;&nbsp; นามสกุล &nbsp;&nbsp;</p></td>
        <td ><input type="text" id="mentor_lastname" name="mentor_lastname" value="${mentor_profile.mentor_lastname}"></td>


    </tr>
    <tr>
        <td><p>ชื่อเล่นพนักงาน</p></td>
        <td><input type="text" id="mentor_nickname" name="mentor_nickname" value="${mentor_profile.mentor_nickname}"></td>

        <td ><p style="text-align: right;">&nbsp;&nbsp; ตำแหน่ง &nbsp;&nbsp;</p></td>
        <td ><input type="text" id="mentor_position" name="mentor_position" value="${mentor_profile.mentor_position}"></td>
    </tr>
    <tr></tr>
    <tr>
        <td><p>เบอร์โทรศัพท์</p></td>
        <td><input type="text" id="phone_number" name="phone_number" value="${mentor_profile.phone_number}"></td>

        <td><p>&nbsp;&nbsp; Line &nbsp;&nbsp;</p></td>
        <td><input type="line" id="mentor_line" name="mentor_line" value="${mentor_profile.mentor_line}"></td>
    </tr>
    <tr>
        <td><p>Email</p></td>
        <td><input type="text" id="mentor_email" name="mentor_email" value="${mentor_profile.mentor_email}"></td>

    </tr>
    <tr>
        <td><p>Facebook</p></td>
        <td><input type="text" id="mentor_facebook" name="mentor_facebook" value="${mentor_profile.mentor_facebook}"></td>

    </tr>

</table>

<div style="margin: 35px 0px 50px 690px;">
    <button type="submit" class="btn btn-success" onclick="return validateForm()">บันทึก</button>
    <a href="${pageContext.request.contextPath}/mentor/edit_password/${mentor_profile.mentor_id}">
        <button type="button" class="btn btn-warning">แก้ไขรหัสผ่าน</button>
    </a>

</div>
</form>
</body><br><br><br><br>

<script>
    function validateForm() {
        var mentorName = document.getElementById("mentor_name").value;
        if (mentorName.trim() === "") {
            alert("กรุณากรอกชื่อ");
            return false;
        } else if (mentorName.length < 2 || mentorName.length > 50 || !/^[A-Za-zก-์\d\s"()]+$/u.test(mentorName)) {
            alert("ชื่อต้องมีความยาวระหว่าง 2 และ 50 ตัวอักษร และใช้ได้เฉพาะภาษาไทยและภาษาอังกฤษเท่านั้น ");
            document.getElementById("mentor_name").value = "";
            return false;
        }

        var mentorLastname = document.getElementById("mentor_lastname").value;
        if (mentorLastname.trim() === "") {
            alert("กรุณากรอกนามสกุล");
            return false;
        } else if (mentorLastname.length < 2 || mentorLastname.length > 50 || !/^[A-Za-zก-์\d\s"()]+$/u.test(mentorLastname)) {
            alert("นามสกุลต้องมีความยาวระหว่าง 2 และ 50 ตัวอักษร และใช้ได้เฉพาะภาษาไทยและภาษาอังกฤษเท่านั้น ");
            document.getElementById("mentor_lastname").value = "";
            return false;
        }

        var mentorNickname = document.getElementById("mentor_nickname").value;
        if (mentorNickname.trim() === "") {
            alert("กรุณากรอกชื่อเล่น");
            return false;
        } else if (mentorNickname.length < 1 || mentorNickname.length > 50 || !/^[A-Za-zก-์\d\s"()]+$/u.test(mentorNickname)) {
            alert("ชื่อเล่นต้องมีความยาวระหว่าง 1 และ 50 ตัวอักษร และใช้ได้เฉพาะภาษาไทยและภาษาอังกฤษเท่านั้น ");
            document.getElementById("mentor_nickname").value = "";
            return false;
        }

        var mentorPosition = document.getElementById("mentor_position").value;
        if (mentorPosition.trim() === "") {
            alert("กรุณากรอกตำแหน่ง");
            return false;
        } else if (mentorPosition.length < 1 || mentorPosition.length > 50 || !/^[A-Za-zก-์\d\s"()]+$/u.test(mentorPosition)) {
            alert("ชื่อเล่นต้องมีความยาวระหว่าง 2 และ 50 ตัวอักษร และใช้ได้เฉพาะภาษาไทยและภาษาอังกฤษเท่านั้น ");
            document.getElementById("mentor_position").value = "";
            return false;
        }

        var phoneNumber = document.getElementById("phone_number").value;
        if (phoneNumber.trim() === "") {
            alert("กรุณากรอกเบอร์โทรศัพท์");
            return false;
        } else if (phoneNumber.length !== 10 || !/^[0-9]+$/.test(phoneNumber)) {
            alert("เบอร์โทรศัพท์ต้องมีความยาวเท่ากับ 10 ตัวอักษรและต้องประกอบไปด้วยตัวเลขเท่านั้น");
            document.getElementById("phone_number").value = "";
            return false;
        }

        var mentorLine = document.getElementById("mentor_line").value;
        if (mentorLine.trim() === "") {
            alert("กรุณากรอกไลน์");
            return false;
        } else if (mentorLine.length < 1 || mentorLine.length > 50 || !/^[A-Za-zก-์\d\s\-]+$/u.test(mentorLine)) {
            alert("ไลน์ต้องมีความยาวระหว่าง 1 และ 50 ตัวอักษร และใช้ได้เฉพาะภาษาไทยและภาษาอังกฤษเท่านั้น และอนุญาตให้ใช้อักขระพิเศษตัว -");
            document.getElementById("mentor_line").value = "";
            return false;
        }

        var mentorEmail = document.getElementById("mentor_email").value;
        if (mentorEmail.trim() === "") {
            alert("กรุณากรอกอีเมล");
            return false;
        } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(mentorEmail)) {
            alert("กรุณากรอกอีเมลให้ถูกต้อง");
            document.getElementById("mentor_email").value = "";
            return false;
        }

        var mentorFacebook = document.getElementById("mentor_facebook").value;
        if (mentorFacebook.trim() === "") {
            alert("กรุณากรอกเฟซบุ๊ก");
            return false;
        } else if (mentorFacebook.length < 1 || mentorFacebook.length > 100 || !/^[A-Za-zก-์\d\s\-/.:]+$/u.test(mentorFacebook)) {
            alert("เฟซบุ๊กต้องมีความยาวระหว่าง 1 และ 100 ตัวอักษร และใช้ได้เฉพาะภาษาไทย, ภาษาอังกฤษ และเครื่องหมาย -");
            document.getElementById("mentor_facebook").value = "";
            return false;
        }
        var mentorProfile = document.getElementById("mentor_profile");
        var file = mentorProfile.files[0]; // รับไฟล์ที่เลือกจาก input
        if (!file) {
            alert("กรุณาเลือกไฟล์รูปภาพ");
            return false;
        }if (!file.type.match(/image\/(png|jpeg|jpg)/)) {
            alert("โปรดเลือกไฟล์รูปภาพเฉพาะ .png, .jpg หรือ .jpeg");
            return false;
        }
        var maxSizeInBytes = 5 * 1024 * 1024; // 5 MB
        if (file.size > maxSizeInBytes) {
            alert("ขนาดของไฟล์รูปภาพต้องไม่เกิน 5 MB");
            return false;
        }

    }
</script>


</html>
