<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
</style>

</head>

<!-- Home -->

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
                              <li>내가 쓴 글보기</li>
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
<div class="container-fluid">
	<div class="row">	
		
		<div class="col">
		
		<h1 class="page-header" align="center" style="padding-top:30px; padding-bottom:30px; color:black;">문의 게시판</h1>
						
				
					<div>
					<button type="button" id="inquiry" class="btn btn-warning" style="cursor:pointer;">글쓰기</button>
					</div><br>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>최종수정일</th>
							</tr>
						</thead>

						<c:forEach items="${ilist}" var="inquiry">
							<tr>
								<td><c:out value="${inquiry.ibno}" /></td>
								<td><a class='imove'
									href='<c:out value="${inquiry.ibno}" />'> <c:out
											value="${inquiry.ititle }" />
								</a></td>
								<td><c:out value="${inquiry.iwriter}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${inquiry.iregdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${inquiry.iupdateDate}" /></td>
							</tr>
						</c:forEach>
					</table>
					<!-- /.table-responsive -->
		
		
		<h1 class="page-header" align="center" style="padding-top:30px; padding-bottom:30px; color:black;">구매 후기</h1>

			<div class="panel panel-default">
				<div class="panel-heading">
				<button type="button" id="review" class="btn btn-warning" style="cursor:pointer;">글쓰기</button>
				</div><br>
				<!-- /.panel-heading -->
				<sec:authentication property="principal" var="pinfo" />

				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>최종수정일</th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="board">
							<tr>
								<td><c:out value="${board.bno}" /></td>
								<td><a class='move' href='<c:out value="${board.bno}" />'>
										<c:out value="${board.title }" /> <b style="color:#800000">[ <c:out
												value="${board.replyCnt}" /> ]
									</b>
								</a></td>
								<td><c:out value="${board.writer}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.updateDate}" /></td>
							</tr>
						</c:forEach>
					</table>
					<!-- /.table-responsive -->


					
						
						

<form id='actionForm' action="/board/list" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' 
						value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' 
						value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' 
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>
				
				<form id='iactionForm' action="/inquiry/inquiryList" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'>
					<input type='hidden' name='amount' 
						value='${pageMaker.cri.amount}'>
					<input type='hidden' name='type' 
						value='<c:out value="${pageMaker.cri.type}"/>'>
					<input type='hidden' name='keyword' 
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
				</form>

				</div>
				<!-- /.panel-body -->


			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
</div>
</div>


<script type="text/javascript">
	$(document)
			.ready(
					function() {
						
						var actionForm = $("#actionForm");
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='bno' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/board/myPageGet");
											actionForm.submit();
										});
						
						var iactionForm = $("#iactionForm");
						$(".imove").on(
								"click",
								function(e) {
									e.preventDefault();
									iactionForm.append("<input type='hidden' name='ibno' value='"
											+ $(this).attr("href") + "'>");
									iactionForm.attr("action", "/inquiry/myPageInquiryGet");
									iactionForm.submit();
								});
						
						$("#review").on("click", function() {
							self.location = "/board/myPageRegister";
						});
						
						$("#inquiry").on("click", function() {
							self.location = "/inquiry/myPageInquiryRegister";
						});
						
						
					});
</script>


<%@ include file="../includes/footer.jsp"%>
