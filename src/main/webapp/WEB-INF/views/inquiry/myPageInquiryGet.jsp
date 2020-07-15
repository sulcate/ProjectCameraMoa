<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@ include file="../includes/header.jsp"%>

<style>
.home
{
   width: 100%;
   height: 362px;
   background: #FFFFFF;
   z-index: 2;
   padding-top: 130px;
   padding-left: 60px;
   padding-right: 60px;
}
.home_container
{
   width: 100%;
   height: 100%;
}
.home_background
{
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
   background-repeat: no-repeat;
   background-size: cover;
   background-position: center center;
}
.home_content_container
{
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
.home_content
{
   width: 580px;
}
.breadcrumbs ul li
{
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
.breadcrumbs ul li a
{
   font-size: 14px;
   font-weight: 500;
   color: #FFFFFF;
   -webkit-transition: all 200ms ease;
   -moz-transition: all 200ms ease;
   -ms-transition: all 200ms ease;
   -o-transition: all 200ms ease;
   transition: all 200ms ease;
}
.breadcrumbs ul li a:hover
{
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

/* .uploadResult ul li img {
	width: 100px;
} */

.uploadResult ul li span {
	color: white;
}
</style>

<sec:authentication property="principal" var="pinfo" />

<!-- Home -->

   <div class="home">
      <div class="home_container">
         <div class="home_background" style="background-image:url(/resources/images/cart.jpg)"></div>
         <div class="home_content_container">
            <div class="container">
               <div class="row">
                  <div class="col">
                     <div class="home_content">
                        <div class="breadcrumbs">
                           <ul>
                              <li><a href="/">Home</a></li>
                              <li><a href="/user/mypage">My page</a></li>
                              <li><a href="/board/myBoard?keyword=${pinfo.username}">내가 쓴 글보기</a></li>
                              <li>문의 읽기</li>
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
		<div class="col">
			<h1 class="page-header" style="color:black;">문의 게시판</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<div class="panel-body">

					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name='ibno'
							value='<c:out value="${inquiry.ibno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='ititle'
							value='<c:out value="${inquiry.ititle }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='icontent'
							readonly="readonly"><c:out value="${inquiry.icontent }" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='iwriter'
							value='<c:out value="${inquiry.iwriter }"/>' readonly="readonly">
					</div>

					<sec:authentication property="principal" var="pinfo" />

					<c:if test="${pinfo.username eq inquiry.iwriter or user eq '[ROLE_ADMIN]'}">
						<button data-oper='modify' class="btn btn-warning">수정 및 삭제</button>
					</c:if>


					<button data-oper='list' class="btn btn-info">뒤로가기</button>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<br><div class="panel-heading">첨부파일</div>
				<div class="panel-body">
				
					<div class='bigPictureWrapper'>
						<div class='bigPicture'></div>
					</div>

					<div class='uploadResult'>
						<ul>
						</ul>
					</div>
				</div>
			</div>
		</div>

					<form id='operForm' action="/inquiry/inquiryModify" method="get">
						<input type='hidden' id='ibno' name='ibno'
							value='<c:out value="${inquiry.ibno}"/>'> <input
							type='hidden' name='pageNum'
							value='<c:out value="${cri.pageNum}"/>'> <input
							type='hidden' name='amount'
							value='<c:out value="${cri.amount}"/>'> <input
							type='hidden' name='keyword'
							value='<c:out value="${cri.keyword}"/>'> <input
							type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
					</form>

				</div>
			</div>
		</div>
	</div>
</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/inquiry/myPageInquiryModify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#ibno").remove();
			operForm.attr("action", "/board/myBoard?keyword=${pinfo.username}");
			operForm.submit();
		});

	});
</script>

<script>
	$(document)
			.ready(
					function() {
						(function() {
							var ibno = '<c:out value="${inquiry.ibno}"/>';

							$
									.getJSON(
											"/inquiry/getAttachList",
											{
												ibno : ibno
											},
											function(arr) {

												var str = "";

												$(arr)
														.each(
																function(i,
																		attach) {

																	if (attach.fileType) {
																		var fileCallPath = encodeURIComponent(attach.uploadPath
																				+ "/s_"
																				+ attach.uuid
																				+ "_"
																				+ attach.fileName);
																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'";
						  	str += " data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'>";
																		str += "<img src='/display?fileName="
																				+ fileCallPath
																				+ "'></div></li>";
																	} else {

																		str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"'";
						  	str += " data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'><div><sapn> "
																				+ attach.fileName
																				+ "</span><br/>";
																		str += "<img src='/resources/img/attach.png'></a></div></li>";
																	}
																});

												$(".uploadResult ul").html(str);
											});

							$(".uploadResult")
									.on(
											"click",
											"li",
											function(e) {

												var liObj = $(this);

												var path = encodeURIComponent(liObj
														.data("path")
														+ "/"
														+ liObj.data("uuid")
														+ "_"
														+ liObj
																.data("filename"));

												if (liObj.data("type")) {
													showImage(path.replace(
															new RegExp(/\\/g),
															"/"));
												} else {
													self.location = "/download?fileName="
															+ path
												}
											});

							function showImage(fileCallPath) {

								$(".bigPictureWrapper").css("display", "flex")
										.show();

								$(".bigPicture").html(
										"<img src='/display?fileName="
												+ fileCallPath + "'>").animate(
										{
											width : '30%',
											height : '240%'
										}, 1000);
							}

							$(".bigPictureWrapper").on("click", function(e) {
								$(".bigPicture").animate({
									width : '0%',
									height : '0%'
								}, 1000);
								setTimeout(function() {
									$('.bigPictureWrapper').hide();
								}, 500);
							});

						})();

					});
</script>

<%@ include file="../includes/footer.jsp"%>