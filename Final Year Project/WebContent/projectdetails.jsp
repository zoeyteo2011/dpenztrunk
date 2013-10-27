
<%@include file="../view/nav.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Project Details</title>
<script src="../js/bootstrap.js"></script>
<script src="../js/bootstrap.min.js"></script>

</head>
<body>
	<%@ page import = "java.util.*" %>
	<%@ page import = "java.text.*" %>
	<%
		ArrayList<String> columnNamesP1 = (ArrayList<String>) request.getAttribute("columnNamesP1");
		ArrayList<String> columnNamesP2 = (ArrayList<String>) request.getAttribute("columnNamesP2");
		ArrayList<String> dataForColumnsP1 = (ArrayList<String>) request.getAttribute("dataForColumnsP1");
		ArrayList<String> dataForColumnsP2 = (ArrayList<String>) request.getAttribute("dataForColumnsP2");
		String saved = (String) request.getAttribute("saved");
		
	%>
		<div class="container" style="padding: 20px;">
			<div class="pull-right" style="padding-right: 10px;">
				<table><tr><td><%if(saved!=null){
						%><h4><%=saved %></h4><%
					}%></td><td>
				<form action ="homepage"> 
					
					<button type="submit" class="btn btn-primary">
						Back <i class="glyphicon glyphicon-share-alt"></i>
					</button>
					<input type=hidden name="xpid" value=<%=session.getAttribute("xpid")%>/>
				</form>
			</td>
				
			<td>
				<form action ="editProject" method="post"> 		
					<button type="submit" class="btn btn-primary">
						<i class="glyphicon glyphicon-floppy-disk"></i> Save Edits
					</button>
					<input type="hidden" name="projectId" value="<%=request.getAttribute("projectId")%>" />
		</td></tr></table>
		</div></div>
			
		<div class="container" style="padding-bottom:25px;">
		
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne"> Phase 1:
								Preparation </a>
							<div class="pull-right">
								Current Status:
								<%for(int i=0; i< columnNamesP1.size(); i++){
									if(columnNamesP1.get(i).equals("project_status")) {
										if(dataForColumnsP1.get(i).equals("Approved")){%>
										<div class="progress-approved"><i class="glyphicon glyphicon-play-circle"></i> Approved</div>
								<%}else if (dataForColumnsP1.get(i).equals("Pending")) { %>
								<div class="progress-pending"><i class="glyphicon glyphicon-question-sign"></i> Pending</div>
									<%}else {%>
									<div class="progress-completed"><i class="glyphicon glyphicon-ok"></i> Completed</div>
									<% }
									}
								}%>
									
							</div> 
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
							<table class="table table-striped table-bordered table-condensed">
							<% 
							int counter=0;
							for(String columnName: columnNamesP1){
								System.out.println("co:"+columnName);
								String columnNameDisplay = columnName.replace("_"," ");
								String firstChar = columnNameDisplay.substring(0, 1).toUpperCase();
								String afterFirstChar = columnNameDisplay.substring(1, columnName.length());
								columnNameDisplay = firstChar.concat(afterFirstChar);
								String projectDetails = (String) dataForColumnsP1.get(counter);
								%>
								<tr><td width ="300">
								<label for="<%=columnName%>"><%=columnNameDisplay%></label></td>
								<!-- <div class="col-lg-10">
									<input class="form-control" id="<%=columnName%>" type="text" value="<%=projectDetails%>">
								</div> -->
								<td>
									<% if (columnNameDisplay.equals("Project description")) { %>
										<textarea class="form-control textarea" rows="3" name="<%=columnName%>"><%=projectDetails %></textarea>
									<% }else if(columnNameDisplay.equals("Project start date")||columnNameDisplay.equals("Project id")) { %>
										<input class="form-control" type="text" name="<%=columnName%>" value="<%=projectDetails%>" disabled>
									<%}else if(columnNameDisplay.equals("Assigned to")){ %>
										<select class="form-control" name="assignedTo" name="assignedTo">
											<option value="<%=projectDetails%>"><%=projectDetails%></option>
											<%if (!projectDetails.equals("Nicole")){%>
												<option value="Nicole">Nicole</option>
											<%}if(!projectDetails.equals("Dex")){%>
												<option value="Dex">Dex</option>
											<%}if(!projectDetails.equals("Malique")){%>
												<option value="Malique">Malique</option>
											<%}%>
										</select>
										
									<%}else if(columnNameDisplay.equals("Project status")){ 
											if(session.getAttribute("role").equals("procurement")){
										%>
											<select class="form-control" name="status">
											<option value="<%=projectDetails%>"><%=projectDetails%></option>
											<%if (!projectDetails.equals("Approved")){%>
												<option value="Approved">Approved</option>
											<%}if(!projectDetails.equals("Completed")){%>
												<option value="Completed">Completed</option>
											<%}if(!projectDetails.equals("Pending")){%>
												<option value="Pending">Pending</option>
											<%}%>
										</select>
										<%}else{ %>									
											<input class="form-control" type="text" name="status" value="<%=projectDetails%>" disabled/>
											<input type="hidden" name="status" value="<%=projectDetails%>"/>
										<%} %>	
								<% }else{%>
										<input class="form-control" type="text" name="<%=columnName%>" value="<%=projectDetails%>">
									<% } %>
								</td></tr>
							<%		
							counter++;
							}
							%>
								</table>
							
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a class="accordion-toggle" data-toggle="collapse"
									data-parent="#accordion" href="#collapseTwo"> Phase 2:
									Specification </a>
							</h4>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse in">
							<table class="table table-striped table-bordered table-condensed">
							<% 
							int counterP2=0;
							for(String columnName: columnNamesP2){
								String columnNameDisplay = columnName.replace("_"," ");
								String firstChar = columnNameDisplay.substring(0,1).toUpperCase();
								String afterFirstChar = columnNameDisplay.substring(1, columnName.length());
								columnNameDisplay = firstChar.concat(afterFirstChar);
								String projectDetails = (String) dataForColumnsP2.get(counterP2);
								%>
								<tr><td width ="300">
								<label for="<%=columnName%>"><%=columnNameDisplay%></label></td>
								<!-- <div class="col-lg-10">
									<input class="form-control" id="<%=columnName%>" type="text" value="<%=projectDetails%>">
								</div> -->
								<td>
									<input class="form-control" type="text" name="<%=columnName%>" value="<%=projectDetails %>">
								</td></tr>
							<%		
							counter++;
							}
							%>
							</table>
							</div>
						</div>

					
				</div>
	
	</div>
	</form>
	<div class="container" style="padding: 20px;">
			<div class="pull-right" style="padding-right: 10px;">
				<table><tr><td>
				<form action ="homepage"> 
					<button type="submit" class="btn btn-primary">
						Back <i class="glyphicon glyphicon-share-alt"></i>
					</button>
					<input type=hidden name="xpid" value=<%=session.getAttribute("xpid")%>/>
				</form>
			</td>
				
			<td>
				<form action ="editProject" method="post"> 		
					<button type="submit" class="btn btn-primary">
						<i class="glyphicon glyphicon-floppy-disk"></i> Save Edits
					</button>
					<input type="hidden" name="projectId" value="<%=request.getAttribute("projectId")%>" />
		</td></tr></table>
		</div></div>
</body>



</html>