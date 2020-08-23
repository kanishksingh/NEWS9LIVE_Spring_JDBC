<%-- 
    Document   : NewMenu
    Created on : 8 May, 2020, 11:28:21 PM
    Author     : KANISHK
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!doctype html>
<html lang="en"> 
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    
        <script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/wysiwyg.js"></script>

    </head>
    <body >

        <h3 class="heading_a">Create New Menu</h3><hr>
        <form method="post" name="frmMenu" id="frmMenu" action="${pageContext.request.contextPath}/savemenu" modelAttribute="menuform">

            <div class="uk-grid" data-uk-grid-margin>

                <div class="uk-width-medium-1-2">
                    <div class="uk-form-row">
                        <label>Heading</label>
                        <input name="menuName" class="md-input" id="menuName" autocomplete="off">
                        <span class="uk-form-help-block" id="menuerror" style="color: red"></span>
                    </div>
                    <div class="uk-form-row">
                        <div class="errorMessage" align="center" style="color:red"> ${msg}</div>

                        <button type="submit" class="md-btn" id="save" name="save" >Submit</button>
                    </div>


                </div>

                <div class="uk-width-medium-1-2">
                    <div class="uk-form-row" id="tableDatalist">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="example">

                            <thead>
                                <tr>
                                    <th>#</th>

                                    <th style="text-align: left">Name</th>
                                    <th style="text-align: left">Status(Hide/Show)</th>


                                    <th style="text-align: right"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="menu" items="${menulist}" varStatus="loop"> 
                                    <tr>
                                        <td>${loop.count}</td>
                                        <td>${menu.menuName}</td>
                                        <td>${menu.hide_show}</td>

                                        <td style="float:right"><a href="${pageContext.request.contextPath}/editmenu/${menu.sno}">Edit</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/deletemenu/${menu.sno}">Delete</a></td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>

                    </div>

                </div>
            </div>
        </form>
    <script type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/jsapi.js"></script>
        <script type="text/javascript">
            // Load the Google Transliteration API
            google.load("elements", "1", {
                packages: "transliteration"
            });

            function onLoad() {
                var options = {
                    sourceLanguage: 'en',
                    destinationLanguage: ['hi'],
                    shortcutKey: 'ctrl+m',
                    transliterationEnabled: true
                }

                // Create an instance on TransliterationControl with the required options.
                var control = new google.elements.transliteration.TransliterationControl(options);

                // Enable transliteration in the textfields with the given ids.
                var ids = ["menuName"];
                control.makeTransliteratable(ids);

                // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
                control.showControl('translControl');
            }

            google.setOnLoadCallback(onLoad);
        </script>

        <script>
          $('.errorMessage').fadeOut(2000);
        </script>
    </body>

</html>