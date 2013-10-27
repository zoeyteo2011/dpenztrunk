
<%@include file="../view/nav.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Project Details</title>
<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
</head>
<body>
<form action = "search" method="GET">
	<div class="container" style="padding: 20px; padding-bottom:25px;">
		<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
						
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne"> Frequent Asked Questions</a>
						</h4>
					</div>
				<div>
				<br/>
					<table class="table table-striped table-bordered table-condensed">
				        <tr>
				        	<td style="font-weight:bold">1. I am the functional owner, why can't I change the status of my project?</td>
				        </tr>
				        <tr>
				        	<td>Changing the status of a project is only allowed for procurement staffs as they have to do relevant checks before changing.</td>
				        </tr>
				        <tr>
				        	<td style="font-weight:bold">2. After entering some search criteria, why isn't there any results?</td>
				        </tr>
				        <tr>
				        	<td >There are 2 possibilities, there might be a spelling error in the search criteria or there is simply no results.</td>
				        </tr>
				        <tr>
				        	<td style="font-weight:bold">3. How do I change certain details in my project?</td>
				        </tr>
				        <tr>
				        	<td>If you are associated with the project, the project should be shown in the homepage when you login. At the right side of the project, there will be an "Edit Project" button where you can click and edit the details</td>
				        </tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	</form>
</body>
</html>