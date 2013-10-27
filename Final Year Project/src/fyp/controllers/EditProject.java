package fyp.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditProject extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		String projectId = request.getParameter("projectId");
		request.setAttribute("projectId", projectId);
		try {
			String url = "jdbc:mysql://localhost:3306/finalyearproject";
			Class.forName("com.mysql.jdbc.Driver").newInstance(); // register driver.
			Connection db = DriverManager.getConnection(url, "root", "");

			System.out.println("project_name:"+request.getParameter("project_name"));
			/*edit project details*/
			
			if (request.getParameter("project_name")!=null) {
				String saved = "Your results are saved!";
				request.setAttribute("saved",saved);
				System.out.println("UPDATE projects SET project_name='" +request.getParameter("project_name")+ "',project_status='" +request.getParameter("status")+ "',functional_owner='" +request.getParameter("functional_owner")+ "',assigned_to='" +request.getParameter("assignedTo")+ "',budget_available='" +request.getParameter("budget_available")+ "',project_description='" +request.getParameter("project_description")+ "',exposure_of_customer_or_employee_data='"+request.getParameter("exposure_of_customer_or_employee_data")+ "',outsourcing='"+request.getParameter("outsourcing")+ "',change_and_challenges='" +request.getParameter("change_and_challenges") +"' WHERE project_id='"+projectId+"'");
				PreparedStatement updateStatement= db.prepareStatement("UPDATE projects SET project_name='" +request.getParameter("project_name")+ "',project_status='" +request.getParameter("status")+ "',functional_owner='" +request.getParameter("functional_owner")+ "',assigned_to='" +request.getParameter("assignedTo")+ "',budget_available='" +request.getParameter("budget_available")+ "',project_description='" +request.getParameter("project_description")+ "',exposure_of_customer_or_employee_data='"+request.getParameter("exposure_of_customer_or_employee_data")+ "',outsourcing='"+request.getParameter("outsourcing")+ "',change_and_challenges='" +request.getParameter("change_and_challenges") +"' WHERE project_id='"+projectId+"'");
				
				int update = updateStatement.executeUpdate();
				
			}

			ArrayList<String> columnNamesP1 = new ArrayList<String>();//Arraylist for the columns for Phase 1
			ArrayList<String> columnNamesP2 = new ArrayList<String>();//Arraylist for the columns for Phase 2

			ArrayList<String> dataForColumnsP1 = new ArrayList<String>();//Arraylist for the data to be matched to the columns for phase 1
			ArrayList<String> dataForColumnsP2 = new ArrayList<String>();//Arraylist for the data to be matched to the columns for phase 2

			ArrayList<String> columnTypeP1 = new ArrayList<String>();
			ArrayList<String> columnTypeP2 = new ArrayList<String>();

			/*int counter = 0;
			PreparedStatement statementsForColumnNameP1 = db.prepareStatement("SELECT field_name FROM fields where active='1'and phase='1'");
			PreparedStatement statementsForColumnNameP2 = db.prepareStatement("SELECT field_name FROM fields where active='1'and phase='1'");
			//To get the name of the active fields
			ResultSet columnNamesResultP1 =statementsForColumnNameP1.executeQuery();
			ResultSetMetaData resultMetaColumnsP1 = columnNamesResultP1.getMetaData();
			while(columnNamesResultP1.next()){
				counter = 1;
				while(counter <= resultMetaColumnsP1.getColumnCount()){
					columnNamesP1.add(columnNamesResultP1.getString(counter));
					counter++;
				}
			}*/

			columnNamesP1 = getArrayListFromDB(1,db);
			columnNamesP2 = getArrayListFromDB(2,db);

			request.setAttribute("columnNamesP1", columnNamesP1);
			request.setAttribute("columnNamesP2", columnNamesP2);


			String columnNamesForSQLP1 = null;
			for(int i=0;i<columnNamesP1.size();i++){// this is to make the select statement to draw only relvent data from DB
				String columnName = columnNamesP1.get(i);
				if(i==0)
					columnNamesForSQLP1 = columnName;
				else
					columnNamesForSQLP1 = columnNamesForSQLP1+","+columnName;
			}

			String columnNamesForSQLP2 = null;
			for(int i=0;i<columnNamesP2.size();i++){// this is to make the select statement to draw only relvent data from DB
				String columnName = columnNamesP2.get(i);
				if(i==0)
					columnNamesForSQLP2 = columnName;
				else
					columnNamesForSQLP2 = columnNamesForSQLP2+","+columnName;
			}

			dataForColumnsP1 = getDataForDB(columnNamesForSQLP1,projectId,db);
			dataForColumnsP2 = getDataForDB(columnNamesForSQLP2,projectId,db);

			/*PreparedStatement statementsForDataForColumn = db.prepareStatement("SELECT "+columnNamesForSQL+" FROM projects where project_id='"+projectId+"'");
			//to get the data for the active fields, data for inactive fields will be left out
			ResultSet dataColumnResult =statementsForDataForColumn.executeQuery();
			ResultSetMetaData resultMetaDataForColumn = dataColumnResult.getMetaData();
			while(dataColumnResult.next()){
				counter = 1;
				while(counter <= resultMetaDataForColumn.getColumnCount()){
					dataForColumns.add(dataColumnResult.getString(counter));
					counter++;
				}
			}*/
			request.setAttribute("dataForColumnsP1", dataForColumnsP1);
			request.setAttribute("dataForColumnsP2", dataForColumnsP2);

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
		
		request.getRequestDispatcher("projectdetails.jsp").forward(request, response);
	}
	private ArrayList<String> getDataForDB(String columnNamesForSQL,String projectId, Connection db) {
		ArrayList<String> toReturn = new ArrayList<String>();
		int counter = 0;
		try{
			PreparedStatement statementsForDataForColumn = db.prepareStatement("SELECT "+columnNamesForSQL+" FROM projects where project_id='"+projectId+"'");

			//to get the data for the active fields, data for inactive fields will be left out
			ResultSet dataColumnResult =statementsForDataForColumn.executeQuery();
			ResultSetMetaData resultMetaDataForColumn = dataColumnResult.getMetaData();
			while(dataColumnResult.next()){
				counter = 1;
				while(counter <= resultMetaDataForColumn.getColumnCount()){
					toReturn.add(dataColumnResult.getString(counter));
					counter++;
				}
			}
		}catch(Exception e){
			return toReturn;
		}

		return toReturn;
	}

	private ArrayList<String> getArrayListFromDB(int i, Connection db) {
		ArrayList<String> toReturn = new ArrayList<String>();
		int counter = 0;
		try{
			PreparedStatement statementsForColumnName = db.prepareStatement("SELECT field_name FROM fields where active='1'and phase='"+i+"'");
			//To get the name of the active fields
			ResultSet columnNamesResult =statementsForColumnName.executeQuery();
			ResultSetMetaData resultMetaColumns = columnNamesResult.getMetaData();
			while(columnNamesResult.next()){
				counter = 1;
				while(counter <= resultMetaColumns.getColumnCount()){
					toReturn.add(columnNamesResult.getString(counter));
					counter++;
				}
			}
		}catch(Exception e){
			return toReturn;
		}
		return toReturn;
	}
}
