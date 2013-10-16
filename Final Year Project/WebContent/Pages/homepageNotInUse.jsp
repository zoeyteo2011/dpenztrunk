<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome!</title>
</head>
<body>
	<%@ page import = "java.util.*" %>
	<%
    	Object value = request.getAttribute("name");
		ArrayList<ArrayList<String>> projects = (ArrayList<ArrayList<String>>)request.getAttribute("projects");
		Object value2 = request.getAttribute("numbers");
		ArrayList<String> columnNames = (ArrayList<String>) request.getAttribute("column_names");
	%>
	<table width="600" border='1'><tr>
	<% 
		for(String columnName: columnNames){
			columnName = columnName.replace("_"," ");
			String firstChar = columnName.substring(0, 1).toUpperCase();
			String afterFirstChar = columnName.substring(1, columnName.length());
			columnName = firstChar.concat(afterFirstChar);
			%> <th> <%
			out.println(columnName);
			%> </th> <% 
		}
	%> </tr><%	
		for(int i = 0;i<projects.size();i++){
			%><tr><%
			ArrayList<String> projectDetails = (ArrayList<String>) projects.get(i);
			for(int j=0;j<projectDetails.size();j++){
				String projectDetail = projectDetails.get(j);
				%> <td> <%
				out.println(projectDetail);
				%> </td><% 
			}
			%></tr><%
		}
	%>
	</table>
	<textarea class="form-control textarea" rows="3">We would like to have more vending machines to provide cheap snacks for SMU students.
</body>
</html>