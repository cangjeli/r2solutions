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
	<title>CRUMAN - ADD EMPLOYEE</title>
	
	<!--DESCRIPTION: PAGE FOR CREATING NEW PROJECTS -- ADMIN ONLY PAGE---------->
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
				<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Create Project</h1><hr/>
			</div>
			<div class="col-xs-2"></div>
	</div>
</div> 
<div class="container">
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div class = "well-sm">
			
<!--- Below on lines 100 to 104 are our queries for our dropdown menu.  <cfqueryparam> is placed to
 	   prevent SQL injection --->                       
<cfquery name="managers" datasource="r2d2" >
	SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role = <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR"> 
</cfquery>
<!--- Below on lines 106 to 115 is a generalize message system.  Custom messages are possible 
  		as well as responses.  For now we will use a general valid/invalid system.
  		utilizing the return function on R2D3.cfm page and adding a new custom <cfelseif> allow
  		for a great number of response. --->  
<cfif IsDefined ("error")>
	<cfif error EQ "Yes">
		<h4 align="center"><font color="Orange">Invalid Entry.  Please Try Again.</font></h4>
    <cfelseif error EQ "No">
        <h4 align="center"><font color="Blue"> Project Sucessfully Created.</font></h4>
    </cfif>    
</cfif>

<!--THE FORM BELOW POSTS TO THE DB WHEN CREATING A NEW PROJECT-->
<cfform action="r2d3.cfm" method="POST">

	<div class="form-group">	
		<label for="pName">Project Name:</label>
			<input type="text" class="form-control" name="pName" style="border-radius:0 !important;" required>
	</div>
	<div class="form-group">
		<label for="pCC">Charge Code:</label>
			<input type="text" class="form-control" name="pCC" style="border-radius:0 !important;" required>
	</div>
	<div class="form-group">
		<label for="Manage">Manager:</label>
			<SELECT name="pMang">
			
				<!--THIS QUERY DISPLAYS THE MANAGERS LISTED IN THE DB-->
				<CFOUTPUT QUERY="managers">
					<OPTION value="#managers.emp_id#">#managers.emp_name# - #managers.emp_id# </OPTION>
				</CFOUTPUT>
			</SELECT>
  </div>
  <div class="form-group">
	<label for="sDate">Start Date:</label>
		<select name="sMonth">
			<option value="01">January</option>
			<option value="02">Feburary</option>
			<option value="03">March</option>
			<option value="04">April</option>
			<option value="05">May</option>
			<option value="06">June</option>
			<option value="07">July</option>
			<option value="08">August</option>
			<option value="09">September</option>
			<option value="10">October</option>
			<option value="11">November</option>
			<option value="12">December</option>
	</select>
	<select name="sYear">
		
		<!--THIS STATEMENT PUTS CONSTRAINTS ON THE YEAR THAT CAN BE CHOSEN-->
		<cfloop from="2000" to="2050" index="i">
			<cfoutput>
				<option value="#i#">#i#</option>
            </cfoutput>
        </cfloop>
    </select>
	</div>
    <div class="form-group">
		<label for="eDate">End Date:</label>
			<select name="eMonth">
				<option value="01">January</option>
				<option value="02">Feburary</option>
				<option value="03">March</option>
				<option value="04">April</option>
				<option value="05">May</option>
				<option value="06">June</option>
				<option value="07">July</option>
				<option value="08">August</option>
				<option value="09">September</option>
				<option value="10">October</option>
				<option value="11">November</option>
				<option value="12">December</option>
			</select>
	<select name="eYear">
	
		<!--THIS STATEMENT PUTS CONSTRAINTS ON THE YEAR THAT CAN BE CHOSEN-->
		<cfloop from="2000" to="2050" index="i">
			<cfoutput>
				<option value="#i#">#i#</option>
            </cfoutput>
		</cfloop>
    </select>
	</div>
	<input name="action" type="hidden" value="create"> 
		<button type="submit" class="btn btn-primary">Submit</button>
</cfform> 
				</div><!--WELL END-->
			</div>
			<div class="col-xs-2"></div>
		</div>
	</div>
	
<!--INCLUDE FOR THE FOOTER------------------->
<cfinclude template="footer.cfm" >
</body>
<!--LAST MODIFIED 27 NOV 2018--AUTHOR: MCIA-->
</html>
</cfif>