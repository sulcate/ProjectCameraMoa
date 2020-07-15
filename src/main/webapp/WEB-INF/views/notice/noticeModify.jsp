<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

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

.uploadResult {
	width: 100% background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-item: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 100;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-item: center;
}

.bigPicture img {
	width: 600%;
}

.modify {
	padding-left: 60px;
	padding-right: 60px;
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
			<h1 class="page-header" style="color:black;">공지사항 수정</h1><br>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<div class="panel-body">

					<form role="form" action="/notice/noticeModify" method="post">

						<input type="hidden" name="pageNum"
							value='<c:out value="${cri.pageNum }"/>'> <input
							type="hidden" name="amount"
							value='<c:out value="${cri.amount }"/>'> <input
							type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
						<input type="hidden" name="keyword"
							value='<c:out value="${cri.keyword }"/>'>

						<div class="form-group">
							<label>글 번호</label> <input class="form-control" name='nbno'
								value='<c:out value="${notice.nbno }"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label> <input class="form-control" name='ntitle'
								value='<c:out value="${notice.ntitle }"/>'>
						</div>

						<div class="form-group">
							<label>내용</label>
							<textarea class="form-control" rows="3" name='ncontent'><c:out
									value="${notice.ncontent }" /></textarea>
						</div>

						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='nwriter'
								value='<c:out value="${notice.nwriter }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label style="display: none">RegDate</label> <input type="hidden"
								class="form-control" name='regDate'
								value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.nregdate}" />'
								readonly="readonly">
						</div>

						<div class="form-group">
							<label style="display: none">Update Date</label> <input
								type="hidden" class="form-control" name='updateDate'
								value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${notice.nupdateDate}" />'
								readonly="readonly">
						</div>

						<sec:authentication property="principal" var="pinfo" />
						<sec:authorize access="isAuthenticated()">
							<c:if test="${pinfo.username eq notice.nwriter }">
								<button type="submit" data-oper='modify' class="btn btn-default">수정
									완료</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">글
									삭제</button>
									</c:if>
									</sec:authorize>
								<button type="submit" data-oper='list' class="btn btn-info">목록</button>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>

	

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form");

						$('button')
								.on(
										"click",
										function(e) {
											e.preventDefault();
											var operation = $(this)
													.data("oper");

											if (operation === 'remove') {
												formObj.attr("action",
														"/notice/noticeRemove");
											} else if (operation === 'list') {
												formObj.attr("action",
														"/notice/noticeList").attr(
														"method", "get");
												var pageNumTag = $(
														"input[name='pageNum']")
														.clone();
												var amountTag = $(
														"input[name='amount']")
														.clone();
												var keywordTag = $(
														"input[name='keyword']")
														.clone();
												var typeTag = $(
														"input[name='type']")
														.clone();

												formObj.empty();
												formObj.append(pageNumTag);
												formObj.append(amountTag);
												formObj.append(keywordTag);
												formObj.append(typeTag);
											} 
											formObj.submit();
										});
					});

	

						
</script>

<%@ include file="../includes/footer.jsp"%>
