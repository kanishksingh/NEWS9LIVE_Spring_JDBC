<%-- 
    Document   : 500Error
    Created on : 20 Jul, 2020, 8:16:34 PM
    Author     : KANISHK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
    body {
    background: #dedede;
}
.page-wrap {
    min-height: 100vh;
}
</style>
<div class="page-wrap d-flex flex-row align-items-center">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12 text-center">
                <span class="display-1 d-block">Error Page</span>
                <div class="mb-4 lead">The page you are looking for was not found Or Check Your Internet Connection.</div>
                <a href="${pageContext.request.contextPath}/" class="btn btn-link">Back to Home</a>
            </div>
        </div>
    </div>
</div>
