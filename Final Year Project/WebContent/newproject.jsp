<%@include file="../view/nav.jsp"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>View Project Details</title>
		<script src="../js/bootstrap.js"></script>
		<script src="../js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="container" style="padding: 20px;">
			<div class="pull-right" style="padding-right: 10px;">
				<form action="homepage.jsp">
					<button type="submit" class="btn btn-primary">
						Back <i class="glyphicon glyphicon-share-alt"></i>
					</button>
				</form>
			</div>
		</div>
		
		<div class="container" style="padding-bottom:25px;">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a class="accordion-toggle" data-toggle="collapse"
								data-parent="#accordion" href="#collapseOne"> Phase 1: Preparation </a>
						</h4>
					</div>
					<div id="collapseOne" class="panel-collapse collapse in">
						<div class="panel-body">
							<div class="form-group">
								<label for="functionalOwner" class="col-lg-2 control-label">Functional Owner</label>
								<div class="col-lg-10">
									<input class="form-control" id="functionalOwner" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="projectName" class="col-lg-2 control-label">Project Name</label>
								<div class="col-lg-10">
									<input class="form-control" id="projectName" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="projectDecription" class="col-lg-2 control-label">Project Description</label>
								<div class="col-lg-10">
									<input class="form-control" id="projectDecription" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="affectedCountries" class="col-lg-2 control-label">Affected Countries</label>
								<div class="col-lg-10">
									<input class="form-control" id="affectedCountries" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="projectBrief" class="col-lg-6 control-label"> Project Brief / Project Initiation Document / Business Justifications</label>
								<div class="col-lg-5">
									<input type="file" id="projectBrief">
								</div>
							</div>
							
							<div class="form-group">
								<label for="noProjectBriefReason" class="col-lg-2 control-label">Reasons if not uploaded</label>
								<div class="col-lg-10">
									<input class="form-control" id="noProjectBriefReason" type="text">
								</div>
							</div>
							
							<div class="form-group">
								<label for="allocatedLimit" class="col-lg-2 control-label">Allocated Limit (EUR)</label>
								<div class="col-lg-10">
									<input class="form-control" id="allocatedLimit" type="text">
								</div>
							</div>
							
							<div class="pull-left" style="padding-right: 10px;">
								<div class="form-group">
									<label for="costCentre" class="col-lg-2 control-label">Charged to Cost Centre</label>
									<div class="col-lg-10">
										<input class="form-control" id="costCentre" type="text">
									</div>
								</div>
							</div>
							
							<div class="pull-right" style="padding-right: 10px;">
								<div class="form-group">
									<label for="costCentreOwnerXPID" class="col-lg-2 control-label">Cost Centre Owner XPID</label>
									<div class="col-lg-10">
										<input class="form-control" id="costCentreOwnerXPID" type="text">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label for="agreementDate" class="col-lg-2 control-label">When does the agreement need to be in place?</label>
								<div class="col-lg-10">
									<input class="form-control" id="agreementDate" type="text" placeholder="ddmmyy">
								</div>
							</div>
							
							<div class="pull-left" style="padding-right: 10px;">
								<div class="form-group">
									<label for="renewalExistingAgreement" class="col-lg-2 control-label">Is this a renewal of an existing agreement?</label>
									<div class="col-lg-10">
										<input class="form-control" id="renewalExistingAgreement" type="text">
									</div>
								</div>
							</div>
							
							<div class="pull-right" style="padding-right: 10px;">
								<div class="form-group">
									<label for="existingAgreement" class="col-lg-2 control-label">Existing agreement ID</label>
									<div class="col-lg-10">
										<input class="form-control" id="existingAgreement" type="text">
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
				<div class="container" style="padding: 20px;">
					<div class="pull-right" style="padding-right: 10px;">
						<form action="homepage1.jsp">
							<button type="submit" class="btn btn-primary">
								Submit <i class="glyphicon glyphicon-ok"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>