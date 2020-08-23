<%-- 
    Document   : AssignCategory
    Created on : 15 May, 2020, 12:15:39 PM
    Author     : KANISHK
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!doctype html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script language="JavaScript" type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/wysiwyg_1.js"></script>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body onload="Report();">


        <div id="UpdateUserid">
            <h3 class="heading_a" style="text-align: center">${news}</h3><hr>
            <div class="uk-grid" data-uk-grid-margin>
                <div class="uk-width-medium-4-4">
                    <div class="uk-form-row">
                        <div class="uk-grid" data-uk-grid-margin>
                            <div class="uk-width-medium-1-4">

                                <select id="menu" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'right'}" name="menu" title="Select Menu" onchange="ShowSubMenu(this.value)">
                                    <option value="0">Select Menu</option>
                                    <c:forEach items="${menulists}" var="Menu" >
                                        <option value="${Menu.sno}">${Menu.menuName}</option>

                                    </c:forEach> 

                                </select>
                                <span class="uk-form-help-block" id="submenuerror" style="color: red"></span>
                            </div>

                            <div class="uk-width-medium-1-4">
                                <select id="submenu" class="form-control" name="submenu" title="Select Sub Menu" style="    border-left: hidden;
                                        border-right: hidden;
                                        border-top: hidden;
                                        height: 47px;">
                                    <option value="0">Select SubMenu</option>

                                </select>
                                <span class="uk-form-help-block" id="submenuerror" style="color: red"></span>
                            </div>
                            <div class="uk-width-medium-1-4">
                                <select id="vertical" data-md-selectize data-md-selectize-bottom data-uk-tooltip="{pos:'top'}" name="vertical" title="Select ">
                                    <option value="">Select</option>
                                    <option value="TS">Top Slider</option>
                                    <option value="TR">Top Right</option>



                                </select>
                            </div>
                            <div class="uk-width-medium-1-4">
                                <button id='show' name='show' type='button' class="md-btn" onclick="Report()">Show</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <hr style="    border: 1px solid;">
        <form action="" method="post"  name="createKHABAR1" id="createKHABAR1" enctype="multipart/form-data">

            <table id="dt_tableExport" class="uk-table" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th width="5%" style="font-weight: bold !important;">Sno</th>
                        <th width="8%"  style="font-weight: bold !important;">Menu Name</th>
                        <th width="8%" style="font-weight: bold !important;">SubMenu Name</th>
                        <th width="25%" style="font-weight: bold !important;">Title</th>
                        <th width="40%" style="font-weight: bold !important;">SubHeading</th>
                        <th width="20%" style="font-weight: bold !important;">DatePlace</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </form>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <script>
function Report() {
    var menu = $('#menu').val();
    var submenu = $('#submenu').val();
    var vertical = $('#vertical').val();
    if (submenu > 0) {
        submenu = submenu;
    } else {
        submenu = 0;
    }
    var url = '<%=Utils.ConnectionUtils.getConnectionURL()%>/categorykhabarreport';
    $.ajax({
        url: url,
        type: "POST",
        dataType: 'json',
        data: {menu: menu, submenu: submenu, type: vertical},
        ContentType: "text/html; charset=UTF-8",
        beforeSend: function (xhr) {
            ajaxindicatorstart('Loading... Please Wait');
        },
        success: function (receipts) {
            //console.log(receipts);
            $('#dt_tableExport tbody').empty();
            if (receipts.khabarlist == "") {
                $('#dt_tableExport tbody').append(
                        '<tr><td colspan="6" style="text-align:center;font-weight:bold">No Record Found</td></tr>'
                        )
            } else {
                $(receipts.khabarlist).each(function (index, item) {
//                    console.log(item);
                    index = index + 1;
                    $('#dt_tableExport tbody').append(
                            '<tr><td>' + index +
                            '</td><td>' + item.menuName +
                            '</td><td>' + item.subMenuName +
                            '</td><td>' + item.title +
                            '</td><td>' + item.subheading +
                            '</td><td>' + item.datePlace +
                            '</td></tr>'
                            )

                });
            }
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
function ShowSubMenu(menu) {
    var url = '<%=Utils.ConnectionUtils.getConnectionURL()%>/Menubysubmenu/' + menu + '';
    $.ajax({
        url: url,
        type: "POST",
        dataType: 'json',
        ContentType: "text/html; charset=UTF-8",
        success: function (receipts) {
            console.log(receipts);
            $('#submenu').empty();
            if (receipts == "") {
                $('#submenu').append(
                        ' <option value="0">No Submenu</option>'
                        )
            } else {
                $(receipts).each(function (index, item) {
                    if (index > 0) {
                        $('#submenu').append(
                                '<option value="' + item.sno + '">' + item.subMenuName +
                                '</option>'
                                )
                    } else {
                        $('#submenu').append(
                                ' <option value="0">Select SubMenu</option><option value="' + item.sno + '">' + item.subMenuName +
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
$("form#createKHABAR1").submit(function (e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        url: '${pageContext.request.contextPath}/AssignKhabar',
        data: formData,
        type: "POST",
        cache: false,
        contentType: false,
        processData: false,
        contentType: false,
        beforeSend: function () {
            $("#overlay").show();
        },
        success: function (html) {
            if (html.trim() == "true") {
                alert("Updated Successfully");
            } else {
                alert("Something went wrong");
            }

            $("#overlay").fadeOut(5000);

        }
    });

});

        </script>
    </body>

</html>