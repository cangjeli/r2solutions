<cfoutput>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>CRUMAN - EMAIL</title>
	
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
			<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:center;">Send Email</h1><hr/>
		</div>
		<div class="col-xs-2"></div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-2"></div>
		<div class="col-xs-8">
			<div class = "well-sm">
			<!--POSTS EMAIL MESSAGE TO send_email.cfm FOR FURTHER PROCESSING-->
			<form action="send_email.cfm" method="POST">
			<div class="form-group">
				<label for="recipient">Enter recipient's e-mail:</label>
				<input type="text" class="form-control" name="recipient" style="border-radius:0 !important">
			</div>
			<div class="form-group">
				<label for="subject">Subject:</label>
				<input type="text" class="form-control" name="subject" style="border-radius:0 !important">
			</div>
			<div class="form-group">
				<label for="messagetext">Message:</label>
				<input type="text" class="form-control" name="messagetext" style="border-radius:0 !important">
			</div>
				<input type="hidden" id="choice" name="choice" value="message">
				<button type="submit" class="btn btn-primary">Send Message</button>
			</form>
			
			</div>
		</div>
		<div class = "col-xs-2"></div>
	</div>
</div>

<div class="container-fluid">
<hr/>
	<div class="row">
		<div class="col-xs-12">
			<!--FOOTER INCLUDE-------------->
			<cfinclude template="footer.cfm" >
		</div>
	</div>
</div>
</body>
<!--LAST MODIFIED 27 NOV 2018--AUTHOR:MCIA-->
</html>
</cfoutput>
