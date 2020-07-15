<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<title>Login</title>
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
			<span class="login100-form-title p-b-32"> 로그인 </span>
			<form role="form" method="post" action="/user/login"
				class="login100-form validate-form flex-sb flex-w">
				<span class="txt1 p-b-11"> User Id </span>
				<div class="wrap-input100 validate-input m-b-36">
					<input id="userid" type="text" name="userid" placeholder="아이디"
						autofocus class="input100" required="required"> <span
						class="focus-input100"></span>
				</div>

				<span class="txt1 p-b-11"> Password </span>
				<div class="wrap-input100 validate-input m-b-12"
					data-validate="Password is required">
					<span class="btn-show-pass"> </span> <input class="input100"
						type="password" name='userpw' placeholder="비밀번호"> <span
						class="focus-input100"></span>
				</div>

				<h4 class="txt4">
					<c:out value="${error }" />
				</h4>
				<h4 class="txt4">
					<c:out value="${logout }" />
				</h4>

				<div class="flex-sb-m w-full p-b-48">
					<div class="contact100-form-checkbox" style="width:195px;">
						<input class="input-checkbox100" id="ckb1" type="checkbox"
							name="remember-me"> <label class="label-checkbox100"
							for="ckb1"> 자동 로그인 </label>
					</div>

					<div class="container-login100-form-btn p-l-128">
						<button class="login100-form-btn" type="submit" data-oper="login">Login</button>
					</div>
				</div>

				<div class="flex-sb-m w-full p-b-10">
					<div class="txt3">
						아직 회원이 아니신가요? <a
							href="${pageContext.request.contextPath}/user/register"
							class="txt1" style="color:#007bff">회원가입하기</a>

					</div>
				</div>

				<div class="flex-sb-m w-full p-b-48">
					<div class="container-login100-form-btn">
						<a href="/find/findUserid" class="txt1" style="color:#007bff">아이디</a>&nbsp;/&nbsp;
						<div>
							<div class="container-login100-form-btn">
								<a href="/find/findUserpw" class="txt1" style="color:#007bff">비밀번호 찾기</a>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>







<script>
	$(document).ready(function() {
		console.log("포커스실행");
		$("#userid").focus();
	});
</script>




</body>
</html>

<%@ include file="../includes/footer.jsp"%>