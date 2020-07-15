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

.get {
	padding-left: 60px;
	padding-right: 60px;
}

/* .replyModFormBtn {
	display: none;
}

.replyRemBtn {
	display: none;
} */

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

/* .bigPicture img {
	height: 100%;
	width: 100%;
} */
</style>

</head>

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
                              <li>후기 읽기</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   
<sec:authentication property="authorities" var="user2" />
	<c:set var="admin" value="0" />
<c:if test="${user2 eq '[ROLE_ADMIN]' }">
	<c:set var="admin" value="1"/>
</c:if>

<div class="list">
<div class="row">
	<div class="col">
		<h1 class="page-header" style="color:black;">구매 후기</h1>
	</div>
</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<div class="panel-body">

					<div class="form-group">
						<label>글 번호</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.content }" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

					<sec:authentication property="principal" var="pinfo" />
					<sec:authentication property="authorities" var="user" />
					
						<c:if test="${pinfo.username eq board.writer or user eq '[ROLE_ADMIN]' }">
							<button data-oper='modify' class="btn btn-warning">수정 및 삭제</button>
						</c:if>
					

					<button data-oper='list' class="btn btn-info">뒤로가기</button>

					<form id='operForm' action="/board/modify" method="get">
						<input type='hidden' id='bno' name='bno'
							value='<c:out value="${board.bno}"/>'> <input
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
							<input type="hidden" id="bno" value="${board.bno}">
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
					<i class="fa fa-comments fa-fw"></i> 댓글
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

						var bnoValue = '<c:out value="${board.bno}"/>';
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
														
												if (user == list.replyer || admin != 0) {
												str += "<button type=button class=replyModFormBtn data-rno='"+list.rno+"' data-reply='"+list.reply+"'>수정</button>&nbsp;&nbsp;"
														+ "<button type=button class=replyRemBtn data-rno='"+list.rno+"'>삭제</button>"
												}
												
												str += "</div></li>";
												
												if(index == page){
			                                         return false; //break와 동일한 기능
			                                       }
											});
							
												if (replyCnt != page) {

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
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/myPageModify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
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
							var bno = '<c:out value="${board.bno}"/>';

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