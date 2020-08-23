<%-- 
    Document   : loginlayout
    Created on : 5 Jun, 2020, 1:22:40 PM
    Author     : KANISHK
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>    
<!doctype html>
<html> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

<title><tiles:insertAttribute name="title" ignore="true" /></title>    

        <%@include file="css/css.jsp"%>
    
    </head>
    <body class="disable_transitions sidebar_main_open sidebar_main_swipe" onload="">
        <div style="text-align: center;
    font-size: 26px;
    font-weight: bold;
    color: #535363;
    text-decoration: underline;"></div>    
        <div style="
    border: 2px solid gray;
    padding: 30px;">    
        <tiles:insertAttribute name="dbody" /></div>    
        <div style="clear:both;text-align: center;"></div>    
    </body>

</html>