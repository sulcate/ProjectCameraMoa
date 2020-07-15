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
</style>

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
			<h1 class="page-header" style="color:black;">답변 하기</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<div class="panel-heading"></div>
				<div class="panel-body">

					<div class="form-group">
						<input type="hidden" class="form-control" name='ibno'
							value='<c:out value="${inquiry.ibno }"/>' readonly="readonly">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control" name='ititle'
							value='<c:out value="${inquiry.ititle }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>내용</label>
						<textarea class="form-control" rows="10" name='icontent'
							readonly="readonly"><c:out
								value="${inquiry.icontent }" /></textarea>
					</div>

					<div class="form-group">
						<label>작성자</label> <input class="form-control" name='iwriter'
							value='<c:out value="${inquiry.iwriter }"/>' readonly="readonly">
					</div>

					<div class="row">
						<div class="col-lg-12">
							<div class="panel panel-default">

								<div class="panel-heading"></div>
								<div class="panel-body">

									<form role="form" action="/inquiry/inquiryReply" method="post">
										<div class="form-group">
											<input type="hidden" class="form-control" name='ref'
												value='<c:out value="${inquiry.ibno }"/>'
												readonly="readonly">
										</div>
										<div class="form-group">
											<input type="hidden" class="form-control" name='ititle'
												value='<c:out value="└ 답변 드립니다"/>'
												readonly="readonly">
										</div>
										<div class="form-group">
											<label>답변 내용</label>
											<textarea class="form-control" rows="10" name='icontent'></textarea>
										</div>

										<div class="form-group">
											<label>작성자</label> <input class="form-control" name='iwriter'
												value='<sec:authentication property="principal.username"/>'
												readonly="readonly">
										</div>

										<button type="submit" data-oper='reply'
											class="btn btn-default">답변 등록</button>
										<button data-oper='list' class="btn btn-info">목록</button>

									</form>

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

<script type="text/javascript">
	var operForm = $("#operForm");
	$("button[data-oper='reply']").on("click", function(e) {
		operForm.attr("action", "/inquiry/inquiryReply").submit();
	});
	$("button[data-oper='list']").on("click", function(e) {
		operForm.find("#ibno").remove();
		operForm.attr("action", "/inquiry/inquiryList");
		operForm.submit();
	});
</script>