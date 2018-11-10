<cfcomponent >

    <cfset THIS.Name = "ClangoCruR2" />
    <cfset THIS.Datasource = "employee" />
    <cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 2, 0, 0 ) />
    <cfset THIS.SessionManagement = true />
    <cfset THIS.SessionTimeout = CreateTimeSpan( 0, 0, 30, 0 ) />
 
 <cffunction name="onApplicationStart" access="public" returntype="void" output="false">
	<cfreturn true>
 </cffunction>	

 <cffunction name="onSessionStart" access="public" returntype="void" output="false">

 </cffunction>	

<cffunction name="OnRequestStart"> 
<cfif GetAuthUser() IS "">
	<cfset counter = 0>
<cfelse> 
	<cfset counter = 3>
</cfif>
<cfloop condition = "counter LESS THAN 1">
	<cfif counter IS 0>
		<cfinclude template="login_check.cfm" >
	</cfif>
	<cfset counter = 3>
</cfloop>


	

 </cffunction>



</cfcomponent>
