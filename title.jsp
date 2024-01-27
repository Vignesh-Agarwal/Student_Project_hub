<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Data Display</title>
</head>
<body>
    <h1>Data from Registrations Table</h1>
    <table border="1">
        <tr>
            <th>Project Title</th>
            <th>Gmail</th>
        </tr>
        <% 
        String[] projectTitlesArray = (String[]) request.getAttribute("projectTitles");
        String[] emailsArray = (String[]) request.getAttribute("emails");
        
        if (projectTitlesArray != null && emailsArray != null) {
            for (int i = 0; i < Math.min(projectTitlesArray.length, emailsArray.length); i++) { 
        %>
            <tr>
                <td><%= projectTitlesArray[i] %></td>
                <td><%= emailsArray[i] %></td>
            </tr>
        <% 
            } 
        } else {
        %>
            <tr>
                <td colspan="2">No data available</td>
            </tr>
        <% 
        } 
        %>
    </table>
</body>
</html>
