<%-- 
    Document   : contact
    Created on : 4 Jun, 2020, 6:14:07 PM
    Author     : KANISHK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<html>    
<head>    
    <title>Spring Tiles Contact Form</title>    
</head>    
<body>    
<h2>Contact Manager</h2>    
<form:form method="post" action="addContact.html">    
    
    <table>    
    <tr>    
        <td><form:label path="firstname">First Name</form:label></td>    
        <td><form:input path="firstname" /></td>     
    </tr>    
    <tr>    
        <td><form:label path="lastname">Last Name</form:label></td>    
        <td><form:input path="lastname" /></td>    
    </tr>    
    <tr>    
        <td><form:label path="lastname">Email</form:label></td>    
        <td><form:input path="email" /></td>    
    </tr>    
    <tr>    
        <td><form:label path="lastname">Telephone</form:label></td>    
        <td><form:input path="telephone" /></td>    
    </tr>    
    <tr>    
        <td colspan="2">    
            <input type="submit" value="Add Contact"/>    
        </td>    
    </tr>    
</table>      
        
</form:form>    
</body>    
</html>
