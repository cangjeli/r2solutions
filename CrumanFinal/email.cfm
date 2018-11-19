<cfoutput>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Message</title>
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
Send User E-Mail
</center>

<form action="send_email.cfm" method="POST">
  <div class="form-group">
    <label for="recipient">Enter recipient's e-mail:</label>
    <input type="text" class="form-control" name="recipient">
  </div>
  <div class="form-group">
    <label for="subject">Subject:</label>
    <input type="text" class="form-control" name="subject">
  </div>
  <div class="form-group">
    <label for="messagetext">Message:</label>
    <input type="text" class="form-control" name="messagetext">
  </div>
  <input type="hidden" id="choice" name="choice" value="message">
  <button type="submit" class="btn btn-primary">Send Message</button>
</form>

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
