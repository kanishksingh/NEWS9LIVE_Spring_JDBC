<%-- 
    Document   : NewUsers
    Created on : Oct 22, 2019, 12:20:46 AM
    Author     : Kanishk
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

    </head>
    <body >
     
                        <div id="UpdateUserid">
                        <h3 class="heading_a"> ${msg}</h3>
                        <form action="${pageContext.request.contextPath}/saveuser" method="post"  name="Userform" id="Userform" onsubmit="">

                            <div class="uk-grid" data-uk-grid-margin>
                                <div class="uk-width-medium-1-2">
                                    <div class="uk-form-row">
                                        <label>Name</label>
                                        <input type="text" class="md-input" id="name" name="name" required/>
                                    </div>
                                   
                                    <div class="uk-form-row">
                                        <label>Username</label>
                                        <input type="text" class="md-input" id="username" name="username" required/>
                                    </div>
                                    <div class="uk-form-row">
                                        <label>Passsword</label>
                                        <input type="password" class="md-input" id="password" name="password" required/>
                                    </div>
                                  
                                </div>
                                <div class="uk-width-medium-1-2">
                                    <div class="uk-form-row">
                                        <label>Mobile No.</label>
                                        <input type="number" class="md-input" id="mob" name="mob" />
                                    </div>
                                   <div class="uk-form-row">
                                        <select id="select_demo_5" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'right'}" name="designation" title="Select Designation">
                                            <option value="">Select Designation...</option>
                                            <option value="Manager">Manager</option>
                                            <option value="Owner">Owner</option>
                                            <option value="Account Manager">Account Manager</option>
                                            <option value="Admin">Admin</option>
                                          

                                        </select>
                                        <!--                                                                    <span class="uk-form-help-block">User Designation</span>-->

                                    </div>
                                    <div class="uk-form-row">
                                        <select id="branch" name="branch" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'top'}"  title="Select Branch">
                                          <c:forEach items="${branchlist}" var="branch">
        <option value="${branch.sno}">${branch.branchName} Branch</option>
    </c:forEach>
                                         
                                        </select>
                                        <!--                                                                    <span class="uk-form-help-block">User Designation</span>-->

                                    </div>
                                    
                                    <div class="uk-form-row">
                <div class="errorMessage" align="center" style="color:red"> ${msgres}</div>

                                        <button type="submit" class="md-btn" id="save" name="save" >Submit Detail</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        </div>
                <div class="uk-form-row">
                 <table id="dt_tableExport" class="uk-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th>Sno</th>

                                        <th>Username</th>
                                        <th>Password</th>

                                        <th>Name</th>
                                        <th>Designation</th>
                                        <th>Mobile</th>
                                        <th>Branch</th>

                                    </tr>
                                </thead>

                               
                                <tbody>
                                    <c:forEach items="${usrslist}" var="users" varStatus="theCount">
                                    <tr>
                                        <td>${theCount.count}</td>
                                        <td>${users.username}</td>
                                        <td>${users.password}</td>

                                        <td>${users.name}</td>
                                        <td>${users.designation}</td>
                                        <td>${users.mobile}</td>
                                         <td>${users.branchname}</td>

                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                </div>
                      
    </body>

</html>