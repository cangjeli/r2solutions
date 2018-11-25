
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - HOME PAGE</title>
	
	<!--DESCRIPTION: CHANGE PASSWORD PAGE---------->
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

	<!--INCLUDE FOR THE HEADER AND NAVBAR------------------------>
	<cfinclude template="header.cfm" >
	
<div class="container">
	<div class="row">
		<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Change Password</h1><hr/>
			</div>
			<div class="col-xs-2"></div>
	</div>
</div> 
<div class="container">
	<div class="row">
	
	<div class="well-sm">

		<div class="col-xs-2"></div>
			<div class="col-xs-8">

				<cfif IsDefined ("error")>
				<!--If there is an error in form entry, this is displayed-->
					<cfif error EQ "Yes">
						<h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#f0ad4e;">Invalid entry. Please try again.</h4>
					<!--If there is no error in form entry, password is accepted, salted, and hashed into the database-->
					<cfelseif error EQ "No">
						<h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#99badd;">Password accepted.</h4>
					</cfif>    
				</cfif>

				<cfform action="r2d3.cfm" method="POST">

	<div class="form-group">	
		<label for="eID">Old Password:</label>	
			<input type="text" class="form-control" name="oldPass" required>
	</div>
	
	<div class="form-group">
		<label for="eID">New Password:</label>
			<input type="text" class="form-control" name="password" required>
	</div>
  
	<input name="action" type="hidden" value="changeP"> 

	<button type="submit" class="btn btn-primary">Submit</button>

				</cfform>

    
    
		</div>
	<div class="col-xs-2"></div>
	</div><!--end well-->
</div>
</div>
  

<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIED 24 NOV 2018--AUTHOR: MCIA-->
</html>
