<cfoutput>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Message Sent</title>
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
  
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-6">
		</div>
    <div class="col-xs-6">
	

	</div>
		</div>
			</div>
<div class="container-fluid">
<div class="row">
<div class="col-xs-12">

<center>
User E-Mail Sent
</center>

<cfmail 
to="#Form.recipient#"
from="r2solutionsGMU@gmail.com" 
subject="#Form.subject#">
#Form.messagetext# 

This is an e-mail sent out by CRUMAN, developed by R2 Solutions

</cfmail>

<cfoutput>
    <p>Your e-mail has been sent. Be aware that refreshing this page will send out duplicate e-mails.</p>
</cfoutput>

<div class="container-fluid">
<hr/>
	<div class="row">
		<div class="col-xs-12">
		
			<cfinclude template="footer.cfm" >

		</div>
	</div>
</div>
  
    
    
  </div>
</div>
</div>

</body>
</html>
</cfoutput>