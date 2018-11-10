<cflogin >


	<cfif GetAuthUser() IS "">
		<cfset counter = 0>
	<cfelse> 
		<cfset counter = 3>
	</cfif>
	
	<cfif NOT (IsDefined ("Form.user") AND IsDefined ("Form.id")) AND 3>
        <cfinclude template="login.cfm">
        <cfabort>
    <!--- Cfif ensures that the user logged in and when this page is recalled by Application.cfc it won't double include --->    
    <cfelse>
        <!--- Query searches for exactly one matach --->
            <CFQUERY NAME="login" DATASOURCE=r2d2>
            SELECT      emp_name,emp_id,emp_role
            FROM         employee
            WHERE        (emp_name = <cfqueryparam value="#Form.user#" cfsqltype="CF_SQL_VARCHAR"> 
                        AND emp_id = <cfqueryparam value="#Form.id#" cfsqltype="CF_SQL_VARCHAR">)
            </CFQUERY>
		<!--- If there is a match then the RecordCount equals 1 --->
        <cfif login.RecordCount EQ '1'>
            <cfloginuser name="#login.emp_name#" password="#Form.id#" roles="User">
<!--- IF there WAS NOT a matching record, an "Invalid Login" message is shown and the user is prompted to login again. --->     
        <cfelse>
            <!--- Creates the Variable "Invalid" to instruct Login page to display "Invalid Login" Message. --->
            <cfset notFound = "Yes">
            <cfinclude template="login.cfm">
            <cfabort>
        </cfif>        
    </cfif>    
</cflogin>

<!--- These SET statements take the values in the <cflogin> tag's "Name" attribute and seperates them into two seperate variables (EmployeeID and EmployeeName) to be used throughout the application.  These variables exist as long as the login session exists. --->
<cfset EmployeeName = GetAuthUser()>
<cfinclude template="index.cfm">

