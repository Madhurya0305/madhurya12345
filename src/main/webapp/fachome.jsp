<%@ page import="com.klef.jfsd.sdp.model.Faculty" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Faculty f = (Faculty) session.getAttribute("faculty");
if (f == null) {
    response.sendRedirect("facsessionfail"); // Redirect to session fail page if faculty is not in session
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Faculty Home</title>
</head>
<body style="
    background-image: url('https://files.oaiusercontent.com/file-WNvSYNXdUvq57rNozyL3ds?se=2024-12-07T19%3A27%3A41Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D60f4243f-09be-4d73-93e2-00d64df17b6e.webp&sig=dn3u3Tz3C540Snn7OdUGSscjHQaw1gbukg8vJfS32MA%3D'); 
    background-size: cover; 
    background-repeat: no-repeat; 
    background-position: center; 
    height: 100vh; 
    margin: 0;">
    <%@ include file="facnavbar.jsp" %>
    <h2>Faculty Home</h2>
    Welcome <%= f.getName() %> <!-- Display faculty name -->
</body>
</html>
