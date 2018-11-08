<cfoutput>

<head>
  <title>Send User E-Mail</title>
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
				<button class="pull-right btn btn-md navbar-btn" type="button"><a href="" data-toggle="popover" data-placement="bottom" title="Ryan K. Johnson" data-content="Role: Chat Developer"> Ryan <span class="glyphicon glyphicon-log-out"></span></a></button>
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
					<button class="pull-right btn btn-lg" type="button">Ryan
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

<center>
Send User E-Mail
</center>

<form action="r2d3.cfm" method="POST">
  <div class="form-group">
    <label for="recipient">Enter recipient's e-mail:</label>
    <input type="text" class="form-control" name="recipient">
  </div>
  <div class="form-group">
    <label for="subject">Subject:</label>
    <input type="text" class="form-control" name="subject">
  </div>
  <div class="form-group">
    <label for="messagetext">Message:</label>
    <input type="text" class="form-control" name="messagetext">
  </div>
  <input type="hidden" id="choice" name="choice" value="message">
  <button type="submit" class="btn btn-primary">Send Message</button>
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