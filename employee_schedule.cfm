<!DOCTYPE html>



<!-- 
	
	getting page content
	
	-->

<cfquery datasource="test" name="rsPage">

	select emp_name, emp_role, emp_id
	from employee
    
    where emp_name = '#Form.EmployeeName#'
</cfquery>
    
<cfquery datasource= "test" name="hours">

	Select hours_allocated, actual_hours_worked 
	From employee_util
	Where emp_id = 113

</cfquery>


<html lang="en">
<head>
  <title> Employee Schedule </title>
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
			<a href="emphome.html"><img class="pull-left img-responsive" src="clango-med.png" alt="Clango Logo" ></a></div>
			<div class="col-xs-6">
				<a href="yeet.html"><img class="pull-right img-responsive" src="r2Logo.png" alt="R2 Solutions Logo" ></a>
				
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!--<div class="navbar-header">
			<a href="#">
			</a>
		</div>-->
			<ul class="nav navbar-nav">
  <li><a href="emphome.html"> <span class="glyphicon glyphicon-home"></span></a></li>
				<li><a href="create_proj.html">ADD PROJECT</a></li>
				<li><a href="allprojects.html">ALL PROJECTS</a></li>
				<li><a href="emphome.html">MESSAGES</a></li>
				<li><a href="emphome.html">UTILIZATION</a></li>
				<li><a href="emphome.html">MY PROFILE</a></li>
				<li><a href="projectreport.html">REPORTS</a></li>
			</ul>
			<div class="pull-right container-fluid">
				<button class="pull-right btn btn-md navbar-btn" type="button"><a href="#" data-toggle="popover" data-placement="bottom" title="Sohaib Khan" data-content="Role: Business Analyst"> Sohaib <span class="glyphicon glyphicon-log-out"></span></a></button>
			</div>

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
			<!--<div class="dropdown">
					<button class="pull-right btn btn-lg" type="button">maria
						<span class="glyphicon glyphicon-log-out"></span>
				</div>-->
				
  </div>
  
</nav>
  
<div class="container">
<div class="row">

<div class="col-xs-8">               
                
            <cfoutput query="rsPage">
                
                <h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">#emp_name#</h1>
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

var chart = new CanvasJS.Chart("chartContainer", {
            
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

                                                { y: #actual_hours_worked#, label: "Hours Worked" },

                                                { y: #hours_allocated#, label: "Allocated Hours" },

                                                { y: 160, label: "Total Hours" },

                                ]

                }]

});

chart.render();

 

}    
    </script>
                <div id="chartContainer" style="height: 370px; width: 100%;"></div>
                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>  
                
            </cfoutput>
            <br /><br /><br /><br /> 

                <form action="http://127.0.0.1:59449/admin_view.cfm">
                    <input type="Submit" class="btn btn-primary" name="Find Another Employee" value="Find Another Employee"> 
                </form>
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
        <br /><br />
  		R2 Solutions has created this web application for the use of Clango, Inc.
  	</p>
  </footer>

</body>
</html>