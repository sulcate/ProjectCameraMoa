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
	<div class="col">
		<h1 class="page-header" align="center" style="color:black;">공지사항</h1>
	</div>
</div>
<!-- /.row -->
<div class="row">
	<div class="col">
		<div class="panel panel-default">
			<div class="panel-heading">
				<sec:authentication property="authorities" var="user" />
        	 	<c:if test="${user eq '[ROLE_ADMIN]' }">
				<button id='regBtn' type="button" class="btn btn-warning" style="cursor:pointer;">글쓰기</button>
				</c:if>
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

					<c:forEach items="${list}" var="notice">
						<tr>
							<td><c:out value="${notice.nbno}" /></td>
							<td><a class='move' href='<c:out value="${notice.nbno}" />'>
									<c:out value="${notice.ntitle }" />
							</a></td>
							<td><c:out value="${notice.nwriter}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${notice.nregdate}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${notice.nupdateDate}" /></td>
						</tr>
					</c:forEach>
				</table>
				<!-- /.table-responsive -->


				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/notice/noticeList" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
									or 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
									or 작성자</option>
								<option value="TWC"
									<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
									or 내용 or 작성자</option>
							</select>
							<input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' />
							<input type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' />
							 <input type='hidden' name='amount' 
							 	value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>



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

				<form id='actionForm' action="/notice/noticeList" method='get'>
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

<script type="text/javascript">
$("#regBtn").on("click", function() {
							self.location = "/notice/noticeRegister";
						});
						
var actionForm = $("#actionForm");

$(".paginate_button a").on(
		"click",
		function(e) {
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']")
					.val($(this).attr("href"));
			actionForm.submit();
		});

$(".move")
.on(
		"click",
		function(e) {
			e.preventDefault();
			actionForm
					.append("<input type='hidden' name='nbno' value='"
							+ $(this).attr(
									"href")
							+ "'>");
			actionForm.attr("action",
					"/notice/noticeGet");
			actionForm.submit();
		});
		
var searchForm = $("#searchForm");
		
$("#searchForm button").on(
	      "click",
	      function(e) {	
	    	  
	    	  console.log("확인용");

	         if (!searchForm.find("option:selected")
	               .val()) {
	            alert("검색 종류를 선택 하세요");
	            return false;
	         }

	         if (!searchForm.find(
	               "input[name='keyword']").val()) {
	            alert("키워드를 입력하세요");
	            return false;
	         }

	         e.preventDefault();
	         searchForm.find("input[name='pageNum']")
	               .val("1");
	         searchForm.submit();

	         
	      });

	    
</script>
   
   <%@ include file="../includes/footer.jsp"%>