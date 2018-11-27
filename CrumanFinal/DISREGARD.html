<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
<!--- Lines 1 are reserved for white list security.  Essentially only admins or managers can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - EDIT HOURS</title>
	
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
			<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Edit Project Hours</h1><hr/>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div> 
<div class="container">
	<div class="row">
		<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<div class = "well-sm">
            
<cfquery name="projD" datasource="r2d2" >

SELECT * FROM employee_util

</cfquery>

<cfquery name="projC" datasource="r2d2" >

SELECT charge_code FROM PROJECT

</cfquery>                 
            
<cfquery name="managers" datasource="r2d2" >

SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role = <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR">

</cfquery>

<cfquery name="employees" datasource="r2d2" >

SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role <> <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR"> OR <cfqueryparam value= 'Admin' cfsqltype="CF_SQL_VARCHAR">  

</cfquery>      
    <cfif IsDefined ("error")>
        <cfif error EQ "Yes">
         <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#f0ad4e;">Invalid entry. Please try again.</h4>
        <cfelseif error EQ "No">
         <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#99badd;">Employee's hours have been updated.</h4>
        </cfif>    
    </cfif>

<cfform action="r2d3.cfm" method="POST">
  <!--- For user's convenience to prevent employee having look up project identifications--->
	<div class="form-group">
		<label for="Manage">List of Projects Reference:</label>
		<SELECT name="ref">
		<!--pulls projects by charge code, employee id, and project month/year-->
		<CFOUTPUT QUERY="projD">
			<OPTION value="ref">Project Code: #projD.charge_code# | Employee ID: #projD.emp_ID# | Month and Year: #projD.month#/#projD.year# </OPTION>
		</CFOUTPUT>
<br/>
		</SELECT>
	</div>
	<div class="form-group">
		<label for="projD">Project Charge Code:</label>
			<SELECT name="pMang">
				<!--pulls projects by charge code---------->
				<CFOUTPUT QUERY="projC">
					<OPTION value="#projC.charge_code#">#projC.charge_code# </OPTION>
				</CFOUTPUT>
			</SELECT>
	</div>
	<div class="form-group">
	<label for="Employee">Employee ID:</label>
		<SELECT name="pEmp">
			<!--pulls list of employees-------------------->
			<CFOUTPUT QUERY="employees">
				<OPTION value="#employees.emp_id#">#employees.emp_name# - #employees.emp_id# | #employees.emp_role# </OPTION>
			</CFOUTPUT>
		</SELECT>
	</div>
    <div class="form-group">
		<label for="sDate">Month & Year:</label>
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
				<!--year constraints-->
				<cfloop from="2000" to="2050" index="i">
					<cfoutput>
						<option value="#i#">#i#</option>
					</cfoutput>
				</cfloop>
			</select>
	</div>
	<div class="form-group">
		<label for="pName">Hours Allocated:</label>
			<input type="text" class="form-control" name="aHours" style="border-radius: 0 !important" required>
	</div> 
    <div class="form-group">
		<label for="pName">Actual Hours Worked:</label>
		<input type="text" class="form-control" name="wHours" style="border-radius: 0 !important" required>
	</div> 
		<input name="action" type="hidden" value="edit"> 
		<button type="submit" class="btn btn-primary">Submit</button>
</cfform>
			</div><!--well end--> 
		</div>
		<div class="col-xs-2"></div>
  </div>
</div>
  
<!--INCLUDE FOR FOOTER-->
<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIFED 27 NOV 2018--AUTHOR: MCIA-->
</html>
<!--REDIRECTS TO HOME PAGE IF USER DOES NOT HAVE PRIVILEGES TO ACCESS THIS PAGE-->
<cfelse>
	<cfinclude template="home.cfm" >
	<cfabort>
</cfif>