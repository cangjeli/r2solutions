<!--HEADER AND NAVBAR PAGE--------------------------------->

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS AN ADMIN --->
<cfif GetUserRoles() IS "Admin">
 
<body><!--HEADER AND NAVBAR PAGE--------------------------------->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - HOME PAGE</title>
	
	<!--DESCRIPTION: SPLASH PAGE FOR USER AFTER LOGIN---------->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--GOOGLE FONTS 'MONTSERRAT' AND 'UNICA ONE' USED--------->
	<link href="https://fonts.googleapis.com/css?family=Montserrat|Unica+One" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<!--CUSTOM CSS ADDED ON TOP OF BOOTSTRAP 3.3.7------------->
	<link rel="stylesheet" href="custom.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS AN ADMIN --->
<cfif GetUserRoles() IS "Admin">
 
<body>

<!--HEADER------------------------------------------------->
<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>	
			</div>
		</div>
	</div>
</div>

<!--NAVBAR------------------------------------------------->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		
		<!--NAVBAR HEADER MIGHT NEED TO BE REMOVED IDK-->
		<div class="navbar-header">
			<a class="navbar-brand" href="home.cfm"><b>CRUMAN</b></a>
		</div>
		
			<ul class="nav navbar-nav navbar-left">
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="create_proj.cfm">CREATE PROJECT</a></li>
						<li><a href="delete_proj.cfm">DELETE PROJECT</a></li>
						<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
						<li><a href="remove_emp.cfm">REMOVE EMPLOYEE</a></li>
						<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
					</ul>
				</li>
				
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ACCOUNTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="create_account.cfm">CREATE ACCOUNT</a></li>
						<li><a href="delete_account.cfm">DELETE ACCOUNT</a></li>
					</ul>
				</li>	
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
				
					<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
					<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>
			
<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->
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
				
  </div>
  
</nav>

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS A MANAGER --->
<cfelseif GetUserRoles() IS "Manager"> 

<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
	<div class="navbar-header">
			<a class="navbar-brand" href="home.cfm"><b>CRUMAN</b></a>
		</div>
			<ul class="nav navbar-nav navbar-left">
				
				<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
						<li><a href="remove_emp.cfm">REMOVE EMPLOYEE</a></li>
						<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
					</ul>
				</li>
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
			
					<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
					<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->		
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
				
  </div>
  
</nav>

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS A 'USER' --->
<cfelseif GetUserRoles() IS NOT "Manager" OR "Admin"> 

<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
			</div>
		</div>
	</div>
</div>

<nav class="navbar navbar-default">
	<div class="container-fluid">
	<div class="navbar-header">
			<a class="navbar-brand" href="home.cfm"><b>CRUMAN</b></a>
		</div>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			<li>
				<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
				<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->
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
				
  </div>
  
</nav>
<!--LAST UPDATED 24 NOV 2018 --AUTHOR: MCIA----->
</cfif>
</html>

<!--HEADER------------------------------------------------->
<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>	
			</div>
		</div>
	</div>
</div>

<!--NAVBAR------------------------------------------------->
<nav class="navbar navbar-default">
	<div class="container-fluid">
	
		<!--NAVBAR HEADER MIGHT NEED TO BE REMOVED IDK-->
		<div class="navbar-header">
		CRUMAN
		</div>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="create_proj.cfm">CREATE PROJECT</a></li>
						<li><a href="delete_proj.cfm">DELETE PROJECT</a></li>
						<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
						<li><a href="remove_emp.cfm">REMOVE EMPLOYEE</a></li>
						<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
					</ul>
				</li>
				
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">ACCOUNTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="create_account.cfm">CREATE ACCOUNT</a></li>
						<li><a href="delete_account.cfm">DELETE ACCOUNT</a></li>
					</ul>
				</li>	
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
				
					<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
					<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>
			
<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->
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
				
  </div>
  
</nav>

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS A MANAGER --->
<cfelseif GetUserRoles() IS "Manager"> 

<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
		CRUMAN
		</div>
			<ul class="nav navbar-nav navbar-left">
				
				<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
						<li><a href="remove_emp.cfm">REMOVE EMPLOYEE</a></li>
						<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
					</ul>
				</li>
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
			
					<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
					<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->		
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
				
  </div>
  
</nav>

<!--- DISPLAYS ALL NAVBAR PAGES IF THE USER IS A 'USER' --->
<cfelseif GetUserRoles() IS NOT "Manager" OR "Admin"> 

<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
			</div>
		</div>
	</div>
</div>

<nav class="navbar navbar-default">
	<div class="container-fluid">
	 <div class="navbar-header">
	CRUMAN
    </div>
			<ul class="nav navbar-nav navbar-left">
				<li><a href="home.cfm"> <span class="glyphicon glyphicon-home">HOME</span></a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
				<li><a href="change_pass.cfm">CHANGE PASSWORD</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			<li>
				<!--GETS USER SESSION VARIABLE AND DISPLAYS TO NAVBAR-->
				<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<!--JS FUNCTION TO POPOVER USERNAME ON NAVBAR AND DISPLAY SESSION INFO-->
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
				
  </div>
  
</nav>
<!--LAST UPDATED 24 NOV 2018 --AUTHOR: MCIA----->
</cfif>
