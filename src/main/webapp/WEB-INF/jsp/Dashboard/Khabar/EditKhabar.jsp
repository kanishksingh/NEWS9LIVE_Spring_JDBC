<%-- 
    Document   : EditKhabar
    Created on : 2 Jun, 2020, 9:41:42 AM
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

        <title>Add New Khabar</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/jsapi.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet">
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
                control.makeTransliteratable(['rname']);
                control.makeTransliteratable(['rdesignation']);
                control.makeTransliteratable(['dateplace']);
                control.makeTransliteratable(['Subheading']);
                control.makeTransliteratable(['imagefirstcaption']);
                          control.makeTransliteratable(['tag']);
                //          control.makeTransliteratable(['imagethirdcaption']);
                control.makeTransliteratable(['wysiwygcontent']);

                // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
                control.showControl('translControl');
            }

            google.setOnLoadCallback(onLoad);
        </script>

        <script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/wysiwyg_1.js"></script>

    </head>
    <body onload="setform()">
                            <h3 class="heading_a" style="text-align: center">${news}</h3><hr>
                            <form action="" method="post" modelAttribute="KHABAR"  name="updateKHABAR" id="updateKHABAR" enctype="multipart/form-data">
                                <div class="uk-grid" data-uk-grid-margin>
                                    <div class="uk-width-medium-1-2">
                                        <div class="uk-form-row">
                                            <img src="${pageContext.request.contextPath}/${command.folderPath}/${command.reporterImageName}" class="img-responsive" style="width: 300px;height: 146px;">
                                            <button class="md-btn" name="upload" id="upload" type="button">Upload New</button>
                                            <span class="uk-form-help-block">Reporter Image</span>
                                        </div>
                                        <div class="uk-form-row">
                                            <label>Reporter Name</label>
                                            <input name="sno" type="hidden" id="sno" value="${command.sno}">

                                            <input name="rname" type="text" class="md-input" id="rname" value="${command.rName}">
                                            <span class="uk-form-help-block" ></span>
                                        </div>
                                        <div class="uk-form-row">
                                            <label>Reporter Designation</label>
                                            <input name="rdesignation" class="md-input" id="rdesignation" value="${command.rDesignation}">
                                            <span class="uk-form-help-block" ></span>
                                        </div>
                                        <div class="uk-form-row">
                                            <label>Date/Place</label>
                                            <input name="dateplace" type="text" class="md-input" id="dateplace" value="${command.datePlace}">
                                            <span class="uk-form-help-block"></span>
                                        </div>
                                             <div class="uk-form-row">
                                            <label>Tags</label>
                                            <input name="tag" type="text" class="md-input" id="tag" value="${command.tags}">
                                            <span class="uk-form-help-block" id="tagerror" style="color: red">For multiple Tags use " , "</span>
                                        </div>

                                    </div>
                                    <div class="uk-width-medium-1-2">
                                        <div class="uk-form-row">
                                            <img src="${pageContext.request.contextPath}/${command.folderPath}/${command.imagefirstName}" alt="Image First Mandatory field**" class="img-responsive" style="width: 300px;height: 146px;">
                                           <button class="md-btn" name="upload" id="upload" type="button">Upload New</button>
                                            <span class="uk-form-help-block" id="imagefirsterror" >Image First</span>
                                        </div>
                                        <div class="uk-form-row">
                                            <label>Image First Caption</label>
                                            <input name="imagefirstcaption" type="text" class="md-input" id="imagefirstcaption" value="${command.imagefirstCaption}">
                                            <span class="uk-form-help-block" id="imagefirstcaptionerror" style="color: red"></span>
                                        </div>

                                        <div class="uk-form-row">
                                            <label>Khabar Title</label>
                                            <input name="title" type="text" class="md-input" id="title" value="${command.title}">
                                            <span class="uk-form-help-block" id="titleerror" style="color: red"></span>
                                        </div>
                                        <div class="uk-form-row">
                                            <label>Khabar Subheading</label>
                                            <input name="Subheading" type="text" class="md-input" id="Subheading" value="${command.subheading}">
                                            <span class="uk-form-help-block" id="Subheadingerror" style="color: red"></span>
                                        </div>
                                             <div class="uk-form-row">
                                            <label>Add Youtube Video-Link</label>
                                            <input name="youtube" type="text" class="md-input" id="youtube" value="${command.youtubeVideoLink}">
                                        </div>
                                        <!--                                                                    <div class="uk-form-row">
                                                                                <input name="imagesecond" type="file" class="md-input" id="imagesecond" >
                                                                                   <span class="uk-form-help-block" id="imagefirsterror">Image Second</span>
                                                                            </div>
                                                                              <div class="uk-form-row">
                                                                                <label>Image Second Caption</label>
                                                                                <input name="imagesecondcaption" type="text" class="md-input" id="imagesecondcaption" >
                                                                                   <span class="uk-form-help-block" id="imagesecondcaptionerror"></span>
                                                                            </div>
                                                                                                                                            <div class="uk-form-row">
                                                                                <input name="imagethird" type="file" class="md-input" id="imagethird" >
                                                                                   <span class="uk-form-help-block" id="imagethirderror">Image Third</span>
                                                                            </div>
                                                                              <div class="uk-form-row">
                                                                                <label>Image Third Caption</label>
                                                                                <input name="imagethirdcaption" type="text" class="md-input" id="imagethirdcaption" >
                                                                                   <span class="uk-form-help-block" id="imagethirdcaptionerror"></span>
                                                                            </div>-->


                                    </div>
                                    <div class="uk-width-medium-1-1">
                                        <div class="uk-form-row">
                                            <label>Khabar Description</label>

                                            <textarea name="content" cols="100" rows="5" class="" id="content">${command.content}</textarea>
                                            <script language="javascript1.2">
            generate_wysiwyg('content');
                                            </script>
                                        </div>

                                       </div>
                                </div>
                                    <hr>
                                                                    <div class="uk-grid" data-uk-grid-margin>

                                    <div class="uk-width-medium-1-4">
                                         <select name="menulists" id="menulists" class="form-control" title="Select Menu" onchange="ShowSubMenu(this.value)">
                                           <option value="0">Select Sub Menu</option>
                                           <c:forEach items="${menulists}" var="menu">
                                            <option value="${menu.sno}">${menu.menuName}</option>
                                           </c:forEach>
                                         </select>
                                 <span class="uk-form-help-block">Select Menu</span>

                                        </div>
                                     <div class="uk-width-medium-1-4">
                                            <select name="submenulists" id="submenulists" class="form-control" title="Select Sub Menu">
                                           <option value="0">Select Sub Menu</option>
                                          
                                         </select>
                                                                          <span class="uk-form-help-block">Select Sub Menu</span>

                                        </div>
                                     <div class="uk-width-medium-1-4">
                                           <select name="aligement" id="aligement" class="form-control"  title="Select Khabar Aligement">
                                           <option value="">Select Aligement</option>
                                           <option value="TS">Top Slider</option>
<!--                                           <option value="TL">Top Left</option>-->
                                           <option value="TR">Top Right</option>
                                           </select>

                                        </div>
                                     <div class="uk-width-medium-1-4">
                                            <button type="submit" class="md-btn" id="save" name="save" >Save Khabar</button>

                                        </div>
                                                                    </div>
                                    
                              

                            </form>
                            <!-- Bootstrap Progress bar -->

        <script>
              function ShowSubMenu(menu){
             var url='<%=Utils.ConnectionUtils.getConnectionURL()%>/Menubysubmenu/'+menu+'';
        $.ajax({
    url: url,
            type: "POST",
            dataType: 'json',
            ContentType:"text/html; charset=UTF-8",
            success: function (receipts) {
                console.log(receipts);
                
                 $('#submenulists').empty();
                 if(receipts==""){
                     $('#submenulists').append(
                        ' <option value="0">No Submenu</option>'
                    )
                 }else{
                $(receipts).each(function (index, item) {
                   if(index > 0){
                    $('#submenulists').append(
                           
                        '<option value="' + item.sno  +'">' + item.subMenuName  +
                        '</option>'
                    )
                   }else{
                      $('#submenulists').append(
                           
                        ' <option value="0">Select SubMenu</option><option value="' + item.sno  +'">' + item.subMenuName  +
                        '</option>'
                    )  
                   }
                });
                 }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log(XMLHttpRequest);
                console.log(textStatus);
                console.log(errorThrown);

            }

        });
}
 
            
            function setform(){
                document.getElementById("menulists").value=${khabarpublish.menusno};
                document.getElementById("submenulists").value=${khabarpublish.submenu};
                document.getElementById("aligement").value='${khabarpublish.aligement}';
            }
    $("form#updateKHABAR").submit(function (e) {
    var doSave = confirm('Are you sure you want to submit?');
    if (doSave) {
        e.preventDefault();
        var formDat = new FormData(this);
        $.ajax({
            url: '${pageContext.request.contextPath}/updateKhabarDetail',
            type: 'POST',
            data: formDat,
            cache: false,
            contentType: false,
            processData: false,
            beforeSend: function (xhr) {
                ajaxindicatorstart('Loading... Please Wait');
            },
            complete: function () {
                ajaxindicatorstop();
            },
            success: function (response) {
                ajaxindicatorstop();
                console.log(response);
                alert("Khabar Data Updated successfully");
                window.location.replace("../editkhabar/${command.sno}");
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