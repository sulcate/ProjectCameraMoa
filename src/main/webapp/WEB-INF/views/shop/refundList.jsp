<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .refundList span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 #container {
 	padding-top: 60px;
   	padding-left: 60px;
   	padding-right: 60px;
   	padding-bottom: 230px;
 }
 
 #container p {
 	line-height: 1.1;
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
                              <li><a href="/user/mypage">My page</a></li>
                              <li>환불내역 조회</li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

	<section id="container">
		<div id="container_box">
			<section id="content">
				<ul class="refundList">
				
				<button id="orderBtn" class="btn btn-success" style="cursor: pointer;">주문내역 조회하기</button><br><br><br>
				
				<script>
				
				$("#orderBtn").click(function() {
					
					self.location="/shop/orderList";
				});
				
				</script>
				
				<%-- <c:set var="i" value="0" />
				<c:forEach items="${refundList }" var="refundList">
				<c:set var="i" value="${i + (refundList.gdsPrice * refundList.refundStock)}"/>
				</c:forEach> --%>

				<c:choose>
				
					<c:when test="${empty refundList}">
					<li>
					<div>
						<p style="font-weight: bold; padding-top: 40px; padding-bottom: 40px;">환불내역이 없습니다.</p>
					</div>
					</li>
					</c:when>
					
					<c:otherwise>
					<c:forEach items="${refundList }" var="refundList">
					<li>
					<div>

						<p><span>주문번호</span><a href="/shop/refundView?n=${refundList.orderId }" style="color:blue; text-decoration:none;">${refundList.orderId }</a></p>
						<p><span>주문날짜</span><fmt:formatDate value="${refundList.orderDate}" pattern="yyyy.MM.dd" /></p>
						<p><span>환불신청일</span><fmt:formatDate value="${refundList.refundDate}" pattern="yyyy.MM.dd" /></p>
						<p><span>수령인</span>${refundList.orderRec}</p>
						<p><span>주소</span>(${refundList.postCode}) ${refundList.userAddr1} ${refundList.userAddr2} ${refundList.userAddr3}</p>
						<p><span>연락처</span>${refundList.orderPhon }</p>
						<p><span>상태</span><d style="color:red;">${refundList.state }</d></p>
						
						<c:if test="${refundList.state eq '환불 신청'}">
						<br><button id="cancel_${refundList.orderId}" data-orderId="${refundList.orderId }" class="btn btn-info" style="cursor: pointer;">환불취소</button>
						</c:if>
						
					<form action="/admin/shop/state" method="post" class="stateForm">
						<input type="hidden" class="orderId" name="orderId" value="${refundList.orderId }" />
   						<input type="hidden" class="state" name="state" class="state" value="" />
					</form>
						
						<script>
						
							$("#cancel_${refundList.orderId}").click(function() {
								
								var orderId = $(this).attr("data-orderId")	
								$(".orderId").val(orderId);
								
								var con = confirm("정말로 취소하시겠습니까?");
								
								if (con) {
									$(".state").val("환불 취소");
									$(".stateForm").submit();
								}
							});

						</script>
					</div>
					</li>
					</c:forEach>
					</c:otherwise>
					
				</c:choose>
				
				</ul>
			</section>
		</div>
	</section>

<%@ include file="../includes/footer.jsp" %>