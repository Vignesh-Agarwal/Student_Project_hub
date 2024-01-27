/*package dbhandler2;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/")
public class Databasehandler extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // Database configuration
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:8081:xe";
    private static final String DB_USER = "system";
    private static final String DB_PASSWORD = "system";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve data from the registration form
        String name = request.getParameter("name");
        String e =request.getParameter("email1");
        String roll = request.getParameter("roll");
        String title = request.getParameter("project_title");
        String project=request.getParameter("project_desp");

        // Database connection and insertion
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String insertQuery = "INSERT INTO registrations(name,e,roll,title,project) VALUES (?, ?, ?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, e);
            preparedStatement.setString(3, roll);
            preparedStatement.setString(4, title);
            preparedStatement.setString(5, project);

            
            int rowsAffected = preparedStatement.executeUpdate();
            
            if (rowsAffected > 0) {
                response.getWriter().println("Registration successful!");
            } 
            else {
                response.getWriter().println("Registration failed!");
            }        
            conn.close();
        } catch (ClassNotFoundException | SQLException e11) {
            e11.printStackTrace();
            response.getWriter().println("Error: at this point" + e11.getMessage());
        }
    }
}*/

