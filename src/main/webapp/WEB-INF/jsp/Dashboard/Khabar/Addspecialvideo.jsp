<%-- 
    Document   : Addspecialvideo
    Created on : 10 Jul, 2020, 9:14:24 PM
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

        <title>${news}</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/jsapi.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <!-- JQuery -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/ajaxloaderstart_stop.js"></script>
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
          control.makeTransliteratable(ids);
                control.makeTransliteratable(['dateplace']);

          // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
          control.showControl('translControl');
        }

        google.setOnLoadCallback(onLoad);
      </script>

    </head>
    <body onload="Report()">
                            <h3 class="heading_a" style="text-align: center">${news}</h3><hr>
                            <form action="" method="post" modelAttribute="KHABAR"  name="SaveSpecialVideo" id="SaveSpecialVideo" enctype="multipart/form-data">
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-1-2">
                                       
                                        <div class="uk-form-row">
                                            <label>Youtube Video Link</label>

                                            <input name="videolink" type="text" class="md-input" id="videolink" >
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
                                            <label>Publish in ( न्यूज़ वीडियो )</label>
                                            <select id="publish" name="publish" class="md-input" >
                                                <option value="N">No</option>
                                                <option value="Y">Yes</option>
                                            </select>
                                        </div>
                                         <div class="uk-form-row">
                                             <button name="submit" class="md-btn" id="submit" value="">Submit</button>
                                        </div>
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

                                        <th width="35%">Title</th>
                                        <th width="20%">Video Link</th>

                                        <th width="10%">DatePlace</th>
                                        <th width="5%">Publish</th>
                                        <th width="15%">EnteredOn</th>
                                        <th width="10%"></th>
                                       

                                    </tr>
                                </thead>

                               
                                <tbody>
                                 
                                </tbody>
                                
                            </table>
        <script>
           function Report() {
               
                var url='<%=Utils.ConnectionUtils.getConnectionURL()%>/SpecialVideos';
        $.ajax({
    url: url,
            type: "POST",
            dataType: 'json',
            ContentType:"text/html; charset=UTF-8",
                    async: true,                       
 beforeSend: function(){
    // Show image container
    ajaxindicatorstart("Data Loading..Please Wait..");
   },
            success: function (receipts) {
                //console.log(receipts);

                $(receipts).each(function (index, item) {
//                    console.log(item);
var integer=index + 1;
                    //console.log(receipts[index]);
                    $('#dt_tableExport tbody').append(
                        '<tr><td>' + integer  +
                        '</td><td>' + item.title +
                        '</td><td>' + item.videoLink +
                        '</td><td>' + item.datePlace + 
                        '</td><td>' + item.publish + 
                        '</td><td>' + item.enteredOn + 
                        '</td><td><a href="${pageContext.request.contextPath}/deletSpecialVideo/'+item.sno+'">Delete</a>&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/detailSpecialVideo/'+item.sno+'">Update</a></td></tr>'
                    )

                });
                ajaxindicatorstop();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);
                ajaxindicatorstop();

            }

        });
    }
    $("form#SaveSpecialVideo").submit(function (e) {
    var doSave = confirm('Are you sure you want to submit?');
    if (doSave) {
        e.preventDefault();
        var formDat = new FormData(this);
        $.ajax({
            url: '${pageContext.request.contextPath}/SaveSpecialVideo',
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
                alert("Video Added successfully");
                window.location.replace("AddSpecialVideos");
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