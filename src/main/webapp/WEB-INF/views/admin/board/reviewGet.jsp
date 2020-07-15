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
.panel-default .panel-heading, .panel-white .panel-heading {
    color: #2b2b2b;
    background-color: #edf1f5;
    border-bottom: 1px solid rgba(120,130,140,.13);
}
.panel {
    margin-bottom: 20px;
    background-color: #edf1f5;
    border-radius: 4px;
    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
    box-shadow: 0 1px 1px rgba(0,0,0,.05);
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

.form-group label {
	font-weight:bold;
}
</style>

</head>

<body>

<%@ include file="../includes/header.jsp" %>

<sec:authentication property="authorities" var="user2" />
	<c:set var="admin" value="0" />
<c:if test="${user2 eq '[ROLE_ADMIN]' }">
	<c:set var="admin" value="1"/>
</c:if>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
           		<div>
		<h1>구매후기 읽기</h1>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-body">

					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name='bno'
							value='<c:out value="${review.bno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${review.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${review.content }" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value='<c:out value="${review.writer }"/>' readonly="readonly">
					</div>

					<sec:authentication property="principal" var="pinfo" />
					<sec:authentication property="authorities" var="user" />
					
						<c:if test="${user eq '[ROLE_ADMIN]' }">
							<button data-oper='remove' class="btn btn-danger">삭제</button>
						</c:if>

					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno'
							value='<c:out value="${review.bno}"/>'> <input
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
	</div>

	<sec:authorize access="isAuthenticated()">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">

					<br><div class="panel-heading">댓글</div>
					<div class="panel-body">

						<div class="form-group">
							<input type="hidden" id="bno" value="${review.bno}">
							<textarea class="form-control" rows="3" id='reply'></textarea><br>
							작성자<input type="text" id="replyer"
								value='<c:out value="${pinfo.username }"/>' readonly="readonly">

							<button id="replyRegBtn" class="btn btn-default">댓글 등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</sec:authorize>

	<div class='row'>
		<div class="col-lg-12">
			<!-- /.panel -->
			<div class="panel panel-default">
				<div class="panel-heading">
					댓글목록
				</div>

				<!-- /.panel-heading -->
				<div class="pannel-body">

					<ul class="chat">

					</ul>
					<!-- ./ end ul -->

				</div>

				<!-- /.panel .chat-panel -->
			</div>
		</div>
		<!-- ./end row -->
	</div>

	
	<div class="replyfooter" hidden="true">
		<button id="replyModBtn" type="button">Reply Modify</button>
		<button id="replyRemBtn" type="button">Reply Remove</button>
	</div>



	<div style="display: none" class="replyModForm">
		<textarea class="form-control" rows="3" id='reply'></textarea>
		<button class="replyMod">수정완료</button>
	</div>

</div>


<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {

						var bnoValue = '<c:out value="${review.bno}"/>';
						var replyUL = $(".chat");

						var page = 2;
						showList(page);

						function showList(page) {
							replyService
									.getList(
											{
												bno : bnoValue,
												page : page || 1
											},
											function(replyCnt, list) {
											
												var str = "";

												/* if (list == null
														|| list.length == 0) {
													replyUL.html("");

													return;
												} */
												if (replyCnt < page) {
													page = replyCnt;
												}
											$(list).each(function(index,list){
											
												console.log(list.replyer);
												var user = "${pinfo.username}";
												var admin = "${admin}";
																								
												str += "<li class=left_clearfix data-rno='"+list.rno+"' data-reply='"+list.reply+"'>";
												str += " <br><div><div><strong class='primary-font'>"
														+ list.replyer
														+ "</strong>";
												str += " <small class='pull-right text-muted'>"
														+ replyService
																.displayTime(list.replyDate)
														+ "</small></div>";
												str += " <p>"
														+ list.reply
														+ "</p>";
														
												if (user == list.replyer) {
												str += "<button type=button class=replyModFormBtn data-rno='"+list.rno+"' data-reply='"+list.reply+"'>수정</button>&nbsp;&nbsp;"
														+ "<button type=button class=replyRemBtn data-rno='"+list.rno+"'>삭제</button>"
												}
												
												if (admin != 0 && user != list.replyer) {
													str += "<button type=button class=replyRemBtn data-rno='"+list.rno+"'>삭제</button>"
												}
												
												str += "</div></li>";
												
												if(index == page){
			                                         return false; //break와 동일한 기능
			                                       }
											});
							
												if ((replyCnt-1) > page) {

													str += "<br><button type='button' id='load'>댓글 더 보기</button>";

												}

												replyUL.html(str);
												
												//$(".replyModFormBtn").hide();
											
											}); //end function
											
																						

						} // end showList

						$(".chat").on("click", "#load", function() {

							page = page + 3;
							showList(page);
						});

						$(document).on(
								"click",
								".replyModFormBtn",
								function(e) {

									var rno = $(this).data("rno");
									var reply = $(this).data("reply");
									$(this).next().after($(".replyModForm"));
									$(".replyModForm").show();
									$(".replyModForm textarea").val(reply);
									$(".replyModForm button").attr('data-rno',
											rno)

								})

						$(document).on("click", ".replyMod", function() {

							var rno = $(this).data("rno");
							var reply = $(".replyModForm textarea").val();

							var modReply = {

								rno : rno,
								reply : reply,

							};

							replyService.update(modReply, function(result) {
								alert(result);
								$(".replyfooter").after($(".replyModForm"));
								showList(page);
								$(".replyModForm").hide();

							});

						});

						$(".chat").on("click", ".replyRemBtn", function(e) {

							var rno = $(this).data("rno");
							
							replyService.remove(rno, function(result) {
								alert(result);
								showList(page);
							});
						});

						$("#replyRegBtn").click(function(e) {

							var bno = $("#bno").val();
							var reply = $("#reply").val();
							var replyer = $("#replyer").val();

							var addreply = {
								bno : bno,
								reply : reply,
								replyer : replyer
							};

							replyService.add(addreply, function(result) {

								alert(result);
								showList(page);
								$("#reply").val("");
							});

						});
						// end replyReg

					});
</script>



<script type="text/javascript">
	$(document).ready(function() {

		var operForm = $("#operForm");

		$("button[data-oper='remove']").on("click", function(e) {
			
			var con = confirm("정말로 삭제하시겠습니까?");
			
			if(con) {
				operForm.attr("action", "/admin/board/reviewRemove").attr("method", "post");
				operForm.submit();
			}
			
		});
	});
</script>

<script>
	$(document)
			.ready(
					function() {
						(function() {
							var bno = '<c:out value="${review.bno}"/>';

							$
									.getJSON(
											"/board/getAttachList",
											{
												bno : bno
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
											height : '100%'
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
            </div>    
        <!-- /#page-wrapper -->
        
<%@ include file="../includes/footer.jsp" %>

</sec:authorize>