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

public class Search extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		//String name = System.getProperty("user.name");
		String projectName = request.getParameter("projectName");
		String functionalOwner = request.getParameter("functionalOwner");
		String assignedTo = request.getParameter("assignedTo");
		String status = request.getParameter("status");
		String xpid = request.getParameter("xpid");
		
		if((projectName.equals("")) && (functionalOwner.equals("")) && (assignedTo.equals("")) && (status.equals(""))){
			request.setAttribute("searchError","Please select at least one criteria to search by.");
			request.getRequestDispatcher("homepage").forward(request, response);
		}else{
		
			ArrayList<ArrayList<String>> projects = new ArrayList<ArrayList<String>>();
			
			try {
				String url = "jdbc:mysql://localhost:3306/finalyearproject";
		        Class.forName("com.mysql.jdbc.Driver").newInstance(); // register driver.
		        Connection db = DriverManager.getConnection(url, "root", "");
		        int criteria =0;
		        String sqlStatement = "SELECT project_id,project_name,functional_owner,assigned_to,project_status FROM projects WHERE ";
		        if (!projectName.equals("")) {
		        	sqlStatement = sqlStatement.concat("project_name = '" + projectName+"'");
		        	criteria++;
		        }
		        
		        if (!functionalOwner.equals("")) {
		        	if(criteria >0) {
		        		sqlStatement = sqlStatement.concat("AND functional_owner = '" + functionalOwner+"'");
		        	}else {
		        		sqlStatement = sqlStatement.concat("functional_owner = '" + functionalOwner+"'");
		        	}
		        	criteria++;
		        }
		        
		        if (!assignedTo.equals("")) {
		        	if(criteria >0) {
		        		sqlStatement = sqlStatement.concat("AND assigned_to = '" + assignedTo+"'");
		        	}else {
		        		sqlStatement = sqlStatement.concat("assigned_to = '" + assignedTo+"'");
		        	}
		        	criteria++;
		        }
		        
		        if (!status.equals("")) {
		        	if(criteria >0) {
		        		sqlStatement = sqlStatement.concat("AND project_status = '" + status+"'");
		        	}else {
		        		sqlStatement = sqlStatement.concat("project_status = '" + status+"'");
		        	}
		        	criteria++;
		        }
		        
				PreparedStatement statement= db.prepareStatement(sqlStatement);
				System.out.println("sqlstatement:"+sqlStatement);
				ResultSet projectResult = statement.executeQuery();//get the role of the user
				System.out.println("projectResult:"+projectResult);
				ResultSetMetaData resultMeta = projectResult.getMetaData();
				int counter =1;
				
				while(projectResult.next()){
					ArrayList<String> projectDetails= new ArrayList<String>();
					counter = 1;
					System.out.println("counter");
					while(counter <= resultMeta.getColumnCount()){
						projectDetails.add(projectResult.getString(counter));
						counter++;
					}
					projects.add(projectDetails);
					System.out.println("projects:" + projects);
				}
				request.setAttribute("searchProjects", projects);
				
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
			HttpSession session = request.getSession();
			request.setAttribute("xpid", xpid);
	        request.getRequestDispatcher("homepage").forward(request, response);
			return;
	        //response.sendRedirect("homepage");
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		response.sendRedirect("homepage");
	}
}
