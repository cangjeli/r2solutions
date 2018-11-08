<form action="<cfoutput>#FormAction#</cfoutput>" method="post">
    <!--- IF the variable "Invalid" is defined, the login provided was invalid and an error is show. --->
    <cfif IsDefined ("Invalid")>
        <cfif Invalid EQ "Yes">
        <h4 align="center"><font color="#FF0000">Invalid Login.  Please Try Again.</font></h4>
        </cfif>    
    </cfif>
    
        <table>
        <tr>
            <td>Username:</td>
            <td><input type="text" name="UserName" size="10"></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="Password" size="10"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="&nbsp;&nbsp;Login&nbsp;&nbsp;"></td>
        </tr>
        </table>
    </form>