<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<style>
.footer
{
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

.breadcrumbs ul li:not(:last-child)::after
{
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

.list
{
   width: 100%;
   background: #FFFFFF;
   padding-top: 60px;
   padding-left: 60px;
   padding-right: 60px;
   padding-bottom: 150px;
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
									<li><a href="/">Home</a></li>
									<li>공지사항</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="list">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header" style="color:black;">공지사항 등록</h1><br>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<div class="panel-body">

					<form role="form" action="/notice/noticeRegister" method="post">
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='ntitle'>
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='ncontent'></textarea>
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='nwriter'
								value='<sec:authentication property="principal.username"/>'
								readonly="readonly">
						</div>

						<button type="submit" class="btn btn-default">글 등록</button>
						<button type="reset" class="btn btn-default">다시 쓰기</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp"%>