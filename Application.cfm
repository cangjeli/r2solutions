<cfapplication name="AppName" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0, 0, 30, 0)# ">
<!--- Includes the login template to verify logins for every page. --->
<cfinclude template="login_action.cfm">