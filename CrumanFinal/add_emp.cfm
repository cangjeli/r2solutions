<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
	<!--- Lines 1 is reserved for white list security.  Essentially only admins and managers can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Add Employee</title>
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
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Assign Employee to Project</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
 <!--- Below on lines 96 to 106 are our queries for our dropdown menu.  <cfqueryparam> is placed to
 	   prevent SQL injection --->           
<cfquery name="projD" datasource="r2d2" >

SELECT * FROM PROJECT

</cfquery>

<cfquery name="employees" datasource="r2d2" >

SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role <> <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR"> AND emp_role <> <cfqueryparam value= 'Admin' cfsqltype="CF_SQL_VARCHAR">  

</cfquery>           
  <!--- Below on lines 111 to 117 is a generalize message system.  Custom messages are possible 
  		as well as reponses.  For now we will use a general valid/invalid system.
  		utilizing the return function on R2D3.cfm page and adding a new custom <cfelseif> allow
  		for a great number of response. --->              

    <cfif IsDefined ("error")>
        <cfif error EQ "Yes">
        <h4 align="center"><font color="Orange">Invalid Entry.  Please Try Again.</font></h4>
        <cfelseif error EQ "No">
         <h4 align="center"><font color="Blue"> Employee Assigned.</font></h4>
        </cfif>    
    </cfif>

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

    <label for="pName">Hours Allocated:</label>

    <input type="text" class="form-control" name="aHours" required>

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
    <br/>
     <br/>
  
 <input name="action" type="hidden" value="assign"> 

<button type="submit" class="btn btn-primary">Submit</button>

</cfform>
<!--- A majority of the form are dropdown menus to prevent SQL injection.  Since ColdFusion is a server side language even if a hacker tries to submit form data with the same variables it will not work due to the constraints of the dropdown menu and login feature.
    --->
    
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