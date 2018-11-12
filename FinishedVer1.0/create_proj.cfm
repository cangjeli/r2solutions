<cfif GetUserRoles() IS NOT "Admin">
	<cfinclude template="home.cfm" >
	<cfabort>
<cfelse>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Create Project</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Unica+One" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="custom.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<body>

<div class="container-fluid">
	<div class="row">
		<div class="well-sm">
			<div class="col-xs-6">
			<a href="home.cfm"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
				
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
	 <div class="navbar-header">

    </div>
			<ul class="nav navbar-nav navbar-left">
  <li><a href="home.cfm"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">PROJECTS <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="create_proj.cfm">CREATE PROJECT</a></li>
					<li><a href="delete_proj.cfm">DELETE PROJECT</a></li>
					<li><a href="add_emp.cfm">ADD EMPLOYEE</a></li>
					<li><a href="remove_emp.cfm">DELETE EMPLOYEE</a></li>
					<li><a href="edit_hrs.cfm">EDIT HOURS</a></li>	
				</ul>
				</li>
				<li><a href="create_account.cfm">CREATE ACCOUNT</a></li>	
				<li><a href="projectreport.cfm">PROJECT REPORTS</a></li>
				<li><a href="employee_view.cfm">EMPLOYEE VIEW</a></li>
				<li><a href="search_employee.cfm">RESOURCE UTILIZATION</a></li>
				<li><a href="email.cfm">MESSAGES</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="logout.cfm" data-toggle="popover" data-placement="bottom"  title="session variable" data-content="Role: session variable"> 
					<cfoutput>#GetAuthUser()# </cfoutput><span class="glyphicon glyphicon-log-out"></span></a></li>
			</ul>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>

<script>
$(document).ready(function(){
    $('[data-toggle="popover"]').popover();   
});
</script>
				
  </div>
  
</nav>
<div class="container">
<div class="row">
<div class="col-xs-2"></div>
<div class="col-xs-8">
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Create Project</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
            
            
            
            
<cfquery name="managers" datasource="r2d2" >

SELECT emp_name, emp_id, emp_role FROM employee WHERE emp_role = <cfqueryparam value= 'Manager' cfsqltype="CF_SQL_VARCHAR"> 

</cfquery>
    <cfif IsDefined ("error")>
        <cfif error EQ "Yes">
        <h4 align="center"><font color="Orange">Invalid Entry.  Please Try Again.</font></h4>
        <cfelseif error EQ "No">
         <h4 align="center"><font color="Blue"> Project Sucessfully Created.</font></h4>
        </cfif>    
    </cfif>

<cfform action="r2d3.cfm" method="POST">

  <div class="form-group">

    <label for="pName">Project Name:</label>

    <input type="text" class="form-control" name="pName" required>

  </div>

  <div class="form-group">

    <label for="pCC">Charge Code:</label>

    <input type="text" class="form-control" name="pCC" required>

  </div>

  <div class="form-group">

 <label for="Manage">Manager:</label>

<SELECT name="pMang">

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

    
    
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

  <footer class="pull-left text-muted">
  	<p style="font-size: 10px;">
  		<br /><br /><br /><br /> 
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
        <br /><br /><br /><br />
  		R2 Solutions has created this web application for the use of Clango, Inc.
  	</p>
  </footer>

</body>
</html>
</cfif>