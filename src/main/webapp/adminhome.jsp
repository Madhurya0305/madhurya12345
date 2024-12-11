<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> <!-- Include Chart.js -->
<style>
    #countChart, #pieChart {
        max-width: 300px;
        margin: auto;
    }
</style>
</head>
<body style="
    background-image: url('https://files.oaiusercontent.com/file-WNvSYNXdUvq57rNozyL3ds?se=2024-12-07T19%3A27%3A41Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D60f4243f-09be-4d73-93e2-00d64df17b6e.webp&sig=dn3u3Tz3C540Snn7OdUGSscjHQaw1gbukg8vJfS32MA%3D'); 
    background-size: cover; 
    background-repeat: no-repeat; 
    background-position: center; 
    height: 100vh; 
    margin: 0;">
    
    
<%@include file="adminnavbar.jsp" %>

<h2>Admin Dashboard</h2>

<h3>Count</h3> <!-- Title above Bar Chart -->
<canvas id="countChart"></canvas> <!-- Canvas for Bar Chart -->

<h3>Distribution</h3> <!-- Title above Pie Chart -->
<canvas id="pieChart"></canvas> <!-- Canvas for Pie Chart -->

<script>
    // Get the values from the JSP page
    const facultyCount = ${fcount};
    const studentCount = ${scount};
    const eventCount = ${ecount};

    // Initialize the Bar Chart
    new Chart(document.getElementById('countChart'), {
        type: 'bar',
        data: {
            labels: ['Faculty', 'Students', 'Events'],
            datasets: [{
                data: [facultyCount, studentCount, eventCount],
                backgroundColor: ['#4bc0c0', '#36a2eb', '#ffce56'],
            }]
        },
        options: {
            plugins: {
                legend: { display: false }, // Hide the legend for simplicity
                title: {
                    display: true,
                    text: 'Faculty, Student, and Event Counts' // Title for the Bar Chart
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: { stepSize: 1 }
                }
            }
        }
    });

    // Initialize the Pie Chart
    new Chart(document.getElementById('pieChart'), {
        type: 'pie',
        data: {
            labels: ['Faculty', 'Students', 'Events'],
            datasets: [{
                data: [facultyCount, studentCount, eventCount],
                backgroundColor: ['#4bc0c0', '#36a2eb', '#ffce56'],
            }]
        },
        options: {
            plugins: {
                legend: { display: true }, // Display the legend for the pie chart
                title: {
                    display: true,
                    text: 'Distribution of Faculty, Students, and Events' // Title for the Pie Chart
                }
            }
        }
    });
</script>

</body>
</html>
