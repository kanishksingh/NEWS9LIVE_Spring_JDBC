<%-- 
    Document   : newsdetail
    Created on : 12 Jul, 2020, 11:41:33 PM
    Author     : KANISHK
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
		<script>
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=1266609856804400&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>  
                <script type="text/javascript" src="${pageContext.request.contextPath}/DashboardResources/js/jsapi.js"></script>


</head>

<body class="bg-repeat font-family" onload="Report();">

    <!--Content start-->
      <main id="content" class="bg- ">
      <div class="container">
        <div class="row">

		<div class="jump mt-0 mb-4 pt-4 col-md-8 bg-light">
                    <div class="post-content" style="    text-align: justify;">
		<h1 class="display-4 display-2-md font-weight-light">${khabardetail.title}</h1>
		<p class="lead font-weight-normal">${khabardetail.subheading}</p>
		<div class="my-3 text-muted small">
                  <!--author-->
                  <span class="d-none d-sm-inline">
                    by <a class="font-weight-bold" href="../category/author.html">${khabardetail.rName}</a>
                  </span>
                  <!--date-->
                  <time class="ml-0 ml-sm-2 ml-md-3" datetime="${khabardetail.enteredOn}">
                    <span class="fa fa-clock"></span> ${khabardetail.enteredOn}
                  </time>
                  <!--comments-->
                  <span class="ml-2 ml-md-3" title="5 comments">
                    <a class="text-muted" href="#comments"><span class="fa fa-comments"></span> 5 Comments</a>
                  </span>
                  <!--view-->
                  <span class="ml-2 ml-md-3">
                    <span class="fa fa-eye"></span> 1.230x view
                  </span>
                </div>
<img src="${pageContext.request.contextPath}/${khabardetail.folderPath}/${khabardetail.imagefirstName}" class="img mb-4">
<p>
${khabardetail.content}</p>
   <!-- if condition -->
   <c:if test="${!(khabardetail.imagefirstName).equals('')}">
  
<div class="entry-footer">
              <!-- tags -->
              <div class="tags-area">
                <ul class="tags-links tagcloud pl-0">
                  <li><span class="font-weight-bold mr-2">Tags</span></li>
                    <c:forTokens var="token" items="${khabardetail.tags}" delims=",">
                        <li><a href=""><c:out value="${token}"/></a></li>
        </c:forTokens>
               
                </ul>
              </div>
              <div class="gap-0"></div>
            </div>
   </c:if>
<hr>
<div class="media author-box py-3">
              <div class="media-figure">
                <a href="../category/author.html"><img class="avatar-lg avatar-rounded border img-fluid" src="${pageContext.request.contextPath}/${khabardetail.folderPath}/${khabardetail.reporterImageName}" alt="${khabardetail.rName}"></a>
              </div>
              <div class="ml-3 media-body">
                <!--name-->
                <h4 class="h5">
                  <span class="font-weight-bold">${khabardetail.rName}</span>
                </h4>
                <!-- website -->
                <p class="mb-1">अपडेटेड ${khabardetail.enteredOn}</p>
                <!--description-->
<!--                <p>Programmer, Father, Husband, I design and develop Bootstrap template, founder of Bootstrap.News</p>-->
                <!--social-->
                <div class="mt-2">
                  <a class="mr-2" href="#">
<!--                      <div class="fb-share-button" data-href="<%=Utils.ConnectionUtils.getConnectionURL()%>/newsdetail/${khabarsno}/${menusno}" data-layout="button" data-desc="${khabardetail.title}"></div>-->

                  <i class="fab fa-facebook fa-2x text-facebook"></i></a>
                  <a class="mr-2" href="#">
                      
                      <i class="fab fa-twitter fa-2x text-twitter"></i></a>
                  <a class="mr-2" href="#"><i class="fab fa-instagram fa-2x text-instagram"></i></a>
                  <a class="mr-2" href="#"><i class="fab fa-youtube fa-2x text-youtube"></i></a>
                  <a class="mr-2" href="#"><i class="fab fa-linkedin fa-2x text-linkedin"></i></a>
                </div>
                <!--end social-->
  <iframe width="100%" height="auto" src="${khabardetail.youtubeVideoLink}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

              </div>
            </div>
<hr>


<div class="prev-next-post pt-3 pb-5">
              <div class="row">
                <!-- Previous article -->
                <div class="col-12 col-md-6 prev-post-left">
                  <span class="d-block text-muted mb-3">« Previous article</span>
                  <a href="single2.html">Jacob deGrom Goes the Distance as Mets Top the Phillies</a>
                </div>
                <!-- Next article -->
                <div class="col-12 col-md-6 next-post-right">
                  <span class="d-block text-muted mb-3">Next article »</span>
                  <a href="single3.html">The 52 Places Traveler: Summer in France, in Two Very Different Ways</a>
                </div>
              </div>
            </div>

<div class="block-title-6">
                <h4 class="h5 border-primary border-2">
                  <span class="bg-primary text-white">5 Comments</span>
                </h4>
              </div>

              <ol class="comment-list">
                <li>
                  <div class="user-comment u-hover">
                    <footer>
                      <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar1.png" alt="avatar">
                      <div class="title-comments">
                        <a class="authors" href="#" target="_blank">Jennifer Tan</a>
                        <span class="text-muted dates small">
                          <time datetime="2019-10-27">Oct 27, 2019 at 12:11 am</time>
                        </span>
                      </div>
                    </footer>
                    <div class="comment-content">
                      <p>News magazine bootstrap themes!</p>
                    </div>
                    <div class="btn-reply">
                      <a class="comment-reply" href="#comment-form">Reply</a>
                    </div>
                  </div>
                </li>
                <li>
                  <div class="user-comment u-hover">
                    <footer>
                      <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar2.png" alt="avatar">
                      <div class="title-comments">
                        <a class="authors" href="#" target="_blank">Carlos vila</a>
                        <span class="text-muted dates small">
                          <time datetime="2019-10-27">Oct 27, 2019 at 15:11 am</time>
                        </span>
                      </div>
                    </footer>
                    <div class="comment-content">
                      <p>I like this themes, fast loading and look profesional</p>
                    </div>
                    <div class="btn-reply">
                      <a class="comment-reply" href="#comment-form">Reply</a>
                    </div>
                  </div>
                  <ul class="list-unstyled sub-comment">
                    <li>
                      <div class="user-comment u-hover">
                        <footer>
                          <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar1.png" alt="avatar">
                          <div class="title-comments">
                            <a class="authors" href="#" target="_blank">Jennifer Tan</a>
                            <span class="text-muted dates small">
                              <time datetime="2019-10-27">Oct 27, 2019 at 16:11 am</time>
                            </span>
                          </div>
                        </footer>
                        <div class="comment-content">
                          <p>Thank you Carlos!</p>
                        </div>
                        <div class="btn-reply">
                          <a class="comment-reply" href="#comment-form">Reply</a>
                        </div>
                      </div>
                      <ul class="list-unstyled sub-comment">
                        <li class="comment " id="comment-5">
                          <div class="user-comment u-hover">
                            <footer>
                              <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar2.png" alt="avatar">
                              <div class="title-comments">
                                <a class="authors" href="#" target="_blank">Carlos vila</a>
                                <span class="text-muted dates small">
                                  <time datetime="2019-10-27">Oct 27, 2019 at 17:11 am</time>
                                </span>
                              </div>
                            </footer>
                            <div class="comment-content">
                              <p>You're welcome!</p>
                            </div>
                            <div class="btn-reply">
                              <a class="comment-reply" href="#comment-form">Reply</a>
                            </div>
                          </div>
                        </li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li>
                  <div class="user-comment u-hover">
                    <footer>
                      <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar1.png" alt="avatar">
                      <div class="title-comments">
                        <a class="authors" href="#" target="_blank">Jennifer Tan</a>
                        <span class="text-muted dates small">
                          <time datetime="2019-10-27">Oct 27, 2019 at 17:11 am</time>
                        </span>
                      </div>
                    </footer>
                    <div class="comment-content">
                      <p>Please support me with give positive rating!</p>
                    </div>
                    <div class="btn-reply">
                      <a class="comment-reply" href="#comment-form">Reply</a>
                    </div>
                  </div>
                  <ul class="list-unstyled sub-comment">
                    <li>
                      <div class="user-comment u-hover">
                        <footer>
                          <img class="avatar-md border img-fluid float-left mr-3" src="../../assets/img/avatar/avatar2.png" alt="avatar">
                          <div class="title-comments">
                            <a class="authors" href="#" target="_blank">Carlos vila</a>
                            <span class="text-muted dates small">
                              <time datetime="2019-10-27">Oct 27, 2019 at 16:15 am</time>
                            </span>
                          </div>
                        </footer>
                        <div class="comment-content">
                          <p>Yes Sure!</p>
                        </div>
                        <div class="btn-reply">
                          <a class="comment-reply" href="#comment-form">Reply</a>
                        </div>
                      </div>
                    </li>
                  </ul>
                </li>
              </ol>
<div id="comment-form" class="my-5">
                <h3 class="h6 h4-md">LEAVE A REPLY</h3>
                <p>Your email address will not be published</p>
                <div class="comment-form">
                  <form class="needs-validation" action="single1.html" novalidate="">
                    <div class="mt-2"></div>
                    <div class="form-group">
                      <textarea class="form-control" placeholder="Comment" id="Comment" name="Comment" rows="4" required=""></textarea>
                      <div class="invalid-feedback">Please insert your comment</div>
                    </div>
                    <div class="form-group">
                      <input class="form-control" placeholder="Name" type="text" required="">
                      <div class="invalid-feedback">Please insert your name</div>
                    </div>
                    <div class="form-group">
                      <input class="form-control" placeholder="Email" type="text" required="">
                      <div class="invalid-feedback">Please insert your email address</div>
                    </div>
                    <div class="form-group">
                      <input class="form-control" placeholder="Website:" type="text">
                    </div>
                    <div class="form-group">
                      <p class="comment-form-cookies">
                        <input id="comment-cookies" name="comment-cookies" type="checkbox" value="yes">
                        <label for="comment-cookies">Save my name, email, and website in this browser for the next time I comment.</label>
                      </p>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-primary">Post Comment</button>
                    </div>
                  </form>
                </div>
              </div>
</div>
		</div>

		<aside class="col-md-4 right-sidebar-lg">
            <!--sticky-->
            <div class="sticky is_stuck">
              <!--Advertiser-->
              <aside class="widget">
                <div class="hover-a text-center">
                  <!--title-->
                   
                  <!--content-->
                   
                </div>
                 
              </aside>
              <!--end advertiser-->
 

              <!-- latest post -->
              <aside class="widget">
                <!--Block title-->
                <div class="block-title-4">
                  <h4 class="h5 title-arrow">
                    <span>सम्बंधित खबर</span>
                  </h4>
                </div>
                <!--post big start-->
<!--                <div class="big-post">
                  <article class="card card-full hover-a mb-4">
                    thumbnail
                    <div class="ratio_360-202 image-wrapper">
                      <a href="#">
                        <img class="img-fluid lazy loaded" src="../../assets/img/360x202/img55.jpg" data-src="../../assets/img/360x202/img55.jpg" alt="Image description" data-was-processed="true">
                      </a>
                    </div>
                    <div class="card-body">
                      title
                      <h2 class="card-title h1-sm h3-md">
                        <a href="#">MotoGP: Which team needs what in 2019?</a>
                      </h2>
                       author & date 
                      <div class="card-text mb-2 text-muted small">
                        <span class="d-none d-sm-inline mr-1">
                          <a class="font-weight-bold" href="#">John Doe</a>
                        </span>
                        <time datetime="2019-10-22">Oct 22, 2019</time>
                      </div>
                      description
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                    </div>
                  </article>
                </div>-->
                <!--end post big-->
                <!--post small start-->
                <div class="small-post" id="relatednews">
                  <!--post list-->
                  Content Loading...
                  <!--post list-->

                  <!--End post list-->
                </div>
                <!--end post small-->
                <div class="gap-0"></div>
              </aside>
              <!-- end latest post -->
            </div><div style="position: static; width: 344.984px; height: 1367.31px; display: block; vertical-align: baseline; float: none;"></div>
            <!--End sticky-->
          </aside>

        	</div>
        </div>
    </main>
    <!--End Content-->
    <script>
               function Report() {
                var menu=${menusno};
                var khabarsno=${khabarsno};
                var url='<%=Utils.ConnectionUtils.getConnectionURL()%>/relatednews/'+menu+'/'+khabarsno+'';
     jQuery.ajax({
    type: 'POST',
    url: url,
    dataType: 'json', // ** ensure you add this line **
   contentType: "application/json",
    success: function(data) {
     $('#relatednews').empty();
     var htmlText = '';
     if(data==""){
          htmlText += '<article class="card card-full hover-a mb-4">';
  htmlText += '<div class="row" >';
  htmlText += '<div class="col-12 col-md-12">';
  htmlText += '<div class="card-body pt-0">';
  htmlText += '<h3 class="card-title h6 h5-sm h6-md">';
  htmlText += '<a href="#">कोई संबंधित डेटा नहीं मिला</a>';
  htmlText += '</h3>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '</article>';
     }else{
for (var key in data) {
  htmlText += '<article class="card card-full hover-a mb-4">';
  htmlText += '<div class="row" >';
  htmlText += '<div class="col-3 col-md-4 pr-2 pr-md-0">';
  htmlText += '<div class="ratio_110-77 image-wrapper">';
  htmlText += '<a href="${pageContext.request.contextPath}/newsdetail/'+data[key].sno+'/'+menu+'">';
  htmlText += '<img class="img-fluid lazy loaded" style="height: 75px;" src="${pageContext.request.contextPath}/'+data[key].folderPath+'/'+data[key].imagefirstName+'" data-src="${pageContext.request.contextPath}/'+data[key].folderPath+'/'+data[key].imagefirstName+'" alt="'+data[key].imagefirstName+'" data-was-processed="true">';
  htmlText += '</a>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '<div class="col-9 col-md-8">';
  htmlText += '<div class="card-body pt-0">';
  htmlText += '<h3 class="card-title h6 h5-sm h6-md">';
  htmlText += '<a href="${pageContext.request.contextPath}/newsdetail/'+data[key].sno+'/'+menu+'">'+data[key].title+'</a>';
  htmlText += '</h3>';
  htmlText += '<div class="card-text small text-muted">';
  htmlText += '<time datetime="'+data[key].enteredOn+'">'+data[key].enteredOn+'</time>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '</div>';
  htmlText += '</article>';

}
     }
$('#relatednews').append(htmlText);
    },
    error: function(XMLHttpRequest, textStatus, errorThrown) {
        alert("some error");
    }
});
    }
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
                var ids = ["Comment"];
                control.makeTransliteratable(ids);

                // Show the transliteration control which can be used to toggle between English and Hindi and also choose other destination language.
                control.showControl('translControl');
            }

            google.setOnLoadCallback(onLoad);
        </script>

</body>

</html>
