<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${title}</title>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="path-to-your-bootstrap.min.css">
        <style>
            body, html {
                margin: 0;
                font-family: 'Prompt', sans-serif;
                background-color: #f4f4f4;
            }

            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .login-box {
                background-color: #fff;
                border-radius: 20px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
                padding: 30px;
                border: #c8c7c7 solid;
                width: 300px;
            }

            .login-box h2 {
                margin-bottom: 20px;
                text-align: center;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                font-weight: bold;
            }

            .form-group input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            button {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #AC1C2E;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-weight: bold;
                font-family: 'Prompt', sans-serif;
            }

            button:hover {
                background-color: #BF3446;
            }

        </style>
        <title>Login Page</title>
    </head>
<body>
<section class="login-container">
    <div class="login-box">
        <h2>เข้าสู่ระบบพนักงานพี่เลี้ยง</h2>
        <form:form action="${pageContext.request.contextPath}/doLoginMentor" method="POST">
            <div class="form-group">
                <label >Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label >Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form:form>
    </div>
</section>
</body>
</html>
