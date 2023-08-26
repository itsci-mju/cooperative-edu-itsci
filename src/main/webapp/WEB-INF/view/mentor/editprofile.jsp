<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${title}</title>
<%--    <link href="${pageContext.request.contextPath}/assets/css/mentor/liststudent.css" rel="stylesheet">--%>
    <link href="/assets/css/mentor/liststudent.css" rel="stylesheet">

</head>
<style>
    .profile {
        width: 200px;
        height: 200px;
        margin-left: 260px;
        margin-top: 50px;
    }
</style>
<body>


<jsp:include page="/WEB-INF/view/layout/navbar.jsp"/>

<form action="${pageContext.request.contextPath}/mentor/${mentor_profile.mentor_id}/update_mentor_profile" method="POST" >
    <div class="navbar2"><br><br>
        <div style="margin-left: 160px">
            <p class="editpro_header1">ระบบการประเมินการฝึกสหกิจศึกษา (พนักงานพี่เลี้ยง)</p>
            <p class="editpro_header2">รายชื่อนักศึกษา</p>
        </div>
    </div>
<table class="edit_profile" >
    <tr>
        <td colspan="4">
            <img class="profile" src="${pageContext.request.contextPath}/assets/img/profile.png">
        </td>
    </tr>
    <div class="linehorizontal"></div>
    <tr>
        <td colspan="2"><p>ข้อมูลพนักงานพี่เลี้ยง</p></td>
    </tr>
    <tr></tr>
    <tr>
        <td ><p>รหัสพนักงาน</p></td>
        <td><input type="text" value="${mentor_profile.mentor_id}" disabled></td>
    </tr>
    <tr>
        <td><p>ชื่อพนักงาน</p></td>
        <td><input type="text" id="mentor_name" name="mentor_name" value="${mentor_profile.mentor_name}"></td>
        <td><p >&nbsp;&nbsp; นามสกุล &nbsp;&nbsp;</p></td>
        <td><input type="text" id="mentor_lastname" name="mentor_lastname" value="${mentor_profile.mentor_lastname}"></td>


    </tr>
    <tr>
        <td><p>ชื่อเล่นพนักงาน</p></td>
        <td><input type="text" id="mentor_nickname" name="mentor_nickname" value="${mentor_profile.mentor_nickname}"></td>

        <td><p style="text-align: right;">&nbsp;&nbsp; ตำแหน่ง &nbsp;&nbsp;</p></td>
        <td><input type="text" id="mentor_position" name="mentor_position" value="${mentor_profile.mentor_position}"></td>
    </tr>
    <tr></tr>
    <tr>
        <td><p>เบอร์โทรศัพท์</p></td>
        <td><input type="tel" id="phone_number" name="phone_number" value="${mentor_profile.phone_number}"></td>

        <td><p>&nbsp;&nbsp; Line &nbsp;&nbsp;</p></td>
        <td><input type="line" id="mentor_line" name="mentor_line" value="${mentor_profile.mentor_line}"></td>
    </tr>
    <tr>
        <td><p>Email</p></td>
        <td><input type="text" id="mentor_email" name="mentor_email" value="${mentor_profile.mentor_email}"></td>

        <td><p >&nbsp;&nbsp; รหัสผ่าน &nbsp;&nbsp;</p></td>
        <td><input type="text" id="password" name="password" value="${mentor_profile.password}"></td>
    </tr>

</table>

<div style="margin: 35px 0px 50px 690px;">

    <button type="submit" class="btn btn-success">บันทึกการแก้ไข</button>
    <button type="button" class="btn btn-warning">ยกเลิก</button>
</div>
</form>
</body>

<jsp:include page="/WEB-INF/view/layout/footer.jsp"/>
</html>
