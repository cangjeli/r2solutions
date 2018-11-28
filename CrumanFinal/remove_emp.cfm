<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
<!--- Lines 1-4 are reserved for white list security.  Essentially only admins can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Remove Employee</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Unica+One" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>
<cfinclude template="header.cfm" >
<div class="container">
<div class="row">
<div class="col-xs-2"></div>
<div class="col-xs-8">
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Remove Employee from Project</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
<div class="well-sm">
 <!--- Below on lines 98 to 114 are our queries for our dropdown menu.  <cfqueryparam> is placed to
 	   prevent SQL injection --->              
            
<cfquery name="projD" datasource="r2d2" >

SELECT * FROM employee_util

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
       	 <h4 align="center" style="font-family:'Montserrat', sans-serif; font-weight:lighter; color:#99badd;">Employee removed.</h4>
        </cfif>    
    </cfif>

<cfform action="r2d3.cfm" method="POST">
  <!--- For user's convenience to prevent employee having look up project identifications--->
  <div class="form-group">

 <label for="Manage">List of Projects Reference:</label>

<SELECT name="ref">

  <CFOUTPUT QUERY="projD">

    <OPTION value="ref">Project Code: #projD.charge_code# | Employee ID: #projD.emp_ID# | Month and Year: #projD.month#/#projD.year# </OPTION>

  </CFOUTPUT>

<br/>

</SELECT>
</div>
  <div class="form-group">

 <label for="projD">Project Charge Code:</label>

<SELECT name="pMang">

  <CFOUTPUT QUERY="projD">

    <OPTION value="#projD.charge_code#">#projD.charge_code# </OPTION>

  </CFOUTPUT>

</SELECT>

  </div>
  <div class="form-group">

 <label for="Employee">Employee ID:</label>

<SELECT name="pEmp">

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

            <cfloop from="2000" to="2050" index="i">

                <cfoutput>

                    <option value="#i#">#i#</option>

                </cfoutput>

            </cfloop>

    </select>

  </div>
  
  
 <input name="action" type="hidden" value="remove"> 

<button type="submit" class="btn btn-primary">Submit</button>

</cfform>

    
  </div>  
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >

</body>
</html>
<cfelse>

	<cfinclude template="home.cfm" >
	<cfabort>
</cfif>