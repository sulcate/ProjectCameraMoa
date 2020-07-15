<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

</head>

<!-- Home -->

<div class="home">
	<div class="home_slider_container">

		<!-- Home Slider -->
		<div class="owl-carousel owl-theme home_slider">

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image: url(/resources/images/home_slider_2.jpg)"></div>
				<div class="home_slider_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_slider_content" data-animation-in="fadeIn"
									data-animation-out="animate-out fadeOut">
									<div class="home_slider_title">Nikon D780</div>
									<div class="home_slider_subtitle">
										[특가] 4575만 화소와 ISO 64-25600 CMOS / EXPEED 5 <br /> 저휘도 측광 -3
										EV대응 180K 픽셀 / FX 포맷 기반 풀 프레임 4K UHD<br />하이라이트 중점 측광 / 플리커
										현상 감소 / 액티브 D-Lighting
									</div>
									<div class="button button_light home_button">
										<a href="/goods/detail?n=82">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image: url(/resources/images/home_slider_1.jpg)"></div>
				<div class="home_slider_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_slider_content" data-animation-in="fadeIn"
									data-animation-out="animate-out fadeOut">
									<div class="home_slider_title">Nikon Z-7</div>
									<div class="home_slider_subtitle">
										[특가] 30.4 MEGA PIXELS / DIGIC6+ / High Density Reticular AF II<br />Up
										to 7.0 Frames Per Sec / Dual Pixel CMOS AF
									</div>
									<div class="button button_light home_button">
										<a href="/goods/detail?n=85">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Slider Item -->
			<div class="owl-item home_slider_item">
				<div class="home_slider_background"
					style="background-image: url(/resources/images/home_slider_3.jpg)"></div>
				<div class="home_slider_content_container">
					<div class="container">
						<div class="row">
							<div class="col">
								<div class="home_slider_content" data-animation-in="fadeIn"
									data-animation-out="animate-out fadeOut">
									<div class="home_slider_title">Canon EOS R5 Mark IV</div>
									<div class="home_slider_subtitle">
										[특가] 3,040만 화소 CMOS 센서 / 선명한 사진과 영상을 위한 DIGIC6+ <br /> 61개의
										AF 포인트 High Density Reticular AF II초당 약 7매 고속 연속 촬영 <br /> 약
										162만 도트의 풀 터치 LCD / 고화질의 디지털 시네마 표준 4K 30P
									</div>
									<div class="button button_light home_button">
										<a href="/goods/detail?n=84">Shop Now</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Home Slider Dots -->

		<div class="home_slider_dots_container">
			<div class="container">
				<div class="row">
					<div class="col">
						<div class="home_slider_dots">
							<ul id="home_slider_custom_dots" class="home_slider_custom_dots">
								<li class="home_slider_custom_dot active">01.</li>
								<li class="home_slider_custom_dot">02.</li>
								<li class="home_slider_custom_dot">03.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</div>

<!-- Ads -->

<div class="avds">
	<div
		class="avds_container d-flex flex-lg-row flex-column align-items-start justify-content-between">
		<div class="avds_small">
			<div class="avds_background"
				style="background-image: url(/resources/images/red_cam.jpg)"></div>
			<div class="avds_small_inner">
				<div class="avds_discount_container">
					<img src="/resources/images/discount.png" alt=""
						style="display: block; margin: 0px auto;">
					<div></div>
				</div>
				<div class="avds_small_content">
					<div class="avds_title">SALE</div>
					<div class="avds_text">카메라모아만의 단독 특가</div>
					<div class="avds_link">
						<a href="/goods/list">둘러보기</a>
					</div>
				</div>
			</div>
		</div>
		<div class="avds_large">
			<div class="avds_background"
				style="background-image: url(/resources/images/avds_large.jpg)"></div>
			<div class="avds_large_container">
				<div class="avds_large_content">
					<div class="avds_title">
						믿을수 있는<br /> 카메라모아
					</div>
					<div class="avds_text">
						카메라모아는 100% 정품만을 취급합니다.<br />정품이 아닐 시 100배 환불 보장
					</div>
					<!-- <div class="avds_link avds_link_large">
						<a href="categories.html">See More</a> -->
					<!-- </div> -->
				</div>
			</div>
		</div>
	</div>
</div>

<div style="background: #FFFFFF;">
	<h1 style="color: black; padding-top: 70px; text-align: center;">인기
		상품</h1>
</div>

<!-- Products -->

<div class="products" style="padding-bottom:245px;">
	<div class="container">
		<div class="row">
			<div class="col">

				<div class="product_grid">

					<!-- Product -->
					<c:forEach var="bestView" items="${bestView }">
					<c:choose>
					
					<c:when test="${bestView eq 'fail' }">
					<div class="product">
					아직 등록된 상품이 없습니다.
					</div>
					</c:when>
					
					<c:otherwise>
					
						<div class="product">
							<div class="product_image">
								<a href="/goods/detail?n=${bestView.gdsNum }"><img src="${bestView.gdsThumbImg }" alt=""></a>
							</div>

								<div class="product_extra product_sale">
									<a style="color:white;">Hot</a>
								</div>

							<div class="product_content">
								<div class="product_title">
									<a href="/goods/detail?n=${bestView.gdsNum }">${bestView.gdsName }</a>
								</div>
								<div class="product_price" style="color: red;">
									<fmt:formatNumber value="${bestView.gdsPrice }"
										pattern="###,###,###" />
									원
								</div>
							</div>
						</div>
						
					</c:otherwise>
					
					</c:choose>
					
					</c:forEach>

				</div>

			</div>
		</div>
	</div>
</div>

<!-- Ad -->

<!-- <div class="avds_xl">
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="avds_xl_container clearfix">
					<div class="avds_xl_background"
						style="background-image: url(/resources/images/accessories.jpg)"></div>
					
						<div class="avds_title1">단독특가</div>
						<div class="avds_text1">카메라모아만의 특가 악세서리 모음</div>
						<div class="avds_link1 avds_xl_link">
							<a href="/goods/list5">둘러보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> -->


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




<%@ include file="includes/footer.jsp"%>
