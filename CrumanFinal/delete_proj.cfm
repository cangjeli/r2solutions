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
	<title>CRUMAN - DELETE PROJECT</title>
	
	<!--DESCRIPTION: DELETE PROJECT PAGE---------->
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
			<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Delete Project</h1><hr/>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div> 
<div class="container">
	<div class="row">
		<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<div class="well-sm">
<!--- Below on lines 97 to 107 are our queries for our dropdown menu.  <cfqueryparam> is placed to
 	   prevent SQL injection --->                 
            <cfquery name="projD" datasource="r2d2" >
				SELECT * FROM PROJECT	
			</cfquery>                       
			
			<cfquery name="managers" datasource="r2d2" >
			SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role = <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
    
			<cfif IsDefined ("error")>
				<cfif error EQ "Yes">
					 <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#f0ad4e;">Invalid entry. Please try again.</h4>
				<cfelseif error EQ "No">
					 <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#99badd;">Project deleted.</h4>
				</cfif>    
			</cfif>

<!--POSTS ENTRY TO DATABASE TO DELETE PROJECT SELECTED-->
<cfform action="r2d3.cfm" method="POST">
  <!--- During testing we did not have the dropdown list with all the projects.  
      Resulting in a lot of back and forth.  So the dropdown was placed.  It's value is not used
      but provides a good overview of all recorded projects that is more visually adaptable than
      a table --->
	<div class="form-group">
		<label for="Manage">List of Projects Reference:</label>
			<SELECT name="ref">
				<CFOUTPUT QUERY="projD">
					<OPTION value="ref">#projD.project_name# - #projD.charge_code# | Manager: #projD.manager#  | Start Date: #projD.start_month#/#projD.start_year# |   End Date: #projD.end_month#/#projD.end_year# </OPTION>
				</CFOUTPUT>
						<br/>
			</SELECT>
</div>
	<div class="form-group">
		<label for="pCC">Charge Code:</label>
			<input type="text" class="form-control" name="pCC" style="border-radius:0 !important;" required>
	</div>

	<input name="action" type="hidden" value="delete"> 
	<button type="submit" class="btn btn-primary">Submit</button>
</cfform>
  
			</div><!--well end-->  
		</div>
  <div class="col-xs-2"></div>
</div>
</div>
  
<!--INCLUDE FOR THE FOOTER------------------------->
<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIED 27 NOV 2018--AUTHOR: MCIA--

i may have messed this one up a little ------>
</html>
</cfif>