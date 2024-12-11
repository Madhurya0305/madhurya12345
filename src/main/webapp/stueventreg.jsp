<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="studentnavbar.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.sdp.model.Events" %> <!-- Replace with the actual package of your Events class -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Event Registration</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript">
        function showPopup(message) {
            alert(message);  // Using alert to show the message
            window.location.href = "viewregevents";  // Redirect to view the registered events
        }
    </script>
</head>
<body style="
    background-image: url('https://files.oaiusercontent.com/file-WNvSYNXdUvq57rNozyL3ds?se=2024-12-07T19%3A27%3A41Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D60f4243f-09be-4d73-93e2-00d64df17b6e.webp&sig=dn3u3Tz3C540Snn7OdUGSscjHQaw1gbukg8vJfS32MA%3D'); 
    background-size: cover; 
    background-repeat: no-repeat; 
    background-position: center; 
    height: 100vh; 
    margin: 0;">
    <h3 style="text-align: center;"><u>Register for Events</u></h3>
    <div class="form-container">
        <form method="post" action="registerevent">
            <table>
                <tr>
                    <td><label for="eventid">Select Event</label></td>
                    <td>
                        <select id="eventid" name="eventid" required>
                            <option value="">---Select---</option>
                            <% 
                                List<Events> eventList = (List<Events>) request.getAttribute("eventList");
                                if (eventList != null) {
                                    for (Events event : eventList) {
                                        if (event.getStatus().equals("Scheduled")) {
                            %>
                            <option value="<%= event.getEventId() %>">
                                <%= event.getName() %> (Date: <%= event.getDate() %>, Time: <%= event.getEventTime() %>)
                            </option>
                            <% 
                                        }
                                    }
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <%
        String message = (String) request.getAttribute("registrationMessage");
        if (message != null) {
    %>
        <script type="text/javascript">
            showPopup("<%= message %>");  // Show the popup message
        </script>
    <%
        }
    %>
</body>
</html>
