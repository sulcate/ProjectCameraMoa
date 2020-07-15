<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/styles/categories.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/categories_responsive.css">

<script src="/resources/js/categories.js"></script>

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
										<li>콤팩트 카메라</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Products -->

	<div class="products">
		<div class="container">
			<div class="row">
				<div class="col">
					
					<!-- Product Sorting -->
					<div class="sorting_bar d-flex flex-md-row flex-column align-items-md-center justify-content-md-start">
											
						<c:forEach var="goods" items="${list }" varStatus="status">
							<c:if test="${status.last }">
								<div class="results">Showing <span style="color:red">${status.count}</span> results</div>
							</c:if>
						</c:forEach>
						
						<div class="sorting_container ml-md-auto">
							<div class="sorting">
								<ul class="item_sorting">
									<li>
										<span class="sorting_text">콤팩트 카메라</span>
										<i class="fa fa-chevron-down" aria-hidden="true"></i>
										<ul>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">All</a></span></li>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list1" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">SLR 카메라</a></span></li>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list2" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">미러리스 카메라</a></span></li>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list3" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">콤팩트 카메라</a></span></li>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list4" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">렌즈</a></span></li>
											<li class="product_sorting_btn" style="cursor:default;" ><span><a href="/goods/list5" style="color:black;" onMouseover="this.style.color='red';" onMouseout="this.style.color='black';">액세서리</a></span></li>
										</ul>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col">
					
					<div class="product_grid">

						<!-- Product -->
						<c:forEach var="goods" items="${list }">
						<div class="product">
							<div class="product_image" style="padding:5px; width:200px; height:160px;"><a href="/goods/detail?n=${goods.gdsNum }"><img src="${goods.gdsThumbImg }" width=200px; height=160px; alt=""></a></div>
							<!-- <div class="product_extra product_new"><a href="categories.html">New</a></div>
							<div class="product_extra product_sale"><a href="categories.html">Sale</a></div> -->
							
							<c:forEach var="bestView" items="${bestView }">
							<c:if test="${bestView ne 'fail' }">
							<c:if test="${goods.gdsNum eq bestView.gdsNum }">
								<div class="product_extra product_sale">
									<a style="color:white;">Hot</a>
								</div>
							</c:if>
							</c:if>
							</c:forEach>
							
							<c:if test="${goods.gdsStock eq 0 }">
								<div class="product_extra product_new" style="width:90px;">
									<a style="color:white;">Sold Out</a>
								</div>
							</c:if>
							
							<div class="product_content">
								<div class="product_title"><a href="/goods/detail?n=${goods.gdsNum }">${goods.gdsName }</a></div>
								<div class="product_price"><fmt:formatNumber value="${goods.gdsPrice }" pattern="###,###,###" />원</div>
							</div>
						</div>
						</c:forEach>

					</div>
					<!-- <div class="product_pagination">
						<ul>
							<li class="active"><a href="#">01.</a></li>
							<li><a href="#">02.</a></li>
							<li><a href="#">03.</a></li>
						</ul>
					</div> -->
						
				</div>
			</div>
		</div>
	</div>

	<!-- Icon Boxes -->

<div class="icon_boxes">
	<div class="container">
		<div class="row icon_box_row">

			<!-- Icon Box -->
			<div class="col-lg-4 icon_box_col">
				<div class="icon_box">
					<div class="icon_box_image">
						<img src="/resources/images/icon_1.svg" alt="">
					</div>
					<div class="icon_box_title">5만원 이상 전국 무료배송</div>
					<div class="icon_box_text">
						<p>전국 어디든 안전하고 빠르게 배송 해드립니다.</p>
					</div>
				</div>
			</div>

			<!-- Icon Box -->
			<div class="col-lg-4 icon_box_col">
				<div class="icon_box">
					<div class="icon_box_image">
						<img src="/resources/images/icon_2.svg" alt="">
					</div>
					<div class="icon_box_title">무료 교환 & 환불</div>
					<div class="icon_box_text">
						<p>제품 불량 시 전 상품 무료로 교환 및 환불이 가능합니다.</p>
					</div>
				</div>
			</div>

			<!-- Icon Box -->
			<div class="col-lg-4 icon_box_col">
				<div class="icon_box">
					<div class="icon_box_image">
						<img src="/resources/images/icon_3.svg" alt="">
					</div>
					<div class="icon_box_title">신속한 고객 응대</div>
					<div class="icon_box_text">
						<p>언제나 고객님의 문의에 빠르고 신속하게 응대해 드리겠습니다.</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>


<%@ include file="../includes/footer.jsp" %>