
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>ING Procurement System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="the boiled brains.">
<meta name="author" content="">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/ipsstylesheet.css" rel="stylesheet">

</head>

<body background color= "#000000">

	<!-- Normal Navbar -->
	<div class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <a href="#" class="navbar-brand">IPS</a>
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div class="navbar-collapse collapse" id="navbar-main">
          <ul class="nav navbar-nav">
            <li class="active">
              <a href="homepage?xpid=<%=session.getAttribute("xpid")%>"><i class="glyphicon glyphicon-home"></i> Home</a>
            </li>
          </ul>
          <ul class="nav navbar-nav">
           
            <li class="active">
              <a href="help.jsp"><i class="glyphicon glyphicon-question-sign"></i>Help</a>
            </li>
          </ul>
		<%if(session.getAttribute("xpid") != null) { %>
          <ul class="nav navbar-nav navbar-right">
          	
            <li><a href="#"><i class="glyphicon glyphicon-user"></i><%=session.getAttribute("xpid") %></a></li>
            <li><a href="logout"><i class="glyphicon glyphicon-remove"></i> Logout</a></li> 
          </ul>
          <% } %>

        </div>
      </div>
    </div>
	
	<br /><br /><br />
</body>
</html>
