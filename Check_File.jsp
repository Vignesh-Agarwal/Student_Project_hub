<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jakarta.servlet.ServletException" %>
<%@ page import="jakarta.servlet.annotation.WebServlet" %>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Project Titles and Emails</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        table {
            width: 50%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<%
    String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    String DB_USER = "system";
    String DB_PASSWORD = "system";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String sql = "SELECT title, e FROM registrations";
        stmt = conn.prepareStatement(sql);
        rs = stmt.executeQuery();

        ArrayList<String> projectTitles = new ArrayList<>();
        ArrayList<String> emails = new ArrayList<>();

        while (rs.next()) {
            projectTitles.add(rs.getString("title"));
            emails.add(rs.getString("e"));
        }
%>

    <h2>Project Titles and Emails</h2>
    <table>
        <thead>
            <tr>
                <th>Project Title</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <%
                for (int i = 0; i < projectTitles.size(); i++) {
            %>
                    <tr>
                        <td><%= projectTitles.get(i) %></td>
                        <td><%= emails.get(i) %></td>
                    </tr>
            <%
                }
            %>
        </tbody>
    </table>

<%
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

</body>
</html>
