<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->


<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
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
			<a href="#">
			</a>
		</div>-->
			<ul class="nav navbar-nav">
  <li><a href="emphome.html"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="create_proj.html">ADD PROJECT</a></li>
				<li><a href="allprojects.html">ALL PROJECTS</a></li>
				<li><a href="emphome.html">MESSAGES</a></li>
				<li><a href="emphome.html">UTILIZATION</a></li>
				<li><a href="emphome.html">MY PROFILE</a></li>
				<li><a href="emphome.html">SETTINGS</a></li>
			</ul>
			<div class="pull-right container-fluid">
				<button class="pull-right btn btn-md navbar-btn" type="button"><a href="#" data-toggle="popover" data-placement="bottom" title="Sohaib Khan" data-content="Role: Business Analyst"> Sohaib <span class="glyphicon glyphicon-log-out"></span></a></button>
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
<div class="container">
<div class="row">
<div class="col-xs-2"></div>
<div class="col-xs-8">
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Welcome to <br/>Clango Resource Utilization</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
    <cfif IsDefined ("notFound")>
        <cfif Invalid EQ "Yes">
        <h4 align="center"><font color="#Orange">User not Found.  Please Try Again.</font></h4>
        </cfif>    
    </cfif>
<form action="login_check.cfm" method="POST">
    <div class="form-group">

    <label for="user">Username:</label>

    <input type="text" class="form-control" name="user" Required>

  	</div>

    <div class="form-group">

    <label for="id">ID:</label>

    <input type="text" class="form-control" name="id" Required>

  	</div>
 <button type="submit" class="btn btn-primary">Submit</button>
 </form> 
    
    
    
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

  <footer class="pull-left text-muted">
  	<p style="font-size: 10px;">
  		<br /><br /><br /><br /> 
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
  		R2 Solutions has created this web application for the use of Clango, Inc.
  	</p>
  </footer>

</body>
</html>