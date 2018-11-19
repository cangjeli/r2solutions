<!---Due to Application.cfc page this page will consistently pop up until the user login.  Along with the home page this would be a good place to put maintenance notice or company news --->
<!DOCTYPE html>
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
			<a href="login.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="login.cfm"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
				
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
	 <div class="navbar-header">

    </div>



				
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
        <cfif notFound EQ "Yes">
        <h4 align="center"><font color="Orange">Invalid Entry.  Please Try Again.</font></h4>
        </cfif>    
    </cfif>
<form action="login_check.cfm" method="POST">
    <div class="form-group">

    <label for="user">Username:</label>

    <input type="text" class="form-control" name="user" Required>

  	</div>

    <div class="form-group">

    <label for="id">Password:</label>

    <input type="text" class="form-control" name="id" Required>

  	</div>
 <button type="submit" class="btn btn-primary">Submit</button>
 </form> 
    

    
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >


</body>
</html>