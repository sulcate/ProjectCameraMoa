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
		<h1>상품 등록 페이지</h1>
	</div>

	<div>
		<form role="form" action="/admin/goods/register" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label>상품분류</label> <select id="selectBox" name='cateCode'>
					<option value="none" selected>--</option>
						<option>SLR 카메라</option>
						<option>미러리스 카메라</option>
						<option>콤팩트 카메라</option>
						<option>렌즈</option>
						<option>액세서리</option>
				</select>

			</div>


			<div class="form-group">
				<label>상품명</label><br> <input class="form-control" name='gdsName' required="required">
			</div>

			<div class="form-group">
				<label>브랜드</label><br> <input class="form-control" name='gdsBrand' required="required">
			</div>

			<div class="form-group">
				<label>판매가격</label><br> <input class="form-control" id="gdsPrice" name='gdsPrice' required="required">
			</div>

			<div class="form-group">
				<label>상품수량</label><br> <input class="form-control" id="gdsStock" name='gdsStock' required="required">
			</div>

			<div class="form-group">
				<label>상세 설명</label><br>
				<textarea class="form-control" cols="50" rows="6" id="gdsDes" name='gdsDes'></textarea>
				
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
		<div class="select_img"><img src="" /></div>

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
	
	<button id="btnReg" type="submit">등록</button>

		</form>
	</div>
	
	<script>
	
	$("#btnReg").click(function(e){
		if ($("#selectBox").val() == 'none') {
			e.preventDefault();
			console.log("if문 작동하는지");
			alert("상품분류를 선택 해주세요.");
		}
	});
	
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