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
public class StartHomepage extends HttpServlet {
	String error = "Have you registered with IPS?";
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//String name = System.getProperty("user.name");
		HttpSession session = request.getSession();  
		String xpid = null;
		if (request.getParameter("xpid") !=null) {
			xpid = request.getParameter("xpid");
		} else if (request.getAttribute("xpid")!=null) {
			xpid = (String) request.getAttribute("xpid");
		}
		session.setAttribute("xpid", xpid);
		request.setAttribute("xpid", xpid);
		
		String role = null;
		String name = null;
		
		ArrayList<ArrayList<String>> projects = new ArrayList<ArrayList<String>>();
		
		try {
			String url = "jdbc:mysql://localhost:3306/finalyearproject";
	        Class.forName("com.mysql.jdbc.Driver").newInstance(); // register driver.
	        Connection db = DriverManager.getConnection(url, "root", "");
			PreparedStatement statement= db.prepareStatement("SELECT role FROM users WHERE xpid='"+xpid+"'");
			PreparedStatement statementForName = db.prepareStatement("SELECT name FROM users WHERE xpid='"+xpid+"'");
			ResultSet resultRole = statement.executeQuery();//get the role of the user
			ResultSet resultName = statementForName.executeQuery();//get the name of the user
			if(resultName.next()){
				name = resultName.getString(1);
			}
			
			if(resultRole.next()){
				role = resultRole.getString(1);
			}
			if(role!=null){
				PreparedStatement statementsForProject = null;
				if(!role.equalsIgnoreCase("procurement")){
					statementsForProject = db.prepareStatement("SELECT project_id,project_name,functional_owner,assigned_to,project_status FROM projects WHERE functional_owner='"+name+"'");
				}else{
					statementsForProject = db.prepareStatement("SELECT project_id,project_name,functional_owner,assigned_to,project_status FROM projects WHERE assigned_to='"+name+"'");
				}
				ResultSet projectResult=statementsForProject.executeQuery();
				ResultSetMetaData resultMeta = projectResult.getMetaData();
				int counter =1;
				
				while(projectResult.next()){
					ArrayList<String> projectDetails= new ArrayList<String>();
					counter = 1;
					while(counter <= resultMeta.getColumnCount()){
						projectDetails.add(projectResult.getString(counter));
						counter++;
					}
					projects.add(projectDetails);
				}
				request.setAttribute("projects", projects);
				
			}else{
				request.setAttribute("error",error);
				request.getRequestDispatcher("loginpage.jsp").forward(request, response);
				return;
			}
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
		
		request.setAttribute("name", name);
		request.setAttribute("searchError", request.getAttribute("searchError"));
		request.setAttribute("searchProjects", request.getAttribute("searchProjects"));
		System.out.println("searchProjects:" + request.getAttribute("searchProjects"));
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.sendRedirect("homepage.jsp");
	}
}
