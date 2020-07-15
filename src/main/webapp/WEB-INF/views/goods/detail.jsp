<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/styles/product.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/product_responsive.css">

<script src="/resources/js/product.js"></script>

<style>
.shipping_fee {
    display: inline-block;
    font-size: 14px;
    font-weight: 500;
    color: #6c6a74;
}
.shipping_price {
    display: inline-block;
    font-size: 14px;
    font-weight: 500;
    color: #44a038;
    margin-left: 5px;
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
										<li><a href="/goods/list">Shop</a></li>
										<li>제품 상세보기</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Product Details -->

	<div class="product_details">
		<div class="container">
			<div class="row details_row">

				<!-- Product Image -->
				<div class="col-lg-6">
					<div class="details_image">
						<div class="details_image_large" style="padding:5px; width:570px; height:470px;"><img src="${goods.gdsThumbImg }" width=570px; height=470px; alt=""></div>
						<!-- <div class="details_image_thumbnails d-flex flex-row align-items-start justify-content-between">
							<div class="details_image_thumbnail active" data-image="images/details_1.jpg"><img src="images/details_1.jpg" alt=""></div>
							<div class="details_image_thumbnail" data-image="images/details_2.jpg"><img src="images/details_2.jpg" alt=""></div>
							<div class="details_image_thumbnail" data-image="images/details_3.jpg"><img src="images/details_3.jpg" alt=""></div>
							<div class="details_image_thumbnail" data-image="images/details_4.jpg"><img src="images/details_4.jpg" alt=""></div>
						</div> -->
					</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-6">
					<div class="details_content">
						<div class="details_name">${goods.gdsName }</div>
						<!-- <div class="details_discount">$890</div> -->
						<div class="details_price" style="color:red;"><fmt:formatNumber value="${goods.gdsPrice }" pattern="###,###,###" />원</div>

						<!-- In Stock -->
						<div class="in_stock_container">
							<div class="availability">Availability:</div>
							<c:if test="${goods.gdsStock ne 0 }">
							<span>In Stock</span>
							</c:if>
							<c:if test="${goods.gdsStock eq 0 }">
							<span style="color:red;">Out Of Stock</span>
							</c:if>
						</div>
						<div>
							<div class="shipping_fee">shipping fee:</div>
							<span class="shipping_price">2,500원</span> (50,000원 이상 결제 시 무료배송)
						</div>
						<div class="details_text" style="height:auto;">
							<p>${goods.gdsDes }</p>
						</div>

						<!-- Product Quantity -->
						<div class="product_quantity_container">
							<c:if test="${goods.gdsStock ne 0 }">
							<div class="product_quantity clearfix">
								<span>Qty</span>
								<input id="quantity_input" type="text" pattern="[0-9]*" value="1">
								<div class="quantity_buttons">
									<div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
									<div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
								</div>
							</div>
							<div class="button cart_button"><a class="addCart_btn">Add to cart</a></div>
							</c:if>
							<c:if test="${goods.gdsStock eq 0 }">
							<div class="button cart_button"><a href="#" style="cursor:default;">재고 없음</a></div>
							</c:if>
							<input type="hidden" name="gdsNum" id="gdsNum" value="${goods.gdsNum }">
							
							<script>
							$(".addCart_btn").click(function() {
								
								var gdsNum = $("#gdsNum").val();
								var cartStock = $('#quantity_input').val();
								
								var data = {
										gdsNum : gdsNum,
										cartStock : cartStock
								};
								
								if (cartStock != 0) {
								
								$.ajax({
									url : "/shop/view/addCart",
									type : "post",
									data : data,
									success : function(result){
										
										console.log("result값" + result);
										if(result == 1) {
										alert("상품이 카트에 담겼습니다.");
										self.location="/goods/list";
										} else {
											alert("회원만 사용할 수 있습니다.")
											self.location="/user/login";
										}
									},
									error : function(){
										alert("카트 담기 실패");
									}
								});
								
								} else {
									alert("상품 수량을 선택해주세요.");
								}
							});
						</script>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
					


<%@ include file="../includes/footer.jsp" %>