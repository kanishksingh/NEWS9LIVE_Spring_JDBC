<%-- 
    Document   : menu
    Created on : 29 May, 2020, 2:07:10 PM
    Author     : KANISHK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #overlay .loading-spinner {
        width: 8%;
        left: 50% !important;
        position: absolute;
        top: 50%;
        transform: translate(-50% , -50%);
    }
    #overlay {
        position: fixed;
        display: none;

        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: rgba(0,0,0,0.5);
        z-index: 9999;
        cursor: pointer;
    }
    .x{
        top:50%
    }


</style>
<div id="overlay">
    <div class="loading-spinner x" style="">
        <img src="${pageContext.request.contextPath}/DashboardResources/image/gifloader.gif" class="img-responsive">
    </div>
</div>
<!-- main header -->
<header id="header_main">
    <div class="header_main_content">
        <nav class="uk-navbar">
            <!-- main sidebar switch -->
            <a href="#" id="sidebar_main_toggle" class="sSwitch sSwitch_left">
                <span class="sSwitchIcon"></span>
            </a>
            <div class="" style="float: left;">
                <ul class="uk-navbar-nav user_actions">
                    <li><a href="#"  class="user_action_icon uk-visible-large">Welcome <%=session.getAttribute("uname").toString()%></a></li>

                </ul>
            </div>
            <div class="uk-navbar-flip">
                <ul class="uk-navbar-nav user_actions">
                    <li><a href="#" id="full_screen_toggle" class="user_action_icon uk-visible-large"><i class="material-icons md-24 md-light">fullscreen</i></a></li>

                    <li id="digital-clock" style="color: white;
                        margin-top: 4%;
                        text-decoration: underline;"></li>
                    <li data-uk-dropdown="{mode:'click',pos:'bottom-right'}">
                        <a href="home" class="user_action_image"><img class="md-user-image" src="${pageContext.request.contextPath}/DashboardResources/assets/img/logo_main.png" alt=""/></a>
                        <div class="uk-dropdown uk-dropdown-small">
                            <ul class="uk-nav js-uk-prevent">
                                <li><a href="${pageContext.request.contextPath}/logout">LogOut</a></li>
                                <!--                                <li><a href="">ChangePassword</a></li>-->

                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header><!-- main header end -->
<!-- main sidebar -->
<aside id="sidebar_main">

    <div class="sidebar_main_header">
        <div class="sidebar_logo" style="    text-align: center;">
            <a href="home" class="sSidebar_hide sidebar_logo_large">
                <img class="logo_regular" src="${pageContext.request.contextPath}/DashboardResources/assets/img/logo_main.png" alt=""  height="100%" width="80%"/>
                <img class="logo_light" src="${pageContext.request.contextPath}/DashboardResources/assets/img/logo_main.png" alt="" height="15" width="71"/>
            </a>
            <a href="home" class="sSidebar_show sidebar_logo_small">
                <img class="logo_regular" src="${pageContext.request.contextPath}/DashboardResources/assets/img/logo_main_small.png" alt="" height="32" width="32"/>
                <img class="logo_light" src="${pageContext.request.contextPath}/DashboardResources/assets/img/logo_main_small_light.png" alt="" height="32" width="32"/>
            </a>
        </div>

    </div>

    <div class="menu_section">
        <ul>
            <li class="current_section" title="Dashboard">
                <a href="${pageContext.request.contextPath}/home">
                    <span class="menu_icon"><i class="material-icons">&#xE871;</i></span>
                    <span class="menu_title">Dashboard</span>
                </a>

            </li>
<!--            <li title="User Master">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">person_add</i></span>
                    <span class="menu_title">User Master</span>
                </a>
                <ul>
                    <li><a href="newuser">Create User</a></li>
                    <li><a href="${pageContext.request.contextPath}/UserMaster/Authentication.jsp">User Authentication</a></li>
                </ul>

            </li>-->
<li title="Master User">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">person_add</i></span>
                    <span class="menu_title">User Master</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/newuser">Create User</a></li>
                </ul>

            </li>
            <li title="Master Menu">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">&#xE1BD;</i></span>
                    <span class="menu_title">Menu Master</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/newmenu">Create Menu</a></li>
                    <li><a href="${pageContext.request.contextPath}/newsubmenu">Create SubMenu</a></li>
                </ul>

            </li>
             <li title="Breaking News">
                <a href="${pageContext.request.contextPath}/breaking">
                    <span class="menu_icon"><i class="material-icons">trending_up</i></span>
                    <span class="menu_title">Breaking News</span>
                </a>

            </li>
            <li title="News9 Khabar's">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">gavel</i></span>
                    <span class="menu_title">Khabar</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/AddKhabar">Add NEW KHABAR</a></li>
                    <li><a href="${pageContext.request.contextPath}/khabarreport">KHABAR Report</a></li>
                    <li><a href="${pageContext.request.contextPath}/publishmenu">Publish Whole-Menu</a></li>

                    <li><a href="${pageContext.request.contextPath}/newscategory">Published Khabar</a></li>
                   
                </ul>

            </li>
            <li title="News9 Special Video's">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">videocam</i></span>
                    <span class="menu_title">Special Video's</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/AddSpecialVideos">Add Videos</a></li>
                    
                   
                </ul>

            </li>
            <li title="News9 Special Video's">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">business</i></span>
                    <span class="menu_title">ख़बरें जरा हटके</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/khabarjarahatke">Add New</a></li>
                    
                   
                </ul>

            </li>
            

             <li title="News 9 Advertisement">
                <a href="#">
                    <span class="menu_icon"><i class="material-icons">settings_input_antenna</i></span>
                    <span class="menu_title">Advertisement</span>
                </a>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/CreateAdvertisement">Create Advertisement</a></li>
                    <li><a href="${pageContext.request.contextPath}/Advertisementreport">Report's</a></li>
                  
                </ul>

            </li>

        </ul>
    </div>
</aside><!-- main sidebar end -->
<script>
    function getDateTime() {
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var day = now.getDate();
        var hour = now.getHours();
        var minute = now.getMinutes();
        var second = now.getSeconds();
        if (month.toString().length == 1) {
            month = '0' + month;
        }
        if (day.toString().length == 1) {
            day = '0' + day;
        }
        if (hour.toString().length == 1) {
            hour = '0' + hour;
        }
        if (minute.toString().length == 1) {
            minute = '0' + minute;
        }
        if (second.toString().length == 1) {
            second = '0' + second;
        }
        var dateTime = " <i class='material-icons'>date_range</i> " + day + '-' + month + '-' + year + " <i class='material-icons'>watch_later</i> " + hour + ':' + minute + ':' + second;
        return dateTime;
    }

    // example usage: realtime clock
    setInterval(function () {
        currentTime = getDateTime();
        document.getElementById("digital-clock").innerHTML = currentTime;
    }, 1000);


</script>

