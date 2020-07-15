<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<style>
 .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:125px; margin-right:30px; }
 
 #container {
 	padding-top: 60px;
   	padding-left: 60px;
   	padding-right: 60px;
   	padding-bottom: 230px;
 }
 
 .orderInfo p {
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
   padding-top: 130px;
   padding-left: 60px;
   padding-right: 60px;
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
                              <li>환불 신청</li>
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
				<div class="orderInfo">
  					<c:forEach items="${refund}" var="refund" varStatus="status">
   
   					<c:if test="${status.first}">
    					<p><span>수령인</span>${refund.orderRec}</p>
    					<p><span>주소</span>(${refund.postCode}) ${refund.userAddr1} ${refund.userAddr2} ${refund.userAddr3}</p>
    					<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${refund.amount}" /> 원</p>
    					<p><span>상태</span><d style="color:red;">${refund.delivery }</d></p>
   					</c:if>
   
  					</c:forEach>
 				</div>
 				<form action="/shop/refund" method="post" class="refundForm">  
 					<ul class="orderView">
  						<c:forEach items="${refund}" var="refund" varStatus="status">   
  						<c:if test="${status.first}">
  						<input type="hidden" name="orderId" value="${refund.orderId }">
  						</c:if>
  					<li>
   					<div class="thumb">
    					<img src="${refund.gdsThumbImg}" />
   					</div>
  
   					<div class="gdsInfo">
    					<p>
     					<span>상품명</span>${refund.gdsName}<br />
     					<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${refund.gdsPrice}" /> 원<br />
     					<span>구입 수량</span>${refund.cartStock} 개<br />
     					<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${refund.gdsPrice * refund.cartStock}" /> 원<br />
     					
     					<span>환불신청 수량</span><select name="refundStock" class="numbox_${refund.gdsNum}" style="width:50px;height:30px;">
							<c:forEach var="i" begin="0" end="${refund.cartStock}">
								<option value="${i}">${i}</option>
							</c:forEach>
							</select>
    					</p>
   					</div>
  					</li>     
  					
						<input type="hidden" name="gdsNum" value="${refund.gdsNum }">

  						</c:forEach>
  						
 					</ul>
 					
 					<button type="button" class="btn btn-warning" style="cursor:pointer;">환불 신청하기</button>
					<button type="button" class="btn btn-info"><a href="/shop/orderList" style="color:white;">취소</a></button>

					<script>
					$(".btn.btn-warning").click(function(e) {
						
						var arrNumber = new Array();
						var i = 0;
						
						<c:forEach items="${refund}" var="refund">
							arrNumber[i]=$(".numbox_${refund.gdsNum}").val();
							i++;
						</c:forEach>
						
						var con = confirm("환불 신청 하시겠습니까?");
						
						if (con) {
							
							for(var i=0;i<arrNumber.length;i++){
								
								if (arrNumber[i] != 0) {
									console.log("확인용");
									
									$(".refundForm").submit();
									break;
								} else {
									if (i == arrNumber.length-1) {
										alert("환불 상품이 없습니다.");
									}
								}
				  	
							}
						} else {
							console.log("nombox값" + $(".numbox").val());
						}
					});
					</script>
 				</form>
			</section>
	
		</div>
	</section>

<%@ include file="../includes/footer.jsp" %>