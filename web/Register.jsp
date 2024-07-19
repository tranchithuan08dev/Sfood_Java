<%-- 
    Document   : Register
    Created on : Jun 27, 2024, 3:33:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <link rel="stylesheet" href="./CSS/register.css" />
    </head>
    <body>
        <h1>Đăng kí </h1>
        <p>Hãy điền đầy đủ các thông tin của bạn cho chúng tôi</p>
        <h2  style="color: red; text-align: center; background-color: buttonhighlight
            ">${requestScope.registermess}</h2>
            <form id="registrationForm" action="MainController" method="POST">
            <input type="hidden" name="action" value="register" />
            <fieldset>

                <label >Enter Your Full Name:
                    <input type="text" name="txtname" required
                           /></label>
                <label 
                    >Enter Your Email:
                    <input type="email" name="txtemail" required
                           /></label>
                <label >Enter Your Phone
                    <input type="number" name="txtphone" required
                           /></label>
                <label >Enter Your Address:
                    <input type="text" name="txtaddress" required
                           /></label>
                <label 
                    >Create a New Password:
                    <input
                        id="newPassword"
                        type="password"   
                        required
                        /></label>
                <label>
                    Confirm a New Password:
                    <input
                        id="confirmPassword"
                        type="password"
                        name="txtpassword"
                        required
                        /></label>
            </fieldset>
            <input type="submit" value="register"  />
        </form>
        
    </body>
</html>
