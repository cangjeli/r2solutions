<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
<!--- Lines 1 are reserved for white list security.  Essentially only admins or managers can access this page
	  even if someone were to reach this page from within the network if they aren't logged in
	  with an Admin account it would send the user back to the home screen and stop parsing
	  protecting the code --->
<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->

<cfquery name="projD" datasource="r2d2" >

SELECT * FROM PROJECT

</cfquery>

<cfquery name="employees" datasource="r2d2" >

SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role <> <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR"> OR <cfqueryparam value= 'Admin' cfsqltype="CF_SQL_VARCHAR">  

</cfquery>      

<html lang="en">

<head>
  <title>Project Report</title>
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
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Project Report Generator</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
<div class = "col-xs-1">

            
            <cfform action="report.cfm" method="post"> 

              </div>  

            <div style="text-align:right;">
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
   </div> 
   <br/>   <br/>   <br/>
     <div class="form-group">

 <label for="Manage">Project ID and Manager:</label>

<SELECT name="code">

  <CFOUTPUT QUERY="projD">

    <OPTION value="#projD.charge_code#">#projD.project_name# - #projD.charge_code# | Manager: #projD.manager#</OPTION>

  </CFOUTPUT>

<br/>

</SELECT>
</div>
   <div style="text-align:right;">
           
              <br/>
            <cfinput type="Submit"  class="btn btn-primary" name="current" value="Generate"> 
              
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