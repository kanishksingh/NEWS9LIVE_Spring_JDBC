<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
    /*Panel tabs*/
.panel-tabs {
    position: relative;
    bottom: 40px;
    clear:both;
/*    border-bottom: 1px solid transparent;*/
}

.panel-tabs > li {
    float: left;
    margin-bottom: -1px;
}

.panel-tabs > li > a {
    margin-right: 2px;
    margin-top: 4px;
    line-height: .85;
    border: 1px solid transparent;
    border-radius: 4px 4px 0 0;
    color: #ffffff;
}

.panel-tabs > li > a:hover {
    border-color: transparent;
    color: #ffffff;
    background-color: transparent;
}

.panel-tabs > li.active > a,
.panel-tabs > li.active > a:hover,
.panel-tabs > li.active > a:focus {
    color: #fff;
    cursor: default;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    background-color: rgba(255,255,255, .23);
    border-bottom-color: transparent;
}
.panel {
    margin-bottom: 20px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);
    box-shadow: 0 1px 1px rgba(0,0,0,0.05);
}
.panel-primary>.panel-heading {
    color: #fff;
    background-color: #428bca;
    border-color: #428bca;
}
.panel-heading {
    padding: 10px 15px;
    border-bottom: 1px solid transparent;
    border-top-right-radius: 3px;
    border-top-left-radius: 3px;
}
.panel-title {
    margin-top: 0;
    margin-bottom: 0;
    font-size: 21px;
}
.pull-right {
    float: right!important;
}
.panel-primary>.panel-heading {
    color: #fff;
    background-color: #428bca;
    border-color: #428bca;
}

.panel-body {
    padding: 15px;
}
.panel-body:before, .panel-body:after {
    display: table;
    content: " ";
}
.panel-body:before, .panel-body:after {
    display: table;
    content: " ";
}

.nav:before, .nav:after {
    display: table;
    content: " ";
}
.nav>li {
    position: relative;
    display: block;
}
.nav>li>a {
    position: relative;
    display: block;
    padding: 10px 15px;
}
    </style>

 
    <body onload="setForm()">
        <!--Content start-->
        <main id="content">
            <div class="container">
                <div class="row">
                    <!-- top section -->
                    <div class="col-12 mt-05">
                        <!--Slider ticker-->
                        <div class="row py-2">
                            <!--Breaking box-->
                            <div class="col-2 col-sm-1 col-md-3 col-lg-2 py-1 pr-md-0 mb-md-1">
                                <div class="d-inline-block d-md-block bg-primary text-white text-center breaking-caret py-1 px-2">
           
                                    <span class="fas fa-bolt" title="Breaking News"></span>
                                    <span class="d-none d-md-inline-block">Breaking news</span>
                                </div>
                            </div>
                            <!--Breaking content-->
                            <div class="col-10 col-sm-11 col-md-9 col-lg-10 pl-1 pl-md-2">
                                <div class="breaking-box">
                                    <div id="carouselbreaking" class="carousel slide" data-ride="carousel">
                                        <!--breaking news-->
                                        <div class="carousel-inner">
                                            <!--list post-->
                                            <c:forEach items="${blist}" var="breaking" varStatus="loop">

                                                <c:if test="${loop.count==1}">  

                                                    <div class="carousel-item active aribudin">
                                                        <a class="h6 font-weight-light" href="#">${breaking.bnews}</a>
                                                    </div>
                                                </c:if>
                                                <c:if test="${loop.count>1}">  
                                                    <div class="carousel-item  aribudin">
                                                        <a class="h6 font-weight-light" href="#">${breaking.bnews}</a>
                                                    </div> 
                                                </c:if>
                                            </c:forEach>
                                        </div><!--end breaking news-->
                                        <!--navigation slider-->
                                        <div class="navigation-box p-2 d-none d-sm-block">
                                            <!--nav left-->
                                            <a class="carousel-control-prev text-primary" href="#carouselbreaking" role="button" data-slide="prev">
                                                <i class="fa fa-angle-left" aria-hidden="true"></i>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <!--nav right-->
                                            <a class="carousel-control-next text-primary" href="#carouselbreaking" role="button" data-slide="next">
                                                <i class="fa fa-angle-right" aria-hidden="true"></i>
                                                <span class="sr-only">Next</span>
                                            </a>
                                        </div><!--end navigation slider-->
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--End slider ticker-->

                        <!-- Big grid slider 1 -->
                        <div class="row featured-1 mb-5">
                            <!--Start left cover-->
                            <div class="col-md-6 pb-05 pt-05 pr-md-05">
                                <div id="owl-carousel11" class="owl-carousel owl-theme owl-mx-0">
                                    <!--Item slider-->
                                    <c:forEach items="${sliderkhabar}" var="slideritem">
                                        <article class="item">
                                            <div class="card card-full text-light overflow zoom">
                                                <!--thumbnail-->
                                                <div class="ratio image-wrapper">
                                                    <a href="newsdetail/${slideritem.sno}/${slideritem.menusno}">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/${slideritem.folderPath}/${slideritem.imagefirstName}" data-src="${pageContext.request.contextPath}/${slideritem.folderPath}/${slideritem.imagefirstName}" alt="${slideritem.imagefirstName}">
                                                    </a>
                                                    <div class="position-absolute p-3 b-0 w-100 bg-lg-shadow">
                                                        <!--title-->
                                                        <a href="newsdetail/${slideritem.sno}/${slideritem.menusno}">
                                                            <h2 class="h1-sm h2-md display-4-lg font-weight-500 text-white">${slideritem.imagefirstCaption}</h2>
                                                        </a>
                                                        <!-- meta title -->
                                                        <div class="news-meta">
                                                            <span class="news-author">by <a class="text-white font-weight-bold" href="#">${slideritem.rName} ,</a></span>
                                                            <time class="news-date" datetime="${slideritem.enteredOn}">${slideritem.datePlace} </time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </c:forEach>
                                    <!--end item slider-->
                                </div>
                            </div>
                            <!--End left cover-->
                            <!--Start box news-->
                            <div class="col-md-6 pt-05 pl-md-05">
                                <div class="row newsbox">
                                    <!--news box-->
                                    <c:forEach items="${rightkhabar}" var="rightkhabaritem" >

                                        <article class="col-6">
                                            <div class="card card-full text-white overflow zoom">
                                                <div class="ratio image-wrapper">
                                                    <!--thumbnail-->
                                                    <a href="newsdetail/${rightkhabaritem.sno}/${rightkhabaritem.menusno}">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/${rightkhabaritem.folderPath}/${rightkhabaritem.imagefirstName}" data-src="${pageContext.request.contextPath}/${rightkhabaritem.folderPath}/${rightkhabaritem.imagefirstName}" alt="${rightkhabaritem.imagefirstName}">
                                                    </a>
                                                    <!-- category & title -->
                                                    <div class="position-absolute px-3 pb-3 pt-0 b-0 w-100 bg-shadow">
                                                        <a class="p-1 badge badge-primary" href="#">${rightkhabaritem.menuName}</a>
                                                        <a href="newsdetail/${rightkhabaritem.sno}/${rightkhabaritem.menusno}">
                                                            <h2 class="h6 h4-sm h6-md h5-lg text-white my-1">${rightkhabaritem.imagefirstCaption}</h2>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </c:forEach>

                                    <!--end news box-->
                                </div>
                            </div>
                            <!--End box news-->
                        </div>
                        <!--End Big grid slider 1-->
                    </div>

               

                    <!--start left column-->
                    <div class="col-md-8">
                        <!-- Block start -->
                        <div class="block-area">
                                   <%@include file="DynamicSection.jsp"%>
<!--
       <div class="" id="MenuWiseSubmenuDatas">
                <div class="block-title-6">
                                <h3 class="panel-title h5 border-primary ">
                                    <span class="bg-primary text-white">मेट्रो न्यूज़</span>
                                </h3>
                                
                    <span class="pull-right">
                         Tabs 
                        <ul class="nav panel-tabs bg-primary text-white ">
                            <li class="active"><a href="#tab1" data-toggle="tab">दिल्ली</a></li>
                            <li><a href="#tab2" data-toggle="tab">मुंबई</a></li>
                            <li><a href="#tab3" data-toggle="tab">कोलकाता</a></li>
                            <li><a href="#tab4" data-toggle="tab">चेन्नई</a></li>
                        </ul>
                    </span>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
  <div class="row" style="width: 100%">
                                post left start
                               
                                end post left
                                 <div class="col-md-6">
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-4 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img1.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-8 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Yankees Party Like It’s 1998, at Least for a Day</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-22">Oct 22, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img2.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Dale Earnhardt Jr. Returns to the Racetrack and an Old Hobby</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-21">Oct 21, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img3.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Carmelo Anthony Officially Signs with the Houston Rockets</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-20">Oct 20, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img4.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Jacob deGrom Goes the Distance as Mets Top the Phillies</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-17">Oct 17, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    End post list
                                </div>
                              
                                post right list start
                                <div class="col-md-6">
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-4 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img1.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-8 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Yankees Party Like It’s 1998, at Least for a Day</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-22">Oct 22, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img2.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Dale Earnhardt Jr. Returns to the Racetrack and an Old Hobby</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-21">Oct 21, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img3.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Carmelo Anthony Officially Signs with the Houston Rockets</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-20">Oct 20, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    post list
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_160-112 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img4.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Jacob deGrom Goes the Distance as Mets Top the Phillies</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-17">Oct 17, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    End post list
                                </div>
                                end post right list
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</div>
                        <div class="tab-pane" id="tab3">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</div>
                        <div class="tab-pane" id="tab4">Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.

                            Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet,</div>
                    </div>
                </div>
            </div>-->
     
                       
                            <!-- end block content -->
                        </div>
                        <!--End Block-->
<!--
                        Block start
                        <div class="block-area">
                            <div class="row">
                                left post
                                <div class="col-lg-6">
                                    block title
                                    <div class="block-title-6">
                                        <h4 class="h5 border-primary">
                                            <span class="bg-primary text-white">कारोबार</span>
                                        </h4>
                                    </div>
                                    post big start
                                    <div class="big-post">
                                        <article class="card card-full hover-a mb-4">
                                            thumbnail
                                            <div class="ratio_360-202 image-wrapper">
                                                <a href="#">
                                                    <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                                </a>
                                            </div>
                                            <div class="card-body">
                                                title
                                                <h2 class="card-title h1-sm h3-lg">
                                                    <a href="#">Ferrari improves painting process so perfect</a>
                                                </h2>
                                                 author, date & comments 
                                                <div class="card-text mb-2 text-muted small">
                                                    <span class="d-none d-sm-inline mr-1">
                                                        <a class="font-weight-bold" href="#">John Doe</a>
                                                    </span>
                                                    <time datetime="2019-10-22">Oct 22, 2019</time>
                                                    <span title="9 comment" class="float-right">
                                                        <span class="fa fa-comments" aria-hidden="true"></span> 9
                                                    </span>
                                                </div>
                                                description
                                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            </div>
                                        </article>
                                    </div>
                                    end post big
                                    post small start
                                    <div class="small-post">
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img21.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Nissan's sports car strategy rests on the stable genius of GT-R</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-16">Oct 16, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img22.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Toyota Sienna rates marginal in passenger-side overlap crash test</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-15">Oct 15, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img23.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Ford reveals autonomous vehicle philosophies, priorities</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-14">Oct 14, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    end post small
                                </div>
                                end left post

                                right post
                                <div class="col-lg-6">
                                    block title
                                    <div class="block-title-6">
                                        <h4 class="h5 border-primary">
                                            <span class="bg-primary text-white">खेल</span>
                                        </h4>
                                    </div>
                                    post big start
                                    <div class="big-post">
                                        <article class="card card-full hover-a mb-4">
                                            thumbnail
                                            <div class="ratio_360-202 image-wrapper">
                                                <a href="#">
                                                    <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                                </a>
                                            </div>
                                            <div class="card-body">
                                                title
                                                <h2 class="card-title h1-sm h3-lg">
                                                    <a href="#">Settling Arguments About Hydrogen With 168 Giant Lasers</a>
                                                </h2>
                                                 author, date & comments 
                                                <div class="card-text mb-2 text-muted small">
                                                    <span class="d-none d-sm-inline mr-1">
                                                        <a class="font-weight-bold" href="#">John Doe</a>
                                                    </span>
                                                    <time datetime="2019-10-22">Oct 22, 2019</time>
                                                    <span title="9 comment" class="float-right">
                                                        <span class="fa fa-comments" aria-hidden="true"></span> 9
                                                    </span>
                                                </div>
                                                description
                                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                            </div>
                                        </article>
                                    </div>
                                    end post big
                                    post small start
                                    <div class="small-post">
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img24.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Hundreds of Reindeer Died by Lightning.</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-09">Oct 9, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img25.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Latest Attraction at French Theme Park: Crows That Pick Up Trash</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-07">Oct 7, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                        post list
                                        <article class="card card-full hover-a mb-4">
                                            <div class="row">
                                                thumbnail
                                                <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                    <div class="ratio_115-80 image-wrapper">
                                                        <a href="#">
                                                            <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img26.jpg" alt="Image description">
                                                        </a>
                                                    </div>
                                                </div>
                                                 title & date 
                                                <div class="col-9 col-md-8">
                                                    <div class="card-body pt-0">
                                                        <h3 class="card-title h6 h5-sm h6-lg">
                                                            <a href="#">Offer Hints to How Dogs Became Domesticated</a>
                                                        </h3>
                                                        <div class="card-text small text-muted">
                                                            <time datetime="2019-10-18">Oct 18, 2019</time>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    end post small
                                </div>
                                end right post
                            </div>
                        </div>
                        End Block-->
<!--
                        Block start
                        <div class="block-area">
                             block title 
                            <div class="block-title-6">
                                <h4 class="h5 border-primary">
                                    <span class="bg-primary text-white">ख़बर राज्यों से</span>
                                </h4>
                            </div>
                            big post start
                            <div class="big-post">
                                <article class="card card-full hover-a mb-4">
                                    <div class="row">
                                        <div class="col-lg-6">
                                             thumbnail 
                                            <div class="ratio_360-202 image-wrapper">
                                                <a href="#">
                                                    <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="card-body pt-3 pt-lg-0">
                                                title
                                                <h2 class="card-title h1-sm h3-lg">
                                                    <a href="#">Leica D-Lux 7 compact camera with 17MP four-thirds sensor</a>
                                                </h2>
                                                 author, date and comments 
                                                <div class="card-text mb-2 text-muted small">
                                                    <span class="d-none d-sm-inline mr-1">
                                                        <a class="font-weight-bold" href="#">John Doe</a>
                                                    </span>
                                                    <time datetime="2019-10-21">Oct 21, 2019</time>
                                                    <span title="5 comment" class="float-right">
                                                        <span class="fa fa-comments" aria-hidden="true"></span> 5
                                                    </span>
                                                </div>
                                                description
                                                <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content...</p>
                                                read more button
                                                <a class="btn btn-outline-primary" href="#">Read more</a>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                            </div>
                            small post start
                            <div class="row small-post">
                                 post list 
                                <article class="col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img27.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">The Bride Was a Dream in a Dirndl, but Putin Stole the Show</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-19">Oct 19, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                 post list 
                                <article class="col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img28.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-9 col-md-8">
                                                 title & date 
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Quebec’s ‘Trash Radio’ Host Fires Up Outrage, and Big Ratings</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-18">Oct 18, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                 post list 
                                <article class="col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img29.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">The West Hoped for Democracy in Turkey. Erdogan Had Other Ideas</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-17">Oct 17, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                 post list 
                                <article class="col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        <div class="row">
                                            thumbnail
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_115-80 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/115x80/img30.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                             title & date 
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-lg">
                                                        <a href="#">Why Apple went to war with Facebook and Google this week</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-16">Oct 16, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </article>
                                 End post list 
                            </div>
                        </div>
                         End block 

                        Block start
                        <div class="block-area">
                            block title
                            <div class="block-title-6">
                                <h4 class="h5 border-primary">
                                    <span class="bg-primary text-white">बॉलीवुड</span>
                                </h4>
                            </div>
                             block content 
                            <div class="row">
                                post list
                                <article class="col-sm-6 col-md-12 col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        thumbnail
                                        <div class="ratio_360-202 image-wrapper">
                                            <a href="#">
                                                <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                            </a>
                                        </div>
                                        <a class="bg-full-shadow" href="#"></a>
                                        <div class="position-absolute px-3 top-3 w-100 z-index-5 text-center">
                                            title
                                            <a href="#">
                                                <h5 class="card-title h3 h4-sm h3-md text-white my-1">94 Easy Chicken Recipes for Fuss-Free Family Dinners</h5>
                                            </a>
                                            author
                                            <span class="d-inline d-sm-none d-md-inline mr-1">
                                                <a class="font-weight-bold text-white" href="#">John Doe</a>
                                            </span>
                                            date
                                            <time class="d-sm-none d-md-inline m-0 text-white" datetime="2019-10-21">Oct 21, 2019</time>
                                        </div>
                                    </div>
                                </article>
                                post list
                                <article class="col-sm-6 col-md-12 col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        thumbnail
                                        <div class="ratio_360-202 image-wrapper">
                                            <a href="#">
                                                <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                            </a>
                                        </div>
                                        <a class="bg-full-shadow" href="#"></a>
                                        <div class="position-absolute px-3 top-3 w-100 z-index-5 text-center">
                                            title
                                            <a href="#">
                                                <h5 class="card-title h3 h4-sm h3-md text-white my-1">5 Tips to Save Money Booking Your Next Hotel Room</h5>
                                            </a>
                                            author
                                            <span class="d-inline d-sm-none d-md-inline mr-1">
                                                <a class="font-weight-bold text-white" href="#">John Doe</a>
                                            </span>
                                            date
                                            <time class="d-sm-none d-md-inline m-0 text-white" datetime="2019-10-21">Oct 21, 2019</time>
                                        </div>
                                    </div>
                                </article>
                                post list
                                <article class="col-sm-6 col-md-12 col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        thumbnail
                                        <div class="ratio_360-202 image-wrapper">
                                            <a href="#">
                                                <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                            </a>
                                        </div>
                                        <a class="bg-full-shadow" href="#"></a>
                                        <div class="position-absolute px-3 top-3 w-100 z-index-5 text-center">
                                            title
                                            <a href="#">
                                                <h5 class="card-title h3 h4-sm h3-md text-white my-1">The 52 Places Traveler: Summer in France, in Two Very Different Ways</h5>
                                            </a>
                                            author
                                            <span class="d-inline d-sm-none d-md-inline mr-1">
                                                <a class="font-weight-bold text-white" href="#">John Doe</a>
                                            </span>
                                            date
                                            <time class="d-sm-none d-md-inline m-0 text-white" datetime="2019-10-21">Oct 21, 2019</time>
                                        </div>
                                    </div>
                                </article>
                                post list
                                <article class="col-sm-6 col-md-12 col-lg-6">
                                    <div class="card card-full hover-a mb-4">
                                        thumbnail
                                        <div class="ratio_360-202 image-wrapper">
                                            <a href="#">
                                                <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                            </a>
                                        </div>
                                        <a class="bg-full-shadow" href="#"></a>
                                        <div class="position-absolute px-3 top-3 w-100 z-index-5 text-center">
                                            title
                                            <a href="#">
                                                <h5 class="card-title h3 h4-sm h3-md text-white my-1">6 Simple Tips to Help Vegetarian or Vegan Travelers Eat Well, Anywhere</h5>
                                            </a>
                                            author
                                            <span class="d-inline d-sm-none d-md-inline mr-1">
                                                <a class="font-weight-bold text-white" href="#">John Doe</a>
                                            </span>
                                            date
                                            <time class="d-sm-none d-md-inline m-0 text-white" datetime="2019-10-21">Oct 21, 2019</time>
                                        </div>
                                    </div>
                                </article>
                                end post list
                                <div class="gap-05"></div>
                            </div>
                             end block content 
                        </div>
                        End Block-->
                    </div>
                    <!--end left column-->

                    <!--start right column-->
                    <aside class="col-md-4 right-sidebar-lg">
                        <div class="sticky">
                            <!--Social network 2-->
                            <aside class="widget">
                                <!-- widget title -->
                                <div class="block-title-4">
                                    <h4 class="h5 title-arrow">
                                        <span>न्यूज़ वीडियो</span>
                                    </h4>
                                </div>
                                <div id="newsvideo">
                                    <!-- widget content -->
                                </div>
                                <!-- end widget content -->
                                <div class="gap-15"></div>
                            </aside>

                            <!-- post with number -->
                            <aside class="widget">
                                <!--block title-->
                                <div class="block-title-4">
                                    <h4 class="h5 title-arrow">
                                        <span>फूड</span>
                                    </h4>
                                </div>
                                <!-- Block content -->
                                <ul class="post-number list-unstyled border-bottom-last-0 rounded mb-3">
                                    <li class="hover-a">
                                        <a class="h5 h6-md h5-lg" href="#">Why the world would end without political polls</a>
                                    </li>
                                    <li class="hover-a">
                                        <a class="h5 h6-md h5-lg" href="#">Meet The Man Who Designed The Ducati Monster</a>
                                    </li>
                                    <li class="hover-a">
                                        <a class="h5 h6-md h5-lg" href="#">2020 Audi R8 Spyder spy shots release</a>
                                    </li>
                                    <li class="hover-a">
                                        <a class="h5 h6-md h5-lg" href="#">Lamborghini makes Huracán GT3 racer faster for 2019</a>
                                    </li>
                                    <li class="hover-a">
                                        <a class="h5 h6-md h5-lg" href="#">ZF plans $14 billion autonomous vehicle push, concept van</a>
                                    </li>
                                </ul>
                                <!-- end block content -->
                                <div class="gap-0"></div>
                            </aside>
                            <!-- end post with number -->

                            <!-- latest post -->
                            <aside class="widget">
                                <!--Block title-->
                                <div class="block-title-4">
                                    <h4 class="h5 title-arrow">
                                        <span>टहेल्थ & फिटनेस</span>
                                    </h4>
                                </div>
                                <!--post big start-->
                                <div class="big-post">
                                    <article class="card card-full hover-a mb-4">
                                        <!--thumbnail-->
                                        <div class="ratio_360-202 image-wrapper">
                                            <a href="#">
                                                <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="" alt="Image description">
                                            </a>
                                        </div>
                                        <div class="card-body">
                                            <!--title-->
                                            <h2 class="card-title h1-sm h3-md">
                                                <a href="#">MotoGP: Which team needs what in 2019?</a>
                                            </h2>
                                            <!-- author & date -->
                                            <div class="card-text mb-2 text-muted small">
                                                <span class="d-none d-sm-inline mr-1">
                                                    <a class="font-weight-bold" href="#">John Doe</a>
                                                </span>
                                                <time datetime="2019-10-22">Oct 22, 2019</time>
                                            </div>
                                            <!--description-->
                                            <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                                        </div>
                                    </article>
                                </div>
                                <!--end post big-->
                                <!--post small start-->
                                <div class="small-post">
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img5.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-md">
                                                        <a href="#">Take the kids to Windermere Jetty, Lake District</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-16">Oct 16, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img6.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="h6 h4-sm h6-md">
                                                        <a href="#">Wave reviews: Under – Norway's new underwater restaurant</a>
                                                    </h3>
                                                    <div class="small text-muted">
                                                        <time datetime="2019-10-15">Oct 15, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img7.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="h6 h4-sm h6-md">
                                                        <a href="#">This U.S. Airline Has More Legroom Than Any Other</a>
                                                    </h3>
                                                    <div class="small text-muted">
                                                        <time datetime="2019-10-14">Oct 14, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--End post list-->
                                </div>
                                <!--end post small-->
                                <div class="gap-0"></div>
                            </aside>
                            <!-- end latest post -->

                            <!--Advertiser-->
                            <aside class="widget">
                                <div class="hover-a text-center">
                                    <!--title-->
                                    <div class="py-2">
                                        <img class="img-fluid bg-light" src="${pageContext.request.contextPath}/resources/images/tech5.jpg" alt="">
                                    </div>
                                    <!--content-->
                                    <a href="#" target="_blank">
                                        <img class="img-fluid bg-light" src="../../assets/img/ads/300-demo.png" alt="">
                                    </a>
                                </div>
                                <div class="gap-15"></div>
                            </aside>
                            <!--end advertiser-->
                        </div>
                    </aside>
                    <!--end right column-->

                    <!-- start full column -->
                    <div class="col-12 mb-4">
                        <!-- Block start -->
                        <div class="block-area p-4 border bg-light-black">
                            <!-- Block title -->
                            <div class="block-title-13">
                                <h4 class="h5 title-box-dot">
                                    <span>News9 स्पेशल  वीडियो</span>
                                </h4>
                                <div class="dot-line"></div>
                            </div>
                            <!-- block content -->
                            <div id="owl-carousel3" class="owl-carousel owl-theme">
                                <!-- item slider -->
                                <c:forEach items="${specialvideo}" var="specialvideoitem">

                                    <article class="item">
                                        <div class="col-12 mb-4">
                                            <div class="card card-full hover-a">
                                                <div class="ratio_327-278 image-wrapper">
                                                    <!-- thumbnail -->
                                                    <a href="#">
                                                        <iframe width="100%" height="auto" src="${specialvideoitem.videoLink}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                                 <!--  <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/400x340/img1.jpg" alt="Image description"> -->
                                                    </a>
                                                    <div class="position-absolute p-3 b-0 w-100 bg-shadow">
                                                        <!-- post title -->
                                                        <h4 class="h3 h4-sm h3-md card-title">
                                                            <a class="text-white" href="#">${specialvideoitem.title}</a>
                                                        </h4>
                                                        <!-- date & rating -->
                                                        <div class="small text-light">
                                                            <time datetime="2019-10-18">${specialvideoitem.datePlace}</time>
                                                            <!-- rating star -->
                                                            <div class="star-rating" title="4.2/5.0">
                                                                <div class="back-stars-light">
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                                    <div class="front-stars" style="width: 84%">
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                        <i class="fa fa-star" aria-hidden="true"></i>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <!-- end rating star -->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!-- item slider -->
                                </c:forEach>

                                <!-- item slider -->

                                <!-- end item slider -->
                            </div>
                            <!--end block content-->
                        </div>
                        <!-- End block -->
                    </div>
                    <!-- end full column -->

                    <!-- start left column -->
                    <div class="col-md-8">
                        <!-- block start -->
                        <div class="block-area">
                            <!-- block title -->
                            <div class="block-title-6">
                                <h4 class="h5 border-primary">
                                    <span class="bg-primary text-white">ख़बरें जरा हटके</span>
                                </h4>
                            </div>
                            <!-- block content -->
                            <div class="border-bottom-last-0 first-pt-0">
                                <!--post start-->
                                <c:forEach items="${khararhatke}" var="khabarhatkeitem">
                                    <article class="card card-full hover-a py-4">
                                        <div class="row">
                                            <div class="col-sm-6 col-md-12 col-lg-6">
                                                <!--thumbnail-->
                                                <div class="ratio_360-202 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/${khabarhatkeitem.folderPath}/${khabarhatkeitem.reporterImageName}" data-src="${pageContext.request.contextPath}/${khabarhatkeitem.folderPath}/${khabarhatkeitem.reporterImageName}" alt="${khabarhatkeitem.reporterImageName}">
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 col-md-12 col-lg-6">
                                                <div class="card-body pt-3 pt-sm-0 pt-md-3 pt-lg-0">
                                                    <!--title-->
                                                    <h3 class="card-title h2 h3-sm h2-md">
                                                        <a href="#">${khabarhatkeitem.title}</a>
                                                    </h3>
                                                    <!--author and date-->
                                                    <div class="card-text mb-2 text-muted small">
                                                        <span class="d-none d-sm-inline mr-1">
                                                            <a class="font-weight-bold" href="#"></a>
                                                        </span>
                                                        <time datetime="2019-10-21">${khabarhatkeitem.enteredOn}</time>
                                                    </div>
                                                    <!--description-->
                                                    <p class="card-text">${khabarhatkeitem.subheading}</p>
                                                    <!-- read more button -->
                                                    <a class="btn btn-outline-primary" href="#">Read more</a>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                </c:forEach>
                            </div>
                            <!-- end block content -->
                        </div>
                        <!--end block-->

                        <!--Pagination-->
                        <!--            <div class="clearfix my-4">
                                      <nav class="float-left" aria-label="Page navigation example">
                                        page number
                                        <ul class="pagination">
                                          <li class="page-item active"><span class="page-link">1</span></li>
                                          <li class="page-item"><a class="page-link" href="../category/category.html">2</a></li>
                                          <li class="page-item"><a class="page-link" href="../category/category.html">3</a></li>
                                          <li class="page-item"><a class="page-link" href="../category/category.html">4</a></li>
                                          <li class="page-item"><span class="page-link disabled">....</span></li>
                                          <li class="page-item"><a class="page-link" href="../category/category.html">12</a></li>
                                          <li class="page-item">
                                            <a class="page-link" href="../category/category.html" aria-label="Next" title="Next page">
                                              <span aria-hidden="true"><i class="fas fa-chevron-right"></i></span>
                                              <span class="sr-only">Next</span>
                                            </a>
                                          </li>
                                        </ul>
                                        end page number
                                      </nav>
                                      <span class="py-2 float-right">Page 1 of 12</span>
                                    </div>-->
                        <!--end pagination-->
                    </div>
                    <!-- end left column -->

                    <!-- start right column -->
                    <aside class="col-md-4 right-sidebar-lg">
                        <!-- sidebar sticky start -->
                        <div class="sticky">
                            <!--widget start-->
                            <aside class="widget">
                                <!-- block title -->
                                <div class="block-title-4">
                                    <h4 class="h5 title-arrow">
                                        <span>करियर</span>
                                    </h4>
                                </div>
                                <!-- block content -->
                                <div class="small-post">
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img1.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-md">
                                                        <a href="#">Apple's stock rout starts and ends with the iPhone</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-16">Oct 16, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img2.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h5-sm h6-md">
                                                        <a href="#">94 Easy Chicken Recipes for Fuss-Free Family Dinners</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-15">Oct 15, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img3.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h4-sm h6-md">
                                                        <a href="#">Ford reveals autonomous vehicle philosophies, priorities</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-14">Oct 14, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-4">
                                        <div class="row">
                                            <!--thumbnail-->
                                            <div class="col-3 col-md-4 pr-2 pr-md-0">
                                                <div class="ratio_110-77 image-wrapper">
                                                    <a href="#">
                                                        <img class="img-fluid lazy" src="${pageContext.request.contextPath}/resources/images/lazy-empty.png" data-src="../../assets/img/110x77/img4.jpg" alt="Image description">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-- title & date -->
                                            <div class="col-9 col-md-8">
                                                <div class="card-body pt-0">
                                                    <h3 class="card-title h6 h4-sm h6-md">
                                                        <a href="#">Bowen's Super Bowl LIII game plans: Which defense will get stops?</a>
                                                    </h3>
                                                    <div class="card-text small text-muted">
                                                        <time datetime="2019-10-16">Oct 16, 2019</time>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </article>
                                    <!--End post list-->
                                </div>
                                <!--end block content-->
                                <div class="gap-0"></div>
                            </aside>
                            <!--End widget-->

                            <!-- widget start -->
                            <aside class="widget">
                                <!-- widget content -->
                                <div class="p-4 border bg-light-dark text-center mb-4">
                                    <!--title-->
                                    <h4>Get Updates</h4>
                                    <p>Subscribe our newsletter to get the last update into your inbox!</p>
                                    <!--form start-->
                                    <div class="mx-auto">
                                        <form id="subscribe" class="needs-validation" action="#" novalidate="">
                                            <div class="input-group">
                                                <input type="email" class="form-control" name="email" required="" placeholder="Enter you email address">
                                                <span class="input-group-append">
                                                    <button class="btn btn-primary" type="submit">Subscribe</button>
                                                </span>
                                                <div class="invalid-feedback">
                                                    Please insert email address.
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <!--end form-->
                                    <p class="small text-center mt-3">hate spammers, and never spam</p>
                                </div>
                                <!-- end widget content -->
                                <div class="gap-0"></div>
                            </aside>

                            <!-- custom post -->
                            <aside class="widget">
                                <div class="block-title-4">
                                    <h4 class="h5 title-arrow"><span>लाइफस्टाइल</span></h4>
                                </div>
                                <!--style 2-->
                                <div class="small-post">
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-2">
                                        <div class="card-body pt-0">
                                            <!--title-->
                                            <h3 class="card-title h5">
                                                <a href="#">Fans celebrate in Paris after side reaches World Cup final</a>
                                            </h3>
                                            <!--date-->
                                            <div class="card-text small text-muted">
                                                <time datetime="2019-06-16">Jun 16, 2019</time>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-2">
                                        <div class="card-body pt-0">
                                            <!--title-->
                                            <h3 class="card-title h5">
                                                <a href="#">5 Tips to Save Money Booking Your Next Hotel Room</a>
                                            </h3>
                                            <!--date-->
                                            <div class="card-text small text-muted">
                                                <time datetime="2019-06-16">Jun 16, 2019</time>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-2">
                                        <div class="card-body pt-0">
                                            <!--title-->
                                            <h3 class="card-title h5">
                                                <a href="#">The 52 Places Traveler: Summer in France, in Two Very Different Ways</a>
                                            </h3>
                                            <!--date-->
                                            <div class="card-text small text-muted">
                                                <time datetime="2019-06-16">Jun 16, 2019</time>
                                            </div>
                                        </div>
                                    </article>
                                    <!--post list-->
                                    <article class="card card-full hover-a mb-2">
                                        <div class="card-body pt-0">
                                            <!--title-->
                                            <h3 class="card-title h5">
                                                <a href="#">6 Simple Tips to Help Vegetarian or Vegan Travelers Eat Well, Anywhere</a>
                                            </h3>
                                            <!--date-->
                                            <div class="card-text small text-muted">
                                                <time datetime="2019-06-16">Jun 16, 2019</time>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <div class="gap-0"></div>
                            </aside>
                        </div>
                        <!--end Sidebar sticky-->
                    </aside>
                    <!-- end right column -->
                </div>
            </div>
        </main>
        <!--End Content-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script>
function setForm() {
    newsvideo();
}
function newsvideo() {
    var url = '<%=Utils.ConnectionUtils.getConnectionURL()%>/newsvideo';
    $.ajax({
        url: url,
        type: "POST",
        dataType: 'json',
        ContentType: "text/html; charset=UTF-8",
        success: function (receipts) {
            var htmlText = '';
            $(receipts).each(function (index, item) {
                htmlText += '<iframe width="360" height="315" src="' + item.videoLink + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
            });
            $("#newsvideo").html(htmlText);

        }

    });
}
</script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    </body>
</html>