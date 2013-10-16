<%@include file="../view/nav.jsp"%>
<html>  
<head>  

</head> 
<body>  
	<%@ page import = "java.util.*" %>
	<%
    	Object value = request.getAttribute("name");
		ArrayList<ArrayList<String>> projects = (ArrayList<ArrayList<String>>)request.getAttribute("projects");
		ArrayList<ArrayList<String>> searchProjects = (ArrayList<ArrayList<String>>)request.getAttribute("searchProjects");
		Object value2 = request.getAttribute("numbers");
		ArrayList<String> columnNames = (ArrayList<String>) request.getAttribute("column_names");
		Object xpid = request.getAttribute("xpid");
		
	%>
	<!--  <div class="container" style="padding: 20px;">
		<div class="pull-right" style="padding-right: 10px;">
			<form action="homepage">
				<input type=hidden name="xpid" value=<%=xpid%>/>
				<button type="submit" class="btn btn-primary">
					Back <i class="glyphicon glyphicon-share-alt"></i>
				</button>
			</form>
		</div>
	</div>-->
	<form action = "search" method="GET">
	<div class="container" style="padding: 20px; padding-bottom:25px;">
		<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
						
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne"> Search Projects </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="form-group">
								
							<%
								String searchError = (String)request.getAttribute("searchError");
								if(searchError!=null){
									%><table><tr>
									<%=searchError%>
									</tr></table>
									<%
								}			
							%>
								<label for="projectName" class="col-lg-2 control-label">Project
									Name</label>
								<div class="col-lg-10">
									<input class="form-control" name="projectName" id="projectName" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="functionalOwner" class="col-lg-2 control-label">Functional
									Owner</label>
								<div class="col-lg-10">
									<input class="form-control" name="functionalOwner" id="functionalOwner" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="assignedTo" class="col-lg-2 control-label">Assigned To </label>
								<div class="col-lg-10">

									<select class="form-control" name="assignedTo" id="assignedTo">
										<option value="">Please Select...</option>
										<option value="Nicole">Nicole</option>
										<option value="Malique">Malique</option>
										<option value="Dex">Dex</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="status" class="col-lg-2 control-label">Status </label>
								<div class="col-lg-10">

									<select class="form-control" name="status" id="status">
										<option value="">Please Select...</option>
										<option value="Approved">Approved</option>
										<option value="Completed">Completed</option>
										<option value="Pending">Pending</option>
									</select>
								</div>
								<input type="hidden" name="xpid" value="<%=xpid%>"/>
							</div>
							
							</br></br></br></br></br></br></br></br>
							<div class="pull-right" style="padding-right: 10px;">
										<button type="submit" class="btn btn-primary">
											<i class="glyphicon glyphicon-search"></i> Search
										</button>
									
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>
	
	</form>
		
	<div class="container" style="padding-bottom:25px;">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseOne">Projects I Am Working On</a>
					</h4>
				</div>
			</div>
		</div>
		<div>
			<table class="table table-striped table-bordered table-condensed">
				
			        <tr>
			        	<th>Project ID</th>
			            <th>Project Name</th>
			            <th>Functional Owner</th>
			            <th>Assigned</th>
			            <th>Status</th>
			            <th></th>
			        </tr>
			    
			</tr><%	
			if(projects==null || projects.size()==0){%>
				<tr><td colspan="6">You are not working on any projects currently.</td></tr>
				<% 
			}else {
				for(int i = 0;i<projects.size();i++){
				%><tr>
						
				<%
					String projectId = null;
					ArrayList<String> projectDetails = (ArrayList<String>) projects.get(i);
					for(int j=0;j<projectDetails.size();j++){
						String projectDetail = projectDetails.get(j);
						if(j==0){
							projectId=projectDetail;
						}
				%> <td>
				<%
						out.println(projectDetail);
						%> </td><% 
					}
				%><td>
						<form action="editProject" Method="POST">
			            	<button type="submit" class="btn btn-primary">
								<i class="glyphicon glyphicon-edit"></i> Edit Project
								<input type="hidden" name="projectId" value="<%=projectId%>"/>
							</button>
				</form>
				</td></tr><%
					}
					}
				%>
			
			</table>
		</div>
	</div>
	
	<div class="container" style="padding-bottom:25px;">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse"
							data-parent="#accordion" href="#collapseOne">Other Projects</a>
					</h4>
				</div>
			</div>
		</div>
		<div>
			<table class="table table-striped table-bordered table-condensed">
				<thead>
			        <tr>
			            <th>Project Name</th>
			            <th>Functional Owner</th>
			            <th>Assigned</th>
			            <th>Status</th>
			            <th></th>
			        </tr>
			    </thead>
				<tr>
					<%
						if(searchProjects!=null) {
							for (int i = 0; i < searchProjects.size(); i++) {
					%>
				
				
				<tr>

					<%
						String projectId = null;
								ArrayList<String> projectDetails = (ArrayList<String>) searchProjects.get(i);
								for (int j = 0; j < projectDetails.size(); j++) {
									String projectDetail = projectDetails.get(j);
									if (j == 0) {
										projectId = projectDetail;
									}
					%>
					<td>
						<%
							out.println(projectDetail);
						%>
					</td>
					<% 
				}
			%><td>
						<form action="editProject" Method="POST">
							<button type="submit" class="btn btn-primary">
								<i class="glyphicon glyphicon-edit"></i> Edit Project <input
									type="hidden" name="projectId" value="<%=projectId%>" />
							</button>
						</form>
					</td>
				</tr><%
			}
			    }
			%>
			
			 </table>
		</div>
	</div>
	
</body>  
</html>