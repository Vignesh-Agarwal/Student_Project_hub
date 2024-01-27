package delete_reg_table;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Delete_reg_table")
	public class Delete_reg_table  extends HttpServlet 
	{
	private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	    private static final String DB_USER = "system";
	    private static final String DB_PASSWORD = "system";

	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;

	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            String sql = "SELECT title,e FROM registrations";
	            stmt = conn.prepareStatement(sql);
	            rs = stmt.executeQuery();

	            ArrayList<String> projectTitles = new ArrayList<>();
	            ArrayList<String> emails = new ArrayList<>();

	            while (rs.next()) 
	            {
	                projectTitles.add(rs.getString("title"));
	                emails.add(rs.getString("e"));
	            }

	            // Set data in request attributes
	            request.setAttribute("projectTitles", projectTitles);
	            request.setAttribute("emails", emails);
	            request.getRequestDispatcher("title.jsp").forward(request, response);

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
	    }
	    }

