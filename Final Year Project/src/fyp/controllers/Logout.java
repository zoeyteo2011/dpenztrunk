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
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author cp.pooi.2011
 *
 */
public class Logout extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//String name = System.getProperty("user.name");
		HttpSession session = request.getSession();  
		String xpid = request.getParameter("xpid");
		session.setAttribute("xpid", null);
		session.invalidate();

		request.getRequestDispatcher("loginpage.jsp").forward(request, response);
		return;
        
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.sendRedirect("Pages/test.jsp");
	}
}
