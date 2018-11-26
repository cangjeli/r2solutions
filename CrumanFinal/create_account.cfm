<cfif GetUserRoles() IS NOT "Admin">
	<cfinclude template="home.cfm" >
	<cfabort>
<cfelse>
<!--- Lines 1-4 are reserved for white list security.  Essentially only admins can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - HOME PAGE</title>
	
	<!--DESCRIPTION: CREATE ACCOUNT PAGE FOR ACCESS BY ADMIN---------->
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
			<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Create Account</h1><hr/>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div> 
<div class="container">
	<div class="row">
		<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<div class = "well-sm">
            
            

    <cfif IsDefined ("error")>
        <cfif error EQ "Yes">
        <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#f0ad4e;">Invalid entry. Please try again.</h4>
        <cfelseif error EQ "No">
         <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#99badd;">Employee assigned.</h4>
        </cfif>    
    </cfif>

<cfform action="r2d3.cfm" method="POST">
  <div class="form-group">

    <label for="uName">Employee's Username:</label>

    <input type="text" class="form-control" name="uName" style="border-radius:0 !important;" required>

  </div>
  <div class="form-group">

    <label for="eName">Employee's Full Name:</label>

    <input type="text" class="form-control" name="eName" style="border-radius:0 !important;" required>

  </div>

  <div class="form-group">

    <label for="eID">Employee ID:</label>

    <input type="text" class="form-control" name="eID" style="border-radius:0 !important;" required>

  </div>
  

    <div class="form-group">

    <label for="role">Role:</label>

  <select name="roll">
    <option value="Admin">Admin</option>
    <option value="Manager">Project Manager</option>
    <option value="Developer">Developer</option>
    <option value="Data_Analyst">Data Analyst</option>
    <option value="Business_Analyst">BusinessAnalyst</option>
    <option value="Security">Security</option>
    <option value="System_Analyst">System Analyst</option>
    <option value="General_User">General User</option>
  </select>


  </div>
  <div class="form-group">

    <label for="eID">Password:</label>

    <input type="text" class="form-control" name="pWssAord" style="border-radius:0 !important;" required>

  </div>

  
 <input name="action" type="hidden" value="createAcc" style="border-radius:0 !important;"> 

<button type="submit" class="btn btn-primary">Submit</button>

</cfform>

    
</div><!--well end--> 
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIED 25 NOV 2018--AUTHOR: MCIA-->
</html>
</cfif>