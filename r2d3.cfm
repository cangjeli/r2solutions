<cfset fun = '#Form.choice#'>

<cfoutput>

<head>
  <title>Database Pull / E-mail Sent</title>
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
				<li><a href="index.cfm">ADD PROJECT</a></li>
				<li><a href="allprojects.html">ALL PROJECTS</a></li>
				<li><a href="chat.cfm">MESSAGES</a></li>
				<li><a href="resource_utilization_search_employee.cfm">UTILIZATION</a></li>
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

	</div>
		</div>
			</div>
<div class="container-fluid">
<div class="row">
<div class="col-xs-12">
<cfif fun eq "create">
<cfquery name="Projects" datasource="r2_db">
  INSERT INTO PROJECT
  VALUES ('#Form.pCC#','#Form.pName#','#Form.pMang#','#Form.sDate#','#Form.eDate#')
</cfquery>

<cfquery datasource="r2_db" name="check">
select *
from PROJECT
</cfquery>
<cfoutput query="check">
 #MGR_ID#<br />
</cfoutput>


<cfelseif fun eq "message">

<cfmail 
to="#Form.recipient#"
from="r2solutionsGMU@gmail.com" 
subject="#Form.subject#">
#Form.messagetext# 

This is an e-mail sent out by the CRU app developed by R2 Solutions

</cfmail>

<cfoutput>
    <p>Your e-mail has been sent. Be aware that refreshing this page will send out duplicate e-mails.</p>
</cfoutput>
</cfif>


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
