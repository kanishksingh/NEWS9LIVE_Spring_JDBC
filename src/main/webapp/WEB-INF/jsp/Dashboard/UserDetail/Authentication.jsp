<%-- 
    Document   : Authentication
    Created on : 22 Apr, 2020, 8:56:00 PM
    Author     : KANISHK
--%>
<%@page import="POJO.UserDetail"%>
<%@page import="Bean.UserBean"%>
<%@page import="POJO.Branch"%>
<%@page import="POJO.Authentication"%>
<%@page import="Bean.Branchbean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="../session.jsp"%>
<%
    ArrayList<Branchbean> br1 = Branch.getBranchUserWise(username);
ArrayList<UserBean> userlist = UserDetail.getUsersList("", "", "","","");

    boolean permission = Authentication.checkPermission(username, "userauthentication");
  %>

<!doctype html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title><%=cname%> || User Authentication</title>
      
        <%@include file="../css/css.jsp"%>
<script src=”http://code.jquery.com/jquery-3.1.1.min.js”></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" />

    </head>
    <body class="disable_transitions sidebar_main_open sidebar_main_swipe" onload="TableDate('<%=branch%>','<%=usertype%>');">
        <%@include file="../menu.jsp"%>

        <div id="page_content">
            <div id="page_content_inner">

                <div class="md-card">
                    <div class="md-card-content" >
                            <%     if (permission == false) {%>
                     <div class="error_page_header">
        <div class="uk-width-8-10 uk-container-center">
            500!
        </div>
    </div>
    <div class="error_page_content">
        <div class="uk-width-8-10 uk-container-center">
            <p class="heading_b">Oops! Something went wrong...</p>
            <p class="uk-text-large">
               User Authentication  not granted for you.!! Contact to Administrator;
            </p>
            <a href="#" onclick="history.go(-1);return false;">Go back to previous page</a>
        </div>
    </div>
<%} else {%>
                        <div id="UpdateUserid">
                        <h3 class="heading_a">Assign User Authentication</h3>
                        <form action="" method="post"  name="createuser" id="createuser" onsubmit="return validate()">

                            <div>
                                <div class="row">
                                   <div class="col-md-4">

                                    <select id="branch" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'right'}" onchange="BranchWiseUsers()" name="branch" title="Select Branch">
                                        <%for (int i = 0; i < br1.size(); i++) {%>
                                        <option value="<%=br1.get(i).getSno()%>"><%=br1.get(i).getBranchName()%> (<%=br1.get(i).getBranchCode()%>) Branch </option>
                                        <%}
                                                        br1.clear();%>
                                            
                                        </select>
                                                        <span class="uk-form-help-block" style="color: red" id="brancherror"></span>                
                                   
                                   </div>
                                   <div class="col-md-4">

                                    <select id="username" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'right'}" onchange="BranchWiseUsers()" name="username" title="Select User">
                                        <option value="">Select User</option>  
                                        <%for (int i = 0; i < userlist.size(); i++) {%>
                                        <option value="<%=userlist.get(i).getUserName()%>"><%=userlist.get(i).getName()%> (<%=userlist.get(i).getUserName()%>) </option>
                                        <%}
                                                        userlist.clear();%>
                                            
                                        </select>
                                   
                                   </div>                   
                                  
                                                        
                                    
                                    <div class="col-md-4" style="text-align: center;">
                                        <button type="button" onclick="BranchWiseUsers();"  class="md-btn" id="save" name="save" >Show Users</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        </div>
                        <hr>                       
                        <div class="uk-form-row" style="overflow-x: scroll" id="tableDatalist">
                           
                        </div>
                     <%}%>            
                    </div>
                </div>


            </div>
        </div>
        <%@include file="../footer.jsp"%>
        <script>
            
function BranchWiseUsers() {
        var branch=$('#branch').val();

    if(branch=="0"){document.getElementById("brancherror").innerHTML="Select Branch";}else{
    var search=$('#username').val();
    $.ajax({
        type: "post",
        url: "Ajax/UserAssignAuthenticationTable.jsp", //this is my servlet
        data:{br:branch,search:search},
             success: function (msg) {
            $('#tableDatalist').empty();
            $('#tableDatalist').append(msg);
document.getElementById("brancherror").innerHTML="";
        }
    });
    }
}
        </script>
    </body>

</html>