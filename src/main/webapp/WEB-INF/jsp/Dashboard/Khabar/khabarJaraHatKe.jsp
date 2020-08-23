<%-- 
    Document   : khabarJaraHatKe
    Created on : 10 Jul, 2020, 11:46:43 PM
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

        <title>KhabarJara Hat ke</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/jsapi.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                var ids = ["title"];
                //          var ids1 = ["wysiwyg"];
                control.makeTransliteratable(ids);
                //        control.makeTransliteratable(ids1);
                control.makeTransliteratable(['subheading']);
                control.makeTransliteratable(['dateplace']);
                //          control.makeTransliteratable(['imagesecondcaption']);
                //          control.makeTransliteratable(['imagethirdcaption']);
                control.makeTransliteratable(['wysiwygcontent']);

                // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
                control.showControl('translControl');
            }

            google.setOnLoadCallback(onLoad);
        </script>

        <script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/wysiwyg.js"></script>

    </head>
    <body onload="Report()">
                            <h3 class="heading_a" style="text-align: center">${news}</h3><hr>
                            <form action="" method="post" modelAttribute="KHABAR"  name="SaveSpecialVideo" id="SaveSpecialVideo" enctype="multipart/form-data">
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-1-2">
                                       
                                        <div class="uk-form-row">

                                            <input name="file" type="file" class="md-input" id="file" >
                                                                                        <span class="uk-form-help-block">Image</span>

                                        </div>
                                        <div class="uk-form-row">
                                            <label>Title</label>
                                            <input name="title" class="md-input" id="title" value="">
                                        </div>
                                        
                                    </div>
                                    <div class="uk-width-medium-1-2">
                                        
                                         <div class="uk-form-row">
                                            <label>Date/Place</label>
                                            <input name="dateplace" type="text" class="md-input" id="dateplace" value="">
                                        </div>
                                         <div class="uk-form-row">
                                            <label>Sub Heading</label>
                                            <input name="subheading" type="text" class="md-input" id="subheading" value="">
                                        </div>
                                        
                                       
                                    </div>
                                     <div class="uk-width-medium-1-1">
                                        <div class="uk-form-row">
                                            
                                            <span class="uk-form-help-block" id="Subheadingerror" style="color: red;text-align: center">Description *Please Press the Enter Key after every Paragraph</span>

                                            <textarea name="content" cols="100" rows="5" class="" id="content"></textarea>
                                            <script language="javascript1.2">
            generate_wysiwyg('content');
                                            </script>
                                        </div>
                                    </div>
                                      <div class="uk-width-medium-1-4">
                                         <button type="submit" class="btn-success" id="save" name="save" style="height: 35px;width: 132px;" >Save Khabar</button>

                                        </div>
                                </div>
                                    <hr>
                                                                    
                                    
                              

                            </form>
                            <!-- Bootstrap Progress bar -->
   <hr style="    border: 1px solid;">
                            
                                    <table id="dt_tableExport" class="uk-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th width="5%">Sno</th>

                                        <th width="25%">Title</th>
                                        <th width="40%">Subheading</th>

                                        <th width="20%">DatePlace</th>
                                        <th width="20%"></th>
                                       

                                    </tr>
                                </thead>

                               
                                <tbody>
                                 
                                </tbody>
                                
                            </table>
           <script src="${pageContext.request.contextPath}/resources/Project/js/ajaxsave.js"></script>

        <script>
           function Report() {
               
                var url='<%=Utils.ConnectionUtils.getConnectionURL()%>/Khabarjarahatkereport';
        $.ajax({
    url: url,
            type: "POST",
            dataType: 'json',
            ContentType:"text/html; charset=UTF-8",
            success: function (receipts) {
                //console.log(receipts);

                $(receipts).each(function (index, item) {
//                    console.log(item);
                    $('#dt_tableExport tbody').append(
                        '<tr><td>' + item.sno  +
                        '</td><td>' + item.title +
                        '</td><td>' + item.subheading +
                        '</td><td>' + item.datePlace + 
                        '</td><td><a href="${pageContext.request.contextPath}/deletkhabarjarahatke/'+item.sno+'">Delete</a></td></tr>'
                    )

                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);

            }

        });
    }
    $("form#SaveSpecialVideo").submit(function (e) {
    var doSave = confirm('Are you sure you want to submit?');
    if (doSave) {
        e.preventDefault();
        var formDat = new FormData(this);
        $.ajax({
            url: '${pageContext.request.contextPath}/Savekhabarjrahutk',
            type: 'POST',
            data: formDat,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function (xhr) {
                ajaxindicatorstart('Uploading ... Please Wait');
            },
            complete: function () {
                ajaxindicatorstop();
            },
            success: function (response) {
                ajaxindicatorstop();
                console.log(response);
                alert("Added successfully");
                window.location.replace("khabarjarahatke");
            },
            error: function (xhr, status, error) {
                ajaxindicatorstop();
                console.log(xhr);
                console.log(status);
                console.log(error);
                alert('Error Uploading Files');
                return false;
            }
        });
    } else {
        return false;
    }
});
        </script>

    </body>

</html>