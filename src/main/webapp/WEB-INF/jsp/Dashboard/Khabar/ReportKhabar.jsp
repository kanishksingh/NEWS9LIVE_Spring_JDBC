<%-- 
    Document   : ReportKhabar
    Created on : 15 May, 2020, 11:26:43 PM
    Author     : KANISHK
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>      
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
      </head>
    <body>
                          <div class="uk-form-row" style="overflow-x: scroll" id="tableDatalist">
                          <h3 class="heading_a" style="text-align: center">Added Khabar Report's</h3>

                            <div class="uk-grid" data-uk-grid-margin>
                                <div class="uk-width-medium-1-1">
                                    <div class="uk-form-row">
                                        
                                        <table id="dt_tableExport" class="uk-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th width="5%">Sno</th>

                                        <th width="25%">Title</th>
                                        <th width="40%">SubHeading</th>

                                        <th width="20%">DatePlace</th>
                                       
                                        <th width="10%"></th>

                                    </tr>
                                </thead>
                                <c:forEach var="khabar" items="${khabarreportlist}" varStatus="loop">     
   <tr>    
   <td>${loop.count}</td>    
   <td>${khabar.title}</td>    
   <td>${khabar.subheading}</td>    
   <td>${khabar.datePlace}</td>    
    <td ><a href="${pageContext.request.contextPath}/editkhabar/${khabar.sno}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/deletkhabar/${khabar.sno}">Delete</a></td>
   </tr>    
   </c:forEach>
                               
                                   
                                </tbody>
                            </table>
                                        <br/>    
<!--   <a href="${pageContext.request.contextPath}/khabarreport/1">Previous</a>     
   <a href="${pageContext.request.contextPath}/khabarreport/2">Next</a>     -->

                                                                    </div>
                                          
                                            
                                                                </div>
                                
                                                              
                            </div>
                        </div>
                     
                    
                     
    </body>

</html>