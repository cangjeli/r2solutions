
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Change Password</title>
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
<h1 style="font-family:'Montserrat', sans-serif; font-weight:lighter; text-align:justify;">Change Password</h1><hr/>

</div>
<div class="col-xs-2"></div>
</div>
</div> 
<div class="container">
<div class="row">

<div class="col-xs-2"></div>
<div class="col-xs-8">
            
            
            
            

    <cfif IsDefined ("error")>
        <cfif error EQ "Yes">
        <h4 align="center"><font color="Orange">Invalid Entry.  Please Try Again.</font></h4>
        <cfelseif error EQ "No">
         <h4 align="center"><font color="Blue"> Password Changed.</font></h4>
        </cfif>    
    </cfif>

<cfform action="r2d3.cfm" method="POST">

 <div class="form-group">

    <label for="eID">Old Password:</label>

    <input type="text" class="form-control" name="oldPass" required>

  </div>

  <div class="form-group">

    <label for="eID">New Password:</label>

    <input type="text" class="form-control" name="password" required>

  </div>
  

 <input name="action" type="hidden" value="changeP"> 

<button type="submit" class="btn btn-primary">Submit</button>

</cfform>

    
    
</div>
  <div class="col-xs-2"></div>
  </div>
  
  </div>
  

<cfinclude template="footer.cfm" >

</body>
</html>
