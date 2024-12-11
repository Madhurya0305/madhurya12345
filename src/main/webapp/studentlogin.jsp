<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="mainnavbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<body style="
    background-image: url('https://files.oaiusercontent.com/file-WNvSYNXdUvq57rNozyL3ds?se=2024-12-07T19%3A27%3A41Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D60f4243f-09be-4d73-93e2-00d64df17b6e.webp&sig=dn3u3Tz3C540Snn7OdUGSscjHQaw1gbukg8vJfS32MA%3D'); 
    background-size: cover; 
    background-repeat: no-repeat; 
    background-position: center; 
    height: 100vh; 
    margin: 0;">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h3 style="text-align: center;"><u>Student Login</u></h3>
    <div class="form-container">
        <form method="post" action="checkstudentlogin">
            <table>
                <tr>
                    <td><label for="femail">Enter Email ID</label></td>
                    <td><input type="email" id="email" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for="fpwd">Enter Password</label></td>
                    <td><input type="password" id="password" name="password" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Login"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
