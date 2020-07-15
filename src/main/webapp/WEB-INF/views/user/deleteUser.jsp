<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">

<div class="limiter">
	<div class="container-login100">
		<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
			<div class="flex-sb-m w-full p-b-36">
				<h3>회원 탈퇴하시겠습니까?</h3>
			</div>
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.username" var="userid" />
				<!-- "principal.username"값을user_id 이라는 이름으로 지정  -->
				<div class="flex-sb-m w-full p-b-36">
					<div id="userid">${userid }님의비밀번호를입력해주세요.</div>
				</div>
			</sec:authorize>
			<form role="form" action="/user/deleteUser" method="post"
				class="login100-form validate-form flex-sb flex-w" name="delForm"
				id="delForm">
				<div class="wrap-input100 validate-input m-b-36">
					<input class="input100" type="password" name="userpw" id="userpw"
						placeholder="비밀번호" required><span class="focus-input100"></span>
				</div>
				<input type="text" style="display: none;" /> <input type="text"
					style="display: none;" />
				<div class="container-login200-form-btn">
					<button class="login100-form-btn" type="button" id="deleteBtn">회원탈퇴</button>
				</div>
				<div class="container-login200-form-btn">
					<a href="/"><button type="button" class="login100-form-btn">취소</button></a>
				</div>
			</form>
		</div>
	</div>
</div>



<script type='text/javascript'>
	$(document).ready(function() {
		$("#deleteBtn").on("click", function() {

			if ($("#userpw").val() != "") {
				$.ajax({
					url : "/user/checkPw",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success : function(data) {
						if (data == false) {
							alert("비밀번호가 틀렸습니다.");
							return;
						} else {
							if (confirm("정말 탈퇴하시겠습니까?")) {
								document.delForm.submit();
							} else
								return false;
						}
					}
				})
			} else
				alert("비밀번호를 입력해주세요.")

		});
	})
</script>



<%@ include file="../includes/footer.jsp"%>