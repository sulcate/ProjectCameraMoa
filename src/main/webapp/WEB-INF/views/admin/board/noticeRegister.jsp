<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication property="principal.username" var="userid" />

<html lang="en">

<head>

<script src="/resources/js/jquery-3.2.1.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/pluginsAdmin/images/favicon.png">
    <title>Pixel Admin - Responsive Admin Dashboard Template built with Twitter Bootstrap</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrapAdmin/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="/resources/pluginsAdmin/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="/resources/pluginsAdmin/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="/resources/pluginsAdmin/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/resources/cssAdmin/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/cssAdmin/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="/resources/cssAdmin/colors/blue-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>

<%@ include file="../includes/header.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
           		<div>
		<h1>공지사항 등록</h1>
	</div>

	<div>
		<form role="form" action="/admin/board/noticeRegister" method="post" enctype="multipart/form-data">
		
			<div class="form-group">
				<label>작성자</label><br> <input class="form-control" name='nwriter' value='<sec:authentication property="principal.username"/>' readonly>
			</div>
		
			<div class="form-group">
				<label>제목</label><br> <input class="form-control" name='ntitle' required="required">
			</div>

			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" rows="10" name='ncontent' required="required"></textarea>
			</div>
	
	<button type="submit" class="btn btn-info">글 등록</button>

		</form>
	</div>
	
            </div>    
        </div>
        <!-- /#page-wrapper -->
    
<%@ include file="../includes/footer.jsp" %>

</sec:authorize>