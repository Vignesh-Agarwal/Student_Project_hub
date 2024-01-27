<%@ page import="java.io.IOException, java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ page import="java.io.IOException"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="jakarta.servlet.ServletException"%>
<%@ page import="jakarta.servlet.annotation.WebServlet"%>
<%@ page import="jakarta.servlet.http.HttpServlet"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%@ page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    // Database configuration
    String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    String DB_USER = "system";
    String DB_PASSWORD = "system";

    String name = request.getParameter("name");
    String e = request.getParameter("email1");
    String roll = request.getParameter("roll");
    String title = request.getParameter("project_title");
    String project = request.getParameter("project_desp");

    
    // Database connection and insertion
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String insertQuery = "INSERT INTO registrations(name,e,roll,title,project) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, e);
        preparedStatement.setString(3, roll);
        preparedStatement.setString(4, title);
        preparedStatement.setString(5, project);

        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
            response.getWriter().println("Registration successful!");
        } else {
            response.getWriter().println("Registration failed!");
        }
        conn.close();
    } catch (ClassNotFoundException | SQLException e11) {
        e11.printStackTrace();
        response.getWriter().println("Error: at this point" + e11.getMessage());
    }
%>
