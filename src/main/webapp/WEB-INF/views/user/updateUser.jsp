<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<title>내 정보 수정</title>
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
		<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55 m-t-200 m-b-55">
			<span class="login100-form-title p-b-32"> 내 정보 수정 </span>

			<form role="form" method="POST" action="/user/updateUser.do"
				class="login100-form validate-form flex-sb flex-w" name="udpateForm"
				id="updateForm" onsubmit="return checkForm();">


				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.username" var="userid" />
					<!-- 아이디 -->
					<span class="txt1 p-b-11">Userid</span>
					<div class="wrap-input100 validate-input m-b-36"
						data-validate="Username is required">
						<input class="input100" type="text" name="userid" id="userid"
							value="${userid }" readonly="readonly" maxlength=15
							style="background-color: #e2e2e2;">
					</div>
				</sec:authorize>


				<span class="txt1 p-b-11">Password</span>

				<div class="wrap-input100 validate-input m-b-36">
					<div class="pw">
						<input class="input100" type="password" name="userpw" id="userpw"
							placeholder="비밀번호" required><span class="focus-input100"></span><input
							type="hidden" id="pwCheckVal" value="N">
					</div>
				</div>
				<div class="txt4" id="pw-error">비밀번호는 영문,숫자,특수문자를 조합한 최소 8자리
					이상만 가능합니다.</div>

				<!-- 비밀번호 재확인 -->
				<span class="txt1 p-b-11">Password Confirm</span>
				<div class="wrap-input100 validate-input m-b-36">
					<div class="pw2">
						<input class="input100" type="password" name="userpw2"
							id="userpw2" placeholder="비밀번호 확인" required maxlength=20><span
							class="focus-input100"></span><input type="hidden"
							id="pw2CheckVal" value="N">
					</div>
				</div>

				<div class="txt5" id="pw-success">비밀번호가 일치합니다.</div>
				<div class="txt4" id="pw-danger">비밀번호가 일치하지 않습니다.</div>


				<!-- 이름 -->
				<div class="flex-sb-m w-full">
					<span class="txt1 p-b-11">Name</span>
				</div>
				<div class="flex-sb-m w-full ">
					<div class="wrap-input100 validate-input m-b-36">
						<input class="input100" type="text" name="userName"
							value="${member.userName }" required><span
							class="focus-input100"></span>
					</div>
				</div>


				<!-- 본인확인 이메일 -->
				<span class="txt1 p-b-11">E-mail</span>
				<div class="wrap-input100 validate-input m-b-36">
					<input class="input100" type="text" name="userEmail"
						value="${member.userEmail }" required id="userEmail"
						readonly="readonly" style="background-color: #e2e2e2;">
				</div>



				<!-- 휴대전화 -->
				<span class="txt1 p-b-11">Phone</span>
				<div class="wrap-input100 validate-input m-b-36"
					data-validate="Username is required">
					<input class="input100" type="text" name="userPhone" id='userPhone'
						value="${member.userPhone }" required maxlength=11><span
						class="focus-input100"></span><input type="hidden" id="phCheckVal"
						value="Y">
				</div>
				<div class="txt4" id="ph-error">'-'없이 휴대전화 번호 11자리를 입력해주세요.</div>





				<!-- 주소 -->
				<span class="txt1 p-b-11">Address</span>

				<div class="wrap-input1001 validate-input m-b-15">
					<input type="button" onclick="sample3_execDaumPostcode()"
						value="우편번호 찾기">
				</div>


				<div class="wrap-input100 validate-input m-b-15">
					<input class="input100" type="text" id="sample3_postcode"
						value='${member.userZipCode }' readonly="readonly"
						name="userZipCode" required><span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-15">
					<input class="input100" type="text" id="sample3_address"
						value="${member.userFirAddr }" readonly="readonly"
						name="userFirAddr" required><span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-15">
					<input class="input100" type="text" id="sample3_extraAddress"
						value="${member.userAddrDetail }" name="userAddrDetail"
						readonly="readonly"><span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input m-b-15">
					<input class="input100" type="text" id="sample3_detailAddress"
						value="${member.userSecAddr }" name="userSecAddr" required><span
						class="focus-input100"></span>
				</div>
				<div id="wrap"
					style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
						id="btnFoldWrap"
						style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
						onclick="foldDaumPostcode()" alt="접기 버튼">
				</div>
				<br />
				<div class="container-login200-form-btn">
					<button name="updateBtn" id="updateBtn" type="submit"
						class="login100-form-btn">수정하기</button>
				</div>
				<div class="container-login200-form-btn">
					<a href="/user/deleteUser">
						<button type="button" class="login100-form-btn">회원탈퇴</button>
					</a>
				</div>


			</form>
		</div>
	</div>
</div>














<script>
	$(document)
			.ready(
					function() {
						/* 아이디 a-z,0-9, 5자리부터15자리까지 */
						var idReg = /^[a-za-z0-9]{5,15}$/;
						var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
						var emReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
						var phReg = /^[0-9]{11}$/;

						$("#pw-success").hide();
						$("#pw-danger").hide();
						$("#pw-error").hide();

						$("#em-success").hide();
						$("#em-danger").hide();
						$("#em-error").hide();

						$("#ph-error").hide();

						/* 비밀번호 유효성 체크  */
						$(".pw")
								.keyup(
										function() {
											console.log("비번 유효성 검사");
											var pwd1 = $("#userpw").val();

											if (pwd1 != "") {
												if (!pwReg.test($("#userpw")
														.val())) {
													$("#pw-success").hide();
													$("#pw-danger").hide();
													$("#pw-error").show();
													document
															.getElementById("pwCheckVal").value = 'N';
												} else if (pwReg.test($(
														"#userpw").val())) {
													$("#pw-error").hide();
													$("#pw-success").hide();
													$("#pw-danger").hide();
													document
															.getElementById("pwCheckVal").value = 'Y';
												}

											}
										});
						/* 비밀번호 일치 체크  */
						$(".pw2")
								.keyup(
										function() {
											console.log("비번 일치 검사");
											var pwd1 = $("#userpw").val();
											var pwd2 = $("#userpw2").val();

											if (pwd1 != "" || pwd2 != "") {

												if (pwd1 != pwd2) {
													if (pwd2 != "") {
														console.log("불일치");
														$("#pw-success").hide();
														$("#pw-danger").show();
														$("#pw-error").hide();
														document
																.getElementById("pw2CheckVal").value = 'N';
													}

												} else {
													console.log("else문 실행여부");
													$("#pw-success").show();
													$("#pw-danger").hide();
													$("#pw-error").hide();
													document
															.getElementById("pw2CheckVal").value = 'Y';
												}

											}
										});
						/* 휴대전화 유효성 체크 */
						$("#userPhone")
								.keyup(
										function() {
											console.log("ph유효검사");
											if ($("#userPhone").val() != " ") {
												if (phReg.test($("#userPhone")
														.val())) {
													$("#ph-error").hide();
													document
															.getElementById("phCheckVal").value = 'Y';
													console.log("phValueY");
												} else if (!phReg.test($(
														"#userPhone").val())) {
													$("#ph-error").show();
													document
															.getElementById("phCheckVal").value = 'N';
													console.log("phValueN");
												}
											}

										});
					});/* document ready 끝 */
	/*------------------------------ 버튼 클릭시 이벤트 제어 함수----------------------------------------- */

	function checkForm() {
		console.log("버튼제어함수동작");
		if (document.getElementById("pwCheckVal").value == 'N') {
			console.log("비번유효성막기");
			$("#userpw").focus();
			return false;
		}
		if (document.getElementById("pw2CheckVal").value == 'N') {
			console.log("비번일치막기");
			$("#userpw2").focus();
			return false;
		}
		if (document.getElementById("phCheckVal").value == 'N') {
			console.log("폰유효성막기");
			$("#userPhone").focus();
			return false;
		}
		console.log("버튼제어함수동작 끝@@@@@@@@@@@@@");
	}
</script>















<!-- --------------------------------------우편번호 찾기 다음 Api------------------------------------------------ -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>




<!-- 우편번호 api  -->
<script>
	// 우편번호 찾기 찾기 화면을 넣을 element
	var element_wrap = document.getElementById('wrap');

	function foldDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_wrap.style.display = 'none';
	}

	function sample3_execDaumPostcode() {
		// 현재 scroll 위치를 저장해놓는다.
		var currentScroll = Math.max(document.body.scrollTop,
				document.documentElement.scrollTop);
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample3_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample3_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample3_postcode').value = data.zonecode;
						document.getElementById("sample3_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample3_detailAddress")
								.focus();

						// iframe을 넣은 element를 안보이게 한다.
						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						element_wrap.style.display = 'none';

						// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
						document.body.scrollTop = currentScroll;
					},
					// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					onresize : function(size) {
						element_wrap.style.height = size.height + 'px';
					},
					width : '100%',
					height : '100%'
				}).embed(element_wrap);

		// iframe을 넣은 element를 보이게 한다.오후 2:28 2020-06-03
		element_wrap.style.display = 'block';
	}
</script>



<%@ include file="../includes/footer.jsp"%>