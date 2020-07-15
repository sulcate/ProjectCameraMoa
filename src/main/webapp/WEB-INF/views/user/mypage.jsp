<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<link rel="stylesheet" type="text/css" href="/resources/css/util.css">
<!-- <link rel="stylesheet" type="text/css" href="/resources/css/main.css"> -->

<style>
.footer {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	z-index: 1;
}

.home {
	width: 100%;
	height: 362px;
	background: #FFFFFF;
	z-index: 2;
	padding-top: 130px;
	padding-left: 60px;
	padding-right: 60px;
}

.home_container {
	width: 100%;
	height: 100%;
}

.home_background {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.home_content_container {
	position: absolute;
	top: 53%;
	left: 0;
	-webkit-transform: translateY(-50%);
	-moz-transform: translateY(-50%);
	-ms-transform: translateY(-50%);
	-o-transform: translateY(-50%);
	transform: translateY(-50%);
	width: 100%;
}

.home_content {
	width: 580px;
}

.breadcrumbs ul li {
	display: inline-block;
	position: relative;
	font-size: 14px;
	font-weight: 500;
	color: #e95a5a;
}

.breadcrumbs ul li:not (:last-child )::after {
	display: inline-block;
	content: '/';
	margin-left: 10px;
	margin-right: 6px;
	color: #FFFFFF;
}

.breadcrumbs ul li a {
	font-size: 14px;
	font-weight: 500;
	color: #FFFFFF;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}

.breadcrumbs ul li a:hover {
	color: #e95a5a;
}

.list {
	width: 100%;
	background: #FFFFFF;
	padding-top: 130px;
	padding-left: 60px;
	padding-right: 60px;
}

.button {
	display: inline-block;
	width: 190px;
	height: 180px;
	background: none;
	text-align: center;
	border: solid 2px #1b1b1b;
	overflow: hidden;
	cursor: pointer;
}

.button a {
	display: block;
	position: relative;
	font-size: 21px;
	font-weight: 600;
	line-height: 57px;
	color: #1b1b1b;
	background: none;
	z-index: 1;
	-webkit-transition: all 200ms ease;
	-moz-transition: all 200ms ease;
	-ms-transition: all 200ms ease;
	-o-transition: all 200ms ease;
	transition: all 200ms ease;
}

.button::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 150%;
	height: 100%;
	background: #1b1b1b;
	z-index: 0;
	opacity: 0;
	-webkit-transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	transform: rotate3d(0, 0, 1, -45deg) translate3d(0, -3em, 0);
	-webkit-transform-origin: 0% 100%;
	transform-origin: 0% 100%;
	-webkit-transition: -webkit-transform 0.3s, opacity 0.3s,
		background-color 0.3s;
	transition: transform 0.3s, opacity 0.3s, background-color 0.3s;
}

.button:hover::after {
	opacity: 1;
	-webkit-transform: rotate3d(0, 0, 1, 0deg);
	transform: rotate3d(0, 0, 1, 0deg);
	-webkit-transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
	transition-timing-function: cubic-bezier(0.2, 1, 0.3, 1);
}

.button:hover a {
	color: #FFFFFF;
}

.bag {
	margin: 0px 565px 230px;
}

.content {
	margin: 60px 0px;
}
</style>

</head>

<!-- Home -->

<div class="home">
	<div class="home_container">
		<div class="home_background"
			style="background-image: url(/resources/images/cart.jpg)"></div>
		<div class="home_content_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_content">
							<div class="breadcrumbs">
								<ul>
									<li><a href="/">Home /</a></li>
									<li>My page</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<sec:authentication property="principal" var="pinfo" />

<h1 style="text-align: center; margin: 70px 50px 60px; color: black;">내 정보 보기</h1>

<div class="bag">
	<div class="button user_modify">
		<a class="content" href="/user/updateUser">회원정보 수정</a>
	</div>
	<div class="button orderList">
		<a class="content" href="/shop/orderList">주문 및 환불내역</a>
	</div>
	<div class="button cartList">
		<a class="content" href="/shop/cartList">장바구니</a>
	</div>
	<div class="button myBoard">
		<a class="content" href="/board/myBoard?keyword=${pinfo.username}">내가 쓴 글보기</a>
	</div>
</div>

<script>
	$(".button.user_modify").click(function() {
		location.href = "/user/updateUser";
	});

	$(".button.orderList").click(function() {
		location.href = "/shop/orderList";
	});

	$(".button.cartList").click(function() {
		location.href = "/shop/cartList";
	});
	
	$(".button.myBoard").click(function() {
		location.href = "/board/myBoard?keyword=${pinfo.username}";
	});
</script>

<%@ include file="../includes/footer.jsp"%>