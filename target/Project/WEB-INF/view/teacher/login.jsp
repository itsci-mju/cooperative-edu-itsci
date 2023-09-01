<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="path-to-your-bootstrap.min.css">
    <style>
        body, html {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
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
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
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
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #888;
            text-decoration: none;
        }

        .forgot-password a:hover {
            text-decoration: underline;
        }

    </style>
    <title>Login Page</title>
</head>
<body>
<section class="login-container">
    <div class="login-box">
        <h2>Login</h2>
        <form:form action="${pageContext.request.contextPath}/doLoginTeacher" method="POST">
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
<%--<section class="h-100 gradient-form">--%>
<%--    <div class="container py-5 h-100">--%>
<%--        <div class="row d-flex justify-content-center align-items-center h-100">--%>
<%--            <div class="col-xl-10">--%>
<%--                <div class="card rounded-3 text-black">--%>
<%--                    <div class="row g-0">--%>
<%--                        <div class="col-lg-6">--%>
<%--                            <div class="card-body p-md-5 mx-md-4">--%>

<%--                                <form:form action="${pageContext.request.contextPath}/doLoginTeacher" method="POST">--%>
<%--                                    <p class="h4 mb-4">Please login to your account</p>--%>

<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input type="email" name="email" id="form2Example11" class="form-control"--%>
<%--                                               placeholder="Email" />--%>
<%--                                        <label class="form-label" for="form2Example11">Email</label>--%>
<%--                                    </div>--%>

<%--                                    <div class="form-outline mb-4">--%>
<%--                                        <input type="password" name="password" id="form2Example22"--%>
<%--                                               class="form-control" />--%>
<%--                                        <label class="form-label" for="form2Example22">Password</label>--%>
<%--                                    </div>--%>

<%--                                    <div class="d-flex justify-content-between align-items-center">--%>
<%--                                        <div class="text-muted">--%>
<%--                                            <a href="#" class="text-muted">Forgot password?</a>--%>
<%--                                        </div>--%>
<%--                                        <button type="submit" class="btn btn-primary">Login</button>--%>
<%--                                    </div>--%>

<%--                                </form:form>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

</body>
</html>
