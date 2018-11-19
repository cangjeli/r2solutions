<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
<!--- Lines 1 are reserved for white list security.  Essentially only admins or managers can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->

<cfquery datasource="r2d2" name="emp_names">
  select emp_name
  from employee
</cfquery>

<html lang="en">

<head>
  <title>Search Employees</title>
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
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Find Employee</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
            
            
            
            <cfform action="employee_schedule.cfm" method="post"> 
                <p>  <div class="form-group">
                    <label for="EmployeeName">Name:</label>
                        <cfselect class="form-control" name="EmployeeName"> 
                        <cfoutput query="emp_names">
                          <option value="#emp_names.emp_name#">#emp_names.emp_name#</option>
                        </cfoutput>
                    </cfselect> 
                </div></p> 
                
            <!-- submit button --> 
            <div style="text-align:center;">
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
            <cfinput type="Submit"  class="btn btn-primary" name="SubmitForm" value="Search"> 
            </div>    
            </cfform>      
                
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