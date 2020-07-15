<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication property="principal.username" var="userid" />

<html lang="en">

<head>
<script src="/resources/js/jquery-3.2.1.min.js"></script>

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

<style>
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background: #eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
.form-group label { font-weight:bold; }
.form-control {
    background-color: #fff;
    border: 1px solid #e4e7ea;
    border-radius: 0;
    box-shadow: none;
    color: #565656;
    height: 38px;
    max-width: 100%;
    padding: 7px 12px;
    transition: all 300ms linear 0s;
}
</style>

</head>

<body>

<%@ include file="../includes/header.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
           		<div>
		<h1>공지사항 읽기</h1>
	</div>

	<div>
		<form role="form" method="post">
		
		<input type="hidden" name="n" value="${notice.nbno}"/>

			<div class="form-group">
				<label>글번호</label><br>
				<input class="form-control" value="${notice.nbno }" readonly>
			</div>

			<div class="form-group">
				<label>제목</label><br>
				<input class="form-control" value="${notice.ntitle }" readonly>
			</div>

			<div class="form-group">
				<label>내용</label><br>
				<textarea class="form-control" rows="10" cols="50" name='gdsDes' readonly>${notice.ncontent }</textarea>
			</div>
			
			<div class="form-group">
				<label>작성자</label><br>
				<input class="form-control" value="${notice.nwriter }" readonly>
			</div>
	
	<div class="form-group">
		<button type="button" id="modify_Btn" class="btn btn-info">수정</button>
		<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
		
		<script>
			var formObj = $("form[role='form']");
			
			$("#modify_Btn").click(function(){
				formObj.attr("action", "/admin/board/noticeModify");
				formObj.attr("method", "get")
				formObj.submit();
			});
			
			$("#delete_Btn").click(function(){
				
				var con = confirm("정말로 삭제하시겠습니까?");
				
				if(con) {
					formObj.attr("action", "/admin/board/noticeRemove");
					formObj.submit();
				}
			});
		</script>
		
	</div>

		</form>
	</div>

	<script>
		$(document).ready(function(e) {
		var formObj = $("form[role='form']");
		
		$("button[type='submit']").on("click",function(e) {
			e.preventDefault();
			console.log("submit clicked");
			
			formObj.submit();
		});
	});

</script>
            </div>    
        </div>
        <!-- /#page-wrapper -->
        
<%@ include file="../includes/footer.jsp" %>

</sec:authorize>