<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
 section#content ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 section#content .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 
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
                              <li>주문내역 조회</li>
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
				<ul class="orderList">
				
				<button id="refundBtn" class="btn btn-warning" style="cursor: pointer;">환불내역 조회하기</button><br><br><br>
				
				<script>
				
				$("#refundBtn").click(function() {
					
					self.location="/shop/refundList";
				});
				
				</script>

				<c:choose>
				
					<c:when test="${empty orderList}">
					<li>
					<div>
						<p style="font-weight: bold; padding-top: 40px; padding-bottom: 40px;">주문내역이 없습니다.</p>
					</div>
					</li>
					</c:when>
					
					<c:otherwise>
					<c:forEach items="${orderList }" var="orderList">
					<li>
					<div>
						<p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId }" style="color:blue; text-decoration:none;">${orderList.orderId }</a></p>
						<p><span>주문날짜</span><fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd" /></p>
						<p><span>수령인</span>${orderList.orderRec}</p>
						<p><span>주소</span>(${orderList.postCode}) ${orderList.userAddr1} ${orderList.userAddr2} ${orderList.userAddr3}</p>
						<p><span>연락처</span>${orderList.orderPhon }</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
						<p><span>상태</span><d style="color:red;">${orderList.delivery }</d></p>
						<c:if test="${orderList.delivery eq '배송 준비'}">
						<br><button id="modify_${orderList.orderId}" data-n="${orderList.orderId }" class="btn btn-info"><a href="/shop/orderModify?n=${orderList.orderId }" style="color:white;">주문정보 수정</a></button>
						<button id="cancel_${orderList.orderId}" data-orderId="${orderList.orderId }" class="btn btn-info" style="cursor: pointer;">주문취소</button>

						</c:if>
						<c:if test="${orderList.delivery eq '배송 완료'}">
						<br><button id="refund_${orderList.orderId }" class="btn btn-info" style="cursor: pointer;">환불신청</button>
						</c:if>
						
					<form action="/admin/shop/delivery" method="post" class="deliveryForm">
						<input type="hidden" class="orderId" name="orderId" value="${orderList.orderId }" />
   						<input type="hidden" class="delivery" name="delivery" class="delivery" value="" />
					</form>
						
						<script>
						
							$("#cancel_${orderList.orderId}").click(function() {
								
								var orderId = $(this).attr("data-orderId")
								
								$(".orderId").val(orderId);
								
								var con = confirm("정말로 취소하시겠습니까?");
								
								if (con) {
									$(".delivery").val("주문 취소");
									$(".deliveryForm").submit();
								}
							});
		
							$('#refund_${orderList.orderId }').click(function() {
								
								var orderId = ${orderList.orderId };
								var check = 0;
								
								 $.ajax({
										url : "/shop/cancelCheck?n=${orderList.orderId }",
										type : "get",
										dataType : "json",
										success : function(result){
											
											console.log("result값1" + result);
											
											$(result).each(function(i, obj) {
												
												console.log("값확인" + obj.orderId);
												console.log(obj.orderId == '${orderList.orderId }');
												
												if (obj.orderId == '${orderList.orderId }') {
													if (obj.state == '환불 신청' || obj.state == '환불 진행중' || obj.state == '환불 완료' || obj.state == '환불 불가') {
													check = 1;
													}
												}				
											
											});
											
											if (check == 1) {
												alert("이미 환불신청한 상품입니다.");
											} else {
												self.location="/shop/refund?n=${orderList.orderId }";
											}
										}
								});
							});
							
							/* $(document).on('click', '#modify_${orderList.orderId}', function() {
								console.log("클릭되는지 확인");
								
								var datan = $(this).attr("data-n");
								
								formObj.attr("action", "/shop/orderModify");
								formObj.attr("method", "get")
								formObj.submit();
							}); */

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