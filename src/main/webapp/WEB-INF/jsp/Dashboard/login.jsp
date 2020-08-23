<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/DashboardResources/assets/img/bg.jpg" sizes="16x16">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/DashboardResources/assets/img/bg.jpg" sizes="32x32">
    <title>Login</title>
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/DashboardResources/bower_components/uikit/css/uikit.almost-flat.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/DashboardResources/assets/css/login_page.min.css" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/DashboardResources/assets/img/bg.jpg" sizes="16x16">
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/DashboardResources/assets/img/bg.jpg" sizes="32x32">

</head>
<body class="login_page login_page_v2">
    <div class="uk-container uk-container-center">
        <div class="md-card">
            <div class="md-card-content padding-reset">
                <div class="uk-grid uk-grid-collapse">
<!--                    <div class="uk-width-large-2-3 uk-hidden-medium uk-hidden-small">
                        <div class="login_page_info uk-height-1-1" style="background-image: url('${pageContext.request.contextPath}/DashboardResources/assets/img/others/sabri-tuzcu-331970.jpg')">
                            <div class="info_content">
                                <h1 class="heading_b"></h1>
                                
                                
                            </div>
                        </div>
                    </div>-->
                    <div class="uk-width-large-1-3 uk-width-medium-2-3 uk-container-center">
                        <div class="login_page_forms">
                            <div id="login_card">
                                <div id="login_form">
                                    <div class="login_heading">
                                        <div class="user_avatar"></div>
                                    </div>
		                    <form method="post" name="frmLogin" id="frmLogin" action="${pageContext.request.contextPath}/loginvalidation" modelAttribute="login">
                                        <div class="uk-form-row">
                                            <label for="login_username">Username</label>
                                            <input class="md-input" type="text" id="username" name="username" />
                                        </div>
                                        <div class="uk-form-row">
                                            <label for="login_password">Password</label>
                                            <input class="md-input" type="password" id="password" name="password" />
                                        </div>
                                        <div class="uk-form-row">
                                            <div class="errorMessage" align="center" style="color:red"> ${msg}</div>
                                                                   
								</div>
                                        <div class="uk-margin-medium-top">
                                            <button class="md-btn md-btn-primary md-btn-block md-btn-large" id='submit'>Sign In</button>
                                        </div>
                                       
                                        
                                    </form>
                                </div>
                                
                                
                            </div>
                           
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
  <script src="${pageContext.request.contextPath}/DashboardResources/assets/js/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/DashboardResources/assets/js/uikit_custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/DashboardResources/assets/js/techgenysis_admin_common.min.js"></script>
    <script src="${pageContext.request.contextPath}/DashboardResources/assets/js/pages/login.min.js"></script>
</body>

</html>