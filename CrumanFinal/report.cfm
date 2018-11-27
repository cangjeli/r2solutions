<cfif GetUserRoles() IS "Admin" OR GetUserRoles() IS "Manager" >
<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->  

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

<cfquery name="rsPage" datasource="r2d2" >

SELECT project_name, charge_code FROM PROJECT WHERE charge_code = '#Form.code#'

</cfquery>

<cfquery name="teamMo" datasource="r2d2" >

SELECT emp_id, hours_allocated, actual_hours_worked FROM employee_util WHERE charge_code = '#Form.code#'
																		AND month = '#Form.sMonth#' 
																		AND year = '#Form.sYear#'

</cfquery>
<div class="container">
<div class="row">
<div class="col-xs-2"></div>
<div class="col-xs-8">
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Project Report Generator</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
<div class="well-sm">

            <cfoutput query="rsPage">
                
                <h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">#project_name#</h1>
                <p style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify; padding-left: 10px;">#charge_code#</p><hr/>
                
            </cfoutput>

 			<cftable query = "teamMo" htmltable=true colspacing="500" border="true" colheaders="true">
			<cfquery name="teamNa" datasource="r2d2" >

			SELECT emp_name,emp_role FROM employee WHERE emp_id = "#emp_id#"


			</cfquery>

			<cfcol header = "<b>Employee Name</b>" align = "Left" width = 20 text= "#teamNa.emp_name#">
			
			<cfcol header = "<b>Employee Role</b>" align = "Left" width = 20 text= "#teamNa.emp_role#">
 
			<cfcol header = "<b>Hours Allocated</b>"align = "Left" width = 20 text= "#hours_allocated#">
 
			<cfcol header = "<b>Hours Worked</b>" align = "Center" width = 20 text= "#actual_hours_worked#">
</cftable>

    
                    <br /><br />
  </div>
   </div> 
   <br/>   <br/>   <br/>
       
     </div>           
</div>

  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIED 27 NOV 2018 LITERALLY WHAT IS GOING ON WITH THIS FUCKY PAGE-->
</html>
<cfelse>
	<cfinclude template="home.cfm" >
	<cfabort>
</cfif>