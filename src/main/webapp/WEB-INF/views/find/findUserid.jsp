<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<title>아이디찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="/resources/images/icons/favicon.ico" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<!--===============================================================================================-->

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
			<span class="login100-form-title p-b-32"> 아이디 찾기 </span>
			<!-- 아이디 찾기 -->
			<form action="/find/findUseridResult" method="post"
				class="login100-form validate-form flex-sb flex-w" id="findidForm"
				name="findidForm">

				<span class="txt1 p-b-11"> User Name </span>
				<div class="wrap-input100 validate-input m-b-36">
					<input type="text" id="userName" name="userName"
						placeholder="가입한 이름" required class="input100" autofocus> <span
						class="focus-input100"></span>
				</div>

				<span class="txt1 p-b-11"> User Email </span>
				<div class="wrap-input100 validate-input m-b-36">
					<input type="text" id="userEmail" name="userEmail"
						placeholder="가입한 이메일" required class="input100"> <span
						class="focus-input100"></span>
				</div>
				<div class="container-login200-form-btn">
					<button id="findidBtn" type="submit" class="login100-form-btn">아이디 찾기</button>
				</div>
				<div class="container-login200-form-btn">
					<a href="/user/login"><button type="button"
							class="login100-form-btn">뒤로가기</button></a>
				</div>
			</form>
		</div>
	</div>
</div>


<script type='text/javascript'>
	$(document).ready(function(event) {
		$("#findidBtn").on("click", function() {

			if ($("#userName").val() != "" && $("#userEmail").val() != "" ) {
				$.ajax({
					url : "/find/findUseridCheck",
					type : "POST",
					dataType : "json",
					data : $("#findidForm").serializeArray(),
					success : function(data) {
						if (data == 0) {
							alert("등록된 정보가 없습니다. 다시 입력해주세요.");
							event.preventDefault();
						} else {
							document.findidForm.submit();
						}
					}
				})
			}

		});
	})
</script>


</body>
</html>


<%@ include file="../includes/footer.jsp"%>