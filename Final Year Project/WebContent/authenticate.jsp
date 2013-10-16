<%@ page import="java.util.*" %>
<%
// setting up password table, go ahead and add your own users
HashMap<String, String> map = new HashMap<String, String>();
map.put("Eliza", "password");
map.put("Andrew", "password");

// initial declarations
String userName = request.getParameter("inputUsername");
String password = request.getParameter("inputPassword");
String logout = request.getParameter("logout");

System.out.println(userName);
System.out.println(password);

// more codes here for you to fill?
if(password != null && userName != null){
	System.out.print(userName + password);
    if(map.containsKey(userName)&&map.get(userName).equals(password)){

        session.setAttribute("loginName", userName);
        response.sendRedirect("homepage1.jsp");
        //out.println("<a href=login.jsp>Click here to go back!</a>");
    }
    else{
    System.out.print(userName + password);%>
        <jsp:forward page="index.jsp">
        <jsp:param name="errorMsg" value="Invalid username/password" />
        </jsp:forward>
    
    <%}
} else{%>
    <jsp:forward page="index.jsp">
    <jsp:param name="errorMsg" value="Invalid username/password" />
    </jsp:forward>

<%}

if(logout != null){
    
      session.invalidate();
      response.sendRedirect("index.jsp");
      logout = null;
      
}

//Use as little redirect as possible
%>
