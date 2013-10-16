<%@include file="../view/nav.jsp"%>
<html>

<body>
	<div class="container">

		<div class="hero-unit">
			<form class="form-horizontal" name="login_form" action="homepage">
				<div class="control-group">
					<%
					String error = request.getParameter("error");
					if(error!=null){
						%><%=error%><%
					}			
					%>
					<label class="control-label" for="inputUsername">Xpid</label>
					<div class="controls">
						<input type="text" name="xpid" placeholder="xpid">
					</div>
				</div>
				<br>
				<div class="control-group">
					<div class="controls">
						<button class="btn">Login</button>
					</div>
					
				</div>
			</form>
			<form name="reset_form" action="reset">
			<div class="control-group">
				<div class="controls">
						<button class="btn">Reset Database</button>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>

</html>