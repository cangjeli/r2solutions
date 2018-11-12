<cfif GetUserRoles() IS NOT "Admin">
	<cflocation url="http://127.0.0.1:50481/TestingApp/home.cfm" >
	<cfabort>
<cfelse>
<cfset fun = #Form.action#>

<cfoutput >

<cfif fun eq "create">
	<cfif #Form.sYear# LTE #Form.eYear#>
			<cfif #Form.sMonth# LTE #Form.eMonth#>
				<cfquery name="Projects" datasource="r2d2">
  					INSERT INTO PROJECT
  					VALUES ('#Form.pName#','#Form.pCC#','#Form.pMang#','#Form.sMonth#','#Form.sYear#','#Form.eMonth#','#Form.eYear#')
				</cfquery>
				<cfset error = "No">
            	<cfinclude template="create_proj.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="create_proj.cfm">
           		 <cfabort>
			</cfif>	

	<cfelse>
		<cfset error = "Yes">
           <cfinclude template="create_proj.cfm">
           	<cfabort>	
	</cfif>

	

<cfelseif fun eq "delete">
		<cfquery name="projD" datasource="r2d2" >

		SELECT charge_code FROM PROJECT WHERE charge_code = <cfqueryparam value="#Form.pCC#" cfsqltype="CF_SQL_VARCHAR">

		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				DELETE FROM PROJECT
  				WHERE charge_code = <cfqueryparam value="#Form.pCC#" cfsqltype="CF_SQL_VARCHAR">
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="delete_proj.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="delete_proj.cfm">
           		 <cfabort>	
		</cfif>


<cfelseif fun eq "assign">
		<cfquery name="projD" datasource="r2d2" >

		SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '0'>	
				<cfquery name="Projects" datasource="r2d2">
  					INSERT INTO employee_util
  					VALUES ('#Form.pMang#','#Form.pEmp#','#Form.aHours#', '0', '#Form.sMonth#','#Form.sYear#')
				</cfquery>
				<cfset error = "No">
            	<cfinclude template="add_emp.cfm">
           		 <cfabort>	
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="add_emp.cfm">
           		 <cfabort>	
		</cfif>
		
<cfelseif fun eq "remove">
		<cfquery name="projD" datasource="r2d2" >

				SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				DELETE FROM employee_util
  				WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR">
				AND 
				emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="remove_emp.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="remove_emp.cfm">
           		 <cfabort>	
		</cfif>
<cfelseif fun eq "edit">
		<cfquery name="projD" datasource="r2d2" >

				SELECT charge_code FROM employee_util WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
														AND 
														year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 
		</cfquery>    
		
		<cfif projD.RecordCount EQ '1'>	
			<cfquery name="Projects" datasource="r2d2">
  				UPDATE employee_util
  				SET hours_allocated = '#Form.aHours#', actual_hours_worked = '#Form.wHours#'
  				WHERE charge_code = <cfqueryparam value="#Form.pMang#" cfsqltype="CF_SQL_VARCHAR">
				AND 
				emp_id = <cfqueryparam value="#Form.pEmp#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				month = <cfqueryparam value="#Form.sMonth#" cfsqltype="CF_SQL_VARCHAR"> 
				AND 
				year = <cfqueryparam value="#Form.sYear#" cfsqltype="CF_SQL_VARCHAR"> 			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="edit_hrs.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="edit_hrs.cfm">
           		 <cfabort>	
		</cfif>	
<cfelseif fun eq "createAcc">
		<cfquery name="projD" datasource="r2d2" >

				SELECT username,emp_id FROM employee WHERE emp_id = <cfqueryparam value="#Form.eID#" cfsqltype="CF_SQL_VARCHAR"> AND username = <cfqueryparam value="#Form.uName#" cfsqltype="CF_SQL_VARCHAR"> 
												     
		</cfquery>    
		
		<cfif projD.RecordCount EQ '0'>	
			<cfquery name="Projects" datasource="r2d2">
					INSERT INTO employee
  					VALUES ('#Form.uName#','#Form.eName#','#Form.eID#','#Form.roll#','#Form.pWssAord#')			
			</cfquery>
				<cfset error = "No">
            	<cfinclude template="create_account.cfm">
			<cfelse>
			  	<cfset error = "Yes">
            	<cfinclude template="create_account.cfm">
           		 <cfabort>	
		</cfif>						
</cfif>

</cfoutput>
</cfif>
