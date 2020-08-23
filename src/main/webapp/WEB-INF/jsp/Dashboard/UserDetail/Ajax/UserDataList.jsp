<%-- 
    Document   : UserDataList
    Created on : Oct 22, 2019, 3:35:14 PM
    Author     : Kanishk
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="POJO.UserDetail"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.UserBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  
    String branch=request.getParameter("br");
        String usertype=request.getParameter("type");
        String limit=request.getParameter("limit");
        String search=request.getParameter("search");

    ArrayList<UserBean> userlist = UserDetail.getUsersList("", branch, usertype,limit,search);
%>
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
                                    <%
                                        for (int index = 0; index < userlist.size(); index++) {
                                            String branchsno=userlist.get(index).getBranch();
                                            String utype=userlist.get(index).getUsertype();
                                            String linkforupdate="";
                                           
                                    %>   
                                    <tr>
                                        <th><a href='javascript:void(0)' onclick="EditUser('<%=userlist.get(index).getUserName()%>')"><%=index+1%></a></th>
                                        <th><a href='javascript:void(0)' onclick="EditUser('<%=userlist.get(index).getUserName()%>')"><%=userlist.get(index).getUserName()%></a></th>
                                        <th><%=userlist.get(index).getPassword()%></th>

                                        <th><%=userlist.get(index).getName()%></th>
                                        <th><%=userlist.get(index).getDesignation()%></th>
                                        <th><%=userlist.get(index).getMobile()%></th>
                                         <th><%=userlist.get(index).getBranchname()%></th>

                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
<!--                        <div class="uk-grid col-sm-12" data-uk-grid-margin>

                                <div class="uk-width-medium-1-2">
                                    <div class="uk-form-row">
                                        Showing 1 to 10 of 57 entries
                                    </div>
                                </div>
                                     <div class="uk-width-medium-1-2" style="float: right">
                                    <div class="uk-form-row col-sm-12" style="float: right">
                                        Previous  1 2 3 4 Next
                                    </div>
                                </div>
                            </div>-->