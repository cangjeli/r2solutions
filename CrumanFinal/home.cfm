<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - HOME PAGE</title>
	
	<!--DESCRIPTION: SPLASH PAGE FOR USER AFTER LOGIN---------->
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

<div class = "container-fluid">
	<div class = "row">
	<div class = "col-xs-2"></div>
		<div class = "col-xs-8">
			<div class = "well-sm text-center">
				<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter;">
				CRUMAN
				</h1> 
					
				<h3>
					<i>/ˈkro͞omən/</i> 
				</h3>
					
				<h4 style="font-family:'Montserrat', sans-serif; font-weight:lighter;">
					<i>noun</i>
						<br/>		
							1. <b>C</b>lango <b>R</b>esource <b>U</b>tilization <b>Man</b>ager, a web application designed by R2 Solutions:
				</h4>
					<p style="font-family:'Montserrat', sans-serif; font-weight:lighter; color: #939393">"The administrators, managers, and employees of Clango, Inc. use the CRUMAN app to create projects, organize them, and assign resources to them to maximize resource utilization."
					</p>  
				<img class="img-responsive center-block" src="cruman.png" alt="CRUMAN" > 
			</div>
		</div>
		<div class = "col-xs-2"></div>
	</div>	
</div>

<!--INCLUDE FOR THE FOOTER---------------------->
<cfinclude template="footer.cfm" >

</body>
<!--LAST UPDATED 24 NOV 2018--AUTHOR: MCIA------>
</html>