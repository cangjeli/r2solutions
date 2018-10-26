<cfset fun = '#Form.choice#'>

<cfif fun eq "create">
<cfquery name="Projects" datasource="r2d2">
  INSERT INTO Projects
  VALUES ('#Form.pMang#','#Form.pCC#','#Form.pName#')
</cfquery>

<cfquery datasource="r2d2" name="check">
select *
from Projects
</cfquery>
<cfoutput query="check">
 #pMang#<br />
</cfoutput>


<cfelseif fun eq "message">
<cfmail to="#Form.mail2#"
	from=""
	subject="#Form.subject#"
	type="text">
	#Form.message#
</cfmail>
<cfoutput>
    <p>
    We have just sent you an email.</p>
</cfoutput>
</cfif>