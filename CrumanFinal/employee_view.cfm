



<!-- 
	
	getting page content
	
	-->

<cfquery datasource="r2d2" name="rsPage">

	select emp_name, emp_role, emp_id
	from employee
    
    where emp_name = '#GetAuthUser()#'
    				

</cfquery>

<cfparam name="Form.selection" default="no" >
<cfparam name="Form.sMonth" default= #month(now())# >
<cfparam name="Form.sYear" default= #Year(now())# >																																																																							

<cfif Form.selection = "yes">
<cfquery datasource= "r2d2" name="hours">

	select hours_allocated, actual_hours_worked, charge_code
	from employee_util
	where emp_id = #rsPage.emp_id# AND
		  month = '#Form.sMonth#' AND
		  year = '#Form.sYear#'

</cfquery>


</cfif>


<cfset allocated = valueList(hours.hours_allocated) />



<cfset allocatedArray = listToArray(allocated) />

<cfset allocated = #numberFormat(arraySum(allocatedArray))# />



<cfset worked = valueList(hours.actual_hours_worked) />

<cfset workedArray = listToArray(worked) />

<cfset worked = #numberFormat(arraySum(workedArray))# />

<!--
    Query to get project name for each individual employee
-->

<cfquery datasource="r2d2" name="project_names">
  select project_name
  from project
  where charge_code = <cfqueryparam value= #hours.charge_code# cfsqltype="CF_SQL_VARCHAR">
</cfquery>

<cfset names = valueList(project_names.project_name) />

<cfset allNames = listToArray(names) />

<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - EMPLOYEE VIEW</title>
	
	<!--DESCRIPTION: EMPLOYEE VIEW PAGE---------->
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
                <div class="well-sm">
				<!--pulls all data pertaining to employee by their employee id-->
            <cfoutput query="rsPage">
                
                <h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">#emp_name#</h1>
                <p style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify; padding-left: 10px;">#emp_role#</p><hr/>
                
            </cfoutput>

            <cfoutput query="hours">

            <script>

                window.onload = function () {
                    
                CanvasJS.addColorSet("greenBlueRed",
                    [//colorSet Array

                        "red",
                        "blue",
                        "green"                
                    ]);               

                var chart1 = new CanvasJS.Chart("chartContainer1", {
            
                        animationEnabled: true,

                        colorSet: "greenBlueRed",

                        title:{

                                        text:"Employee Schedule"

                        },

                        axisX:{

                                        interval: 1

                        },

                        axisY2:{

                                        interlacedColor: "rgba(255,165,0,.3)",

                                        gridColor: "rgba(1,77,101,.1)",

                                        title: "Project Hours"

                        },

                        data: [{

                                        type: "bar",

                                        name: "hours",

                                        axisYType: "secondary",

                                        dataPoints: [

                                                        { y: #worked#, label: "Hours Worked"},

                                                        { y: #allocated#, label: "Allocated Hours" },

                                                        { y: 160, label: "Total Hours" },

                                                    ]

                        }]
                        
                });
                    
                    chart1.render();
                }    
                
            </script>
                
                    <div id="chartContainer1" style="height: 370px; width: 100%;"></div>
                    <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  

            </cfoutput>

<br/>
<!--Change view of previously scheduled hours-->

  <cfform action="employee_view.cfm" method="POST">
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
  <cfinput name="selection" type=hidden value=yes/>
 <button type="submit" class="btn btn-primary">Submit</button>
 </cfform> 
 </div>
</div>

<div class="col-xs-2"></div>

</div>
  </div>
  
<!--FOOTER INCLUDE---------------------------------->
<cfinclude template="footer.cfm" >

</body>
<!--LAST MODIFIED 27 NOV 2018--AUTHOR:MCIA---------->
</html>
