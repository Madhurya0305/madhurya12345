<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.sdp.model.Events" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registered Events</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Registered Events</h2>
    <%
        List<Events> registeredEventList = (List<Events>) request.getAttribute("registeredEventList");
        if (registeredEventList != null && !registeredEventList.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Event ID</th>
                <th>Event Name</th>
                <th>Date</th>
                <th>Time</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <% for (Events event : registeredEventList) { %>
            <tr>
                <td><%= event.getEventId() %></td>
                <td><%= event.getName() %></td>
                <td><%= event.getDate() %></td>
                <td><%= event.getEventTime() %></td>
                <td><%= event.getDescription() %></td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <p>No events registered yet.</p>
    <% } %>
</body>
</html>
