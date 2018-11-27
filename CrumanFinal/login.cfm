<!---Due to Application.cfc page this page will consistently pop up until the user login.  Along with the home page this would be a good place to put maintenance notice or company news --->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - LOGIN</title>
	
	<!--DESCRIPTION: LOGIN PAGE---------->
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

<body>


<div class="container-fluid">
	<div class="row">
			<div class="col-xs-6">
			<a href="login.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="login.cfm"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
		</div>
	</div>
</div>

<div class="container">
<div class="row">
<div class="col-xs-2"></div>
<div class="col-xs-8">
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Welcome to the <br/>Clango Resource Utilization Manager</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
	<div class="well-sm">
    <cfif IsDefined ("notFound")>
        <cfif notFound EQ "Yes">
         <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#f0ad4e;">Invalid entry. Please try again.</h4>
        </cfif>    
    </cfif>
<form action="login_check.cfm" method="POST">
    <div class="form-group">

    <label for="user">Username:</label>

    <input type="text" class="form-control" name="user" style="border-radius:0! important" Required>

  	</div>

    <div class="form-group">

    <label for="id">Password:</label>

    <input type="text" class="form-control" name="id" style="border-radius:0! important" Required>

  	</div>
 <button type="submit" class="btn btn-primary">Submit</button>
 </form> 
    

   </div> 
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >


</body>
</html>