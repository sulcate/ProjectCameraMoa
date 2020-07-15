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

<script>

function run() {
	alert("회원만 사용할 수 있습니다.")
	self.location="/user/login";
 }

</script>

<sec:authorize access="isAnonymous()">
<script>
run();
</script>
</sec:authorize>

<sec:authorize access="isAuthenticated()">

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
                              <li>문의 게시판</li>
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
			<h1 class="page-header" align="center" style="color:black;">문의 게시판</h1>
		</div>
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col">
			<div class="panel panel-default">
				<div class="panel-heading">
				
						
						<form id='searchForm' action="/inquiry/inquiryList" method='get'>
							<input type="hidden" name='type' value="W" />
							<sec:authentication property="principal" var="pinfo" />
							<input type='hidden' name='keyword'
								value='<c:out value="${pinfo.username}"/>' />
							<input type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							 <input type='hidden' name='amount' 
							 	value='<c:out value="${pageMaker.cri.amount}"/>' />
							 	<button id='regBtn' type="button" class="btn btn-warning" style="cursor:pointer;">글쓰기</button>
							<button class='btn btn-default' style="cursor:pointer;">내글보기</button>
							<button type="button" id="backList" class="btn btn-info" style="cursor:pointer;">목록</button>
							
						</form>
					
						
				</div><br>

						


				<!-- /.panel-heading -->
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

						<c:forEach items="${list}" var="inquiry">
							<tr>
								<td><c:out value="${inquiry.ibno}" /></td>
								<td><a class='move'
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



					<div class='pull-right'>
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Prev</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }">
								<li
									class='paginate_button ${pageMaker.cri.pageNum==num?"active":"" }'>
									<a href="${num }" class="page-link">${num }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
						</ul>
					</div>

					<form id='actionForm' action="/inquiry/inquiryList" method='get'>
						<input type='hidden' name='pageNum'
							value='${pageMaker.cri.pageNum}'> <input type='hidden'
							name='amount' value='${pageMaker.cri.amount}'> <input
							type='hidden' name='type'
							value='<c:out value="${pageMaker.cri.type}"/>'> <input
							type='hidden' name='keyword'
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

<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<!-- <button type="button" class="btn btn-primary">Save
									Changes</button> -->
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
	$("#regBtn").on("click", function() {
		self.location = "/inquiry/inquiryRegister";
	});

	var actionForm = $("#actionForm");

	$(".paginate_button a").on("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='ibno' value='"
						+ $(this).attr("href") + "'>");
				actionForm.attr("action", "/inquiry/inquiryGet");
				actionForm.submit();
			});

	$("#searchForm").on("click", function(e) {

		searchForm.find("input[name='pageNum']").val("1");
		e.preventDefault();

		searchForm.submit();
	});
	
	$("#backList").on("click", function(e) {
		e.preventDefault();
		self.location = "/inquiry/inquiryList"
	})
</script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';
						console.log("result값:" + result);
						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html(
										"게시글 " + parseInt(result)
												+ " 번이 등록되었습니다.");
							}
							$("#myModal").modal("show");
						}
					});
				
</script>

</sec:authorize>

<%@ include file="../includes/footer.jsp"%>
