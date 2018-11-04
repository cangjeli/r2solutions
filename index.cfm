
<cfoutput>

<head>
  <title>My Projects-Manager/Admin Page</title>
  <meta<!DOCTYPE html>
<html lang="en">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Unica+One" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="emphome.html"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
				
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!--<div class="navbar-header">
			<a href="">
			</a>
		</div>-->
			<ul class="nav navbar-nav">
  <li><a href=""> <span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="index.cfm">MY PROJECTS</a></li>
				<li><a href="emphome.html">SCHEDULE</a></li>
				<li><a href="message.cfm">MESSAGES</a></li>
				<li><a href="emphome.html">UTILIZATION</a></li>
				<li><a href="emphome.html">MY PROFILE</a></li>
				<li><a href="emphome.html">SETTINGS</a></li>
			</ul>
			<div class="pull-right container-fluid">
				<button class="pull-right btn btn-md navbar-btn" type="button"><a href="" data-toggle="popover" data-placement="bottom" title="Maria Christina Arriola" data-content="Role: Developer"> maria <span class="glyphicon glyphicon-log-out"></span></a></button>
			</div>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
			<!--<div class="dropdown">
					<button class="pull-right btn btn-lg" type="button">maria
						<span class="glyphicon glyphicon-log-out"></span>
				</div>-->
				
  </div>
  
</nav>
  
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-6">
		</div>
    <div class="col-xs-6">
	
	<button type="button" class=" pull-right btn btn-primary navbar-btn btn-xs">View</button>
	<div class="dropdown">
		<button class="pull-right btn btn-primary navbar-btn btn-xs dropdown-toggle" type="button" data-toggle="dropdown">Month
		<span class="caret"></span></button>
		
	</div>
	<div class="dropdown">
		<button class="pull-right btn btn-primary navbar-btn btn-xs dropdown-toggle" type="button" data-toggle="dropdown">Year
		<span class="caret"></span></button>
			
	</div>

	</div>
		</div>
			</div>
<div class="container-fluid">
<div class="row">
<div class="col-xs-12">

<cfquery name="managers" datasource="r2d2" >
	SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role = "Manager"
</cfquery>

<form action="r2d3.cfm" method="POST">
  <div class="form-group">
    <label for="pName">Project Name:</label>
    <input type="text" class="form-control" name="pName">
  </div>
  <div class="form-group">
    <label for="pCC">Charge Code:</label>
    <input type="text" class="form-control" name="pCC">
  </div>
  <div class="form-group">
  	Manager: <br></br>
<SELECT name="pMang">
  <CFOUTPUT QUERY="managers">
    <OPTION value="#managers.emp_id#">#managers.emp_name# - #managers.emp_id# </OPTION>
  </CFOUTPUT>
</SELECT>
  </div>
    <div class="form-group">
    <label for="sDate">Start Date:</label>
    <input type="date" class="form-control" name="sDate">
  </div>
    <div class="form-group">
    <label for="eDate">End Date:</label>
    <input type="date" class="form-control" name="eDate">
  </div>
  <input type="hidden" id="choice" name="choice" value="create">
  <button type="submit" class="btn btn-primary">Create Project</button>
</form>


<div class="container-fluid">
<hr/>
	<div class="row">
		<div class="col-xs-12">
		
			<footer class="pull-left text-muted"><p style="font-size: 10px;">R2 Solutions has created this web application for the use of Clango, Inc.</p></footer>
		</div>
	</div>
</div>
  
    
    
  </div>
</div>
</div>

</body>
</html>
</cfoutput>


