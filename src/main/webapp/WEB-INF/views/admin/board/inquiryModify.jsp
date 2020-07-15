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

<style>
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background: #eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }

.form-group label { font-weight:bold; }
</style>

</head>

<body>

<%@ include file="../includes/header.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            	<div>
					<h1>답변글 수정</h1>
				</div>
            
           		<div>
		<form role="form" action="/admin/board/inquiryModify" method="post">
		
		<input type="hidden" name="ibno" value="${inquiry.ibno }"/>

			<div class="form-group">
				<label>작성 날짜</label><br>
				<input class="form-control" name='iregDate' value="<fmt:formatDate pattern = "yyyy/MM/dd" value = "${inquiry.iregdate}" />" readonly>
			</div>
			
			<div class="form-group">
				<label>최종 수정 날짜</label><br>
				<input class="form-control" name='iupdateDate' value="<fmt:formatDate pattern = "yyyy/MM/dd" value = "${inquiry.iupdateDate}" />" readonly>
			</div>
			
			<div class="form-group">
				<label>작성자</label><br>
				<input class="form-control" name='iwriter' value="${inquiry.iwriter }" readonly>
			</div>

			<div class="form-group">
				<label>글번호</label><br>
				<input class="form-control" name='ibno' value="${inquiry.ibno }" readonly>
			</div>

			<div class="form-group">
				<label>제목</label><br>
				<input class="form-control" name='ititle' value="${inquiry.ititle }">
			</div>

			<div class="form-group">
				<label>내용</label><br>
				<textarea class="form-control" rows="6" cols="50" name='icontent'>${inquiry.icontent }</textarea>
				
				<script>
 					var ckeditor_config = {
 						resize_enaleb : false,
   						enterMode : CKEDITOR.ENTER_BR,
   						shiftEnterMode : CKEDITOR.ENTER_P,
   						filebrowserUploadUrl : "/admin/goods/ckUpload"
 					};
 
 					CKEDITOR.replace("gdsDes", ckeditor_config);
				</script>
			</div>
	
	<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
	<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
	
	<script>
 		$("#back_Btn").click(function(){
  		//history.back();
  		location.href = "/admin/board/inquiryGet?ibno=" + ${inquiry.ibno };
 		});   
	</script>

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