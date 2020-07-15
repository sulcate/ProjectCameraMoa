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
					<h1>상품 수정</h1>
				</div>
            
           		<div>
		<form role="form" action="/admin/goods/modify" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="gdsNum" value="${goods.gdsNum }"/>

			<div class="form-group">
				<label>상품분류</label> <select id="selectBox" name='cateCode'>
					<option value="전체" selected>전체</option>
						<option <c:if test="${goods.cateCode eq 'SLR 카메라' }">selected="selected"</c:if>>SLR 카메라</option>
						<option <c:if test="${goods.cateCode eq '미러리스 카메라' }">selected="selected"</c:if>>미러리스 카메라</option>
						<option <c:if test="${goods.cateCode eq '콤팩트 카메라' }">selected="selected"</c:if>>콤팩트 카메라</option>
						<option <c:if test="${goods.cateCode eq '렌즈' }">selected="selected"</c:if>>렌즈</option>
						<option <c:if test="${goods.cateCode eq '액세서리' }">selected="selected"</c:if>>액세서리</option>
				</select>
			</div>

			<div class="form-group">
				<label>상품명</label><br>
				<input class="form-control" name='gdsName' value="${goods.gdsName }">
			</div>

			<div class="form-group">
				<label>브랜드</label><br>
				<input class="form-control" name='gdsBrand' value="${goods.gdsBrand }">
			</div>

			<div class="form-group">
				<label>판매가격</label><br>
				<input class="form-control" id="gdsPrice" name='gdsPrice' value="${goods.gdsPrice }">
			</div>

			<div class="form-group">
				<label>상품수량</label><br>
				<input class="form-control" id="gdsStock" name='gdsStock' value="${goods.gdsStock }">
			</div>

			<div class="form-group">
				<label>상세 설명</label><br>
				<textarea class="form-control" rows="6" cols="50" name='gdsDes'>${goods.gdsDes }</textarea>
				
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

	<div>
		<label for="gdsImg">이미지</label>
		<input type="file" id="gdsImg" name="file" />
		<div class="select_img">
			<img src="${goods.gdsImg }" width="300px", height="auto" />
			<input type="hidden" name="gdsImg" value="${goods.gdsImg }" />
			<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg }" />
		</div>

		<script>
		$("#gdsImg").change(function() {
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$(".select_img img").attr("src", data.target.result).width(300);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		</script>
		
		<%=request.getRealPath("/") %>
		
	</div>
	
	<button type="submit" id="update_Btn" class="btn btn-primary">완료</button>
	<button type="button" id="back_Btn" class="btn btn-warning">취소</button>
	
	<script>
 		$("#back_Btn").click(function(){
  		//history.back();
  		location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
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
	
	<script>
	var regExp = /[^0-9]/gi;
	
	$("#gdsPrice").keyup(function() { numCheck($(this)); });
	$("#gdsStock").keyup(function() { numCheck($(this)); });
	
	function numCheck(selector) {
		var tempVal = selector.val();
		selector.val(tempVal.replace(regExp, ""));
	}
	</script>
            </div>    
        </div>
        <!-- /#page-wrapper -->

<%@ include file="../includes/footer.jsp" %>

</sec:authorize>