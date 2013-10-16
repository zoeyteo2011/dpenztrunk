/**
 * 
 */
package fyp.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author cp.pooi.2011
 *
 */
public class Reset extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		try {
			String url = "jdbc:mysql://localhost:3306/finalyearproject";
	        Class.forName("com.mysql.jdbc.Driver").newInstance(); // register driver.
	        Connection db = DriverManager.getConnection(url, "root", "");
			PreparedStatement statement= db.prepareStatement("DELETE from projects");
			int result = statement.executeUpdate();
			PreparedStatement statement2= db.prepareStatement("INSERT INTO projects (project_id, project_name, project_status, project_start_date, functional_owner, assigned_to,budget_available, project_description, exposure_of_customer_or_employee_data, outsourcing, change_and_challenges, ROI, NPV,TCO) VALUES(1, 'smu', 'Approved', '2013-09-23 08:44:16', 'cp.pooi.2011', 'nicole', 1000, 'Project seeks to improve the BOSS system to faciltate smoother bidding.', 'yes', 'no', 'Resistance to Implementation', 1000000, 10000, 100000),(2, 'smu', 'Completed', '2013-09-23 08:44:23', 'cp.pooi.2011', 'nicole', 12000, 'Project seeks to improve the elearn system to faciltate smoother online learning.', 'yes', 'no', 'Resistance to Change', NULL, NULL, NULL),(3, 'nus', 'Pending', '2013-09-23 08:45:11', 'cp.pooi.2011', 'Dex', 112000, 'Project seeks to mobile application of elearning platform.', 'no', 'no', 'Recruitment of low cost experienced developers', 2000000, 20000, 200000),(4, 'nus', 'Approved', '2013-09-23 08:45:22', 'zoey', 'Dex', 100, 'Project seeks to improve the engineering lab submission web application.', 'no', 'maybe', 'Performance of App', NULL, NULL, NULL),(5, 'nus', 'Completed', '2013-09-23 08:45:38', 'cp.pooi.2011', 'Malique', 9900, 'Project seeks to improve the room booking application.', 'maybe', 'maybe', 'Maintaining minimum downtime', 3000000, 30000, 300000)");
			int result2 = statement2.executeUpdate();
			db.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.getRequestDispatcher("loginpage.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.sendRedirect("loginpage.jsp");
	}
}
