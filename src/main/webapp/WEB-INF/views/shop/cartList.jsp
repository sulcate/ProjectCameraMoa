<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>

<link rel="stylesheet" type="text/css" href="/resources/styles/cart.css">
<link rel="stylesheet" type="text/css" href="/resources/styles/cart_responsive.css">

<script src="/resources/js/cart.js"></script>

<style>
.orderInfo { border:5px solid #eee; padding:20px; display:none;
  margin-left: 60px;
  margin-right: 60px;
  margin-bottom: 150px;}
.orderInfo .inputArea { margin:10px 0; }
.orderInfo .inputArea label { display:inline-block; width:120px; margin-right:10px; }
.orderInfo .inputArea input { font-size:14px; padding:5px; }
.userAddr1 { width:503px; }
.userAddr2, .userAddr3 { width:250px; }

.orderInfo .inputArea:last-child { margin-top:30px; }
.orderInfo .inputArea button { font-size:20px; border:2px solid #ccc; padding:5px 10px; background:#fff; margin-right:20px;}
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
										<li>Shopping Cart</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Cart Info -->

	<div class="cart_info">
		<div class="container">
			<div class="row">
				<div class="col">
					<!-- Column Titles -->
					<div class="cart_info_columns clearfix">
						<div><input type="checkbox" name="allCheck" id="checkAll" checked="checked" />모두 선택</div>
						<div class="cart_info_col cart_info_col_product">Product</div>
						<div class="cart_info_col cart_info_col_price">Price</div>
						<div class="cart_info_col cart_info_col_quantity">Quantity</div>
						<div class="cart_info_col cart_info_col_total">Total</div>
					</div>
				</div>
			</div>
			<div class="row cart_items_row">
				<div class="col">

					<!-- Cart Item -->
					
					<c:choose>
					
					<c:when test="${empty cartList}">
						<div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
							<span style="color:black; font-weight: bold;">카트에 담긴 상품이 없습니다.</span>
						</div>
					</c:when>
					
					<c:otherwise>
					<c:forEach items="${cartList }" var="cartList">
					<div class="cart_item d-flex flex-lg-row flex-column align-items-lg-center align-items-start justify-content-start">
						<div class="chbox">
						<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum }" data-sum="${cartList.gdsPrice * cartList.cartStock}" checked="checked" />
						</div>
						<!-- Name -->
						<div class="cart_item_product d-flex flex-row align-items-center justify-content-start">
							<div class="cart_item_image">
								<div><img src="${cartList.gdsThumbImg }" alt=""></div>
							</div>
							<div class="cart_item_name_container">
								<div class="cart_item_name"><a href="/goods/detail?n=${cartList.gdsNum}">${cartList.gdsName }</a></div>
								<div class="cart_item_edit"><a href="#">Edit Product</a></div>
							</div>
						</div>
						<!-- Price -->
						<div class="cart_item_price"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice }" />원</div>
						<!-- Quantity -->
						<div class="cart_item_quantity">
							<div class="product_quantity_container">
								<div class="product_quantity clearfix">
									<span>Qty</span>
									<input class="quantity_input" type="text" pattern="[0-9]*" data-cartNum="${cartList.cartNum }" value="${cartList.cartStock }">
									<div class="quantity_buttons">
										<div id="quantity_inc_button" class="quantity_inc quantity_control" data-cartNum="${cartList.cartNum }"><i class="fa fa-chevron-up" aria-hidden="true"></i></div>
										<div id="quantity_dec_button" class="quantity_dec quantity_control" data-cartNum="${cartList.cartNum }"><i class="fa fa-chevron-down" aria-hidden="true"></i></div>
									</div>
								</div>
							</div>
						</div>				
						<!-- Total -->
						<div class="cart_item_total"><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" />원</div>
					</div>
					</c:forEach>
					</c:otherwise>
					
					</c:choose>
					<!-- end Cart Item -->

				</div>
			</div>
			<div class="row row_cart_buttons">
				<div class="col">
					<div class="cart_buttons d-flex flex-lg-row flex-column align-items-start justify-content-start">
						<div class="button continue_shopping_button"><a href="/goods/list">쇼핑 계속하기</a></div>
						<div class="cart_buttons_right ml-lg-auto">
							<div class="button clear_cart_button"><a class="delete" style="color:black" onMouseover="this.style.color='white';" onMouseout="this.style.color='black';">선택 상품 삭제</a></div>
							<!-- <div class="button update_cart_button"><a class=delete" style="color:black">선택 상품 삭제</a></div> -->
						</div>
					</div>
				</div>
			</div>
			<div class="row row_extra">
				<div class="col-lg-4">
					
					
				</div>

				<div class="col-lg-6 offset-lg-2">
					<div class="cart_total">
						<div class="section_title">Cart total</div>
						<!-- <div class="section_subtitle">Final info</div> -->
						<div class="cart_total_container">
							<ul>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Subtotal</div>
									<div class="cart_total_value ml-auto"><span id="subtotal"></span></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title">Shipping</div>
									<div class="cart_total_value ml-auto"><span id="shipping"></span></div>
								</li>
								<li class="d-flex flex-row align-items-center justify-content-start">
									<div class="cart_total_title" style="color:red;">Total</div>
									<div class="cart_total_value ml-auto"><span id="total" style="color:red;"></span></div>
								</li>
							</ul>
						</div>
						<div class="button checkout_button"><a class="orderOpne_bnt" style="color:black" onMouseover="this.style.color='white';" onMouseout="this.style.color='black';">주문하기</a></div>
						
						<script>
							
							function numberFormat(inputNumber) {
		   						return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							}
						
							var sum = 0;
							$("input[class='chBox']:checked").each(function() {
								sum = sum + (Number($(this).attr("data-sum")));
								console.log("sum값:" +sum);
								console.log("이건?" + $(this).attr("data-sum"));
							});
							$('#subtotal').html(numberFormat(sum)+"원");
							if (sum < 50000) {
								$('#shipping').html("2,500원");
								$('#total').html(numberFormat(sum+2500)+"원");
							} else {
								$('#shipping').html("Free");
								$('#total').html(numberFormat(sum)+"원");
							}
							
			
						$(".orderOpne_bnt").click(function(){
							
							var string = $("#subtotal").html();
							str = string.replace(/[^0-9]/g,'');
							console.log("str값" + str);
							if (str == 0) {
								alert("담긴 상품이 없습니다."); 
							} else {
								$(".orderInfo").slideDown();
								$(".button.checkout_button").slideUp();
								console.log("sum값 일치하는지" + sum);
							}
						});
						
						</script>
					</div>
				</div>
			</div>
		</div>		
	</div>
	
	<div class="orderInfo">
		<form role="form" action="/shop/cartList" method="post" autocomplete="off">
    
    		<input type="hidden" id="amount" name="amount" value="" />
    
    	<div class="inputArea">
   			<label for="">수령인</label>
   			<input type="text" name="orderRec" id="orderRec" required="required" />
  		</div>
  
  		<div class="inputArea">
   			<label for="orderPhon">수령인 연락처</label>
   			<input type="text" name="orderPhon" id="orderPhon" required="required" />
  		</div>
  
  		<div class="inputArea">
   			<label for="postCode">수령 주소</label>
   			<input type="text" name="postCode" id="sample3_postcode" required="required" placeholder="우편번호" />
   			<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기">
  		</div>
  
  		<div class="inputArea">
  			<label></label>
   			<input type="text" class="userAddr1" name="userAddr1" id="sample3_address" required="required" placeholder="주소" />
  		</div>
  
  		<div class="inputArea">
  			<label></label>
   			<input type="text" class="userAddr2" name="userAddr2" id="sample3_detailAddress" required="required" placeholder="상세주소" />
   			<input type="text" class="userAddr3" name="userAddr3" id="sample3_extraAddress" required="required" placeholder="참고항목" />
 		</div>
  
  		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
  			<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
  		</div>
  
  		<div class="inputArea">
   			<button type="submit" class="order_btn" style="cursor:pointer;">결제</button>
   			<button type="button" class="cancel_btn" style="cursor:pointer;">취소</button> 
  		</div>
  
 		</form> 
	</div>
	
	
									<script>
								
									/* 결제하기 버튼 누를시 총액수값 전달 */
									$(".order_btn").click(function(e) {
								
										var string = $("#subtotal").html();
										str = string.replace(/[^0-9]/g,'');
										console.log("str값" + str);
										if (str == 0) {
											e.preventDefault();
											alert("담긴 상품이 없습니다."); 
										} else {
											$("#amount").val(str);
										}
										
										
									});
								
									
									
									$(".cancel_btn").click(function() {
										$(".orderInfo").slideUp();
										$(".button.checkout_button").slideDown();
										console.log("sum값이 살아잇는지" + sum);
										console.log("html값" + $("#subtotal").html());
										
										});
								
									</script>
									
						
	
<script>

					$(document).ready(function() {
	
						var sum = 0;
						$("input[class='chBox']:checked").each(function() {
							sum = sum + (Number($(this).attr("data-sum")));
							console.log("sum값:" +sum);
							console.log("이건?" + $(this).attr("data-sum"));
						});
						$('#subtotal').html(numberFormat(sum)+"원");
						if (sum < 50000) {
							$('#shipping').html("2,500원");
							$('#total').html(numberFormat(sum+2500)+"원");
						} else {
							$('#shipping').html("Free");
							$('#total').html(numberFormat(sum)+"원");
						}
					});
						
						$(".delete").on("click", function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");
							
							if(confirm_val) {
								var checkArr = new Array();
								
								$("input[class='chBox']:checked").each(function() {
									checkArr.push($(this).attr("data-cartNum"));
								});
								
								$.ajax({
									url : "/shop/deleteCart",
									type : "post",
									data : { chbox : checkArr },
									success : function(){
										location.href="/shop/cartList";
									}
								});
							}
							
							
						});
						
						
						/* 모두 선택 클릭 발생시, 밑의 체크박스 모두 선택 */
						$("#checkAll").click(function(){
							var chk = $("#checkAll").prop("checked");
							if(chk) {
								$(".chBox").prop("checked", true);
							} else {
								$(".chBox").prop("checked", false);
							}
						});
				
						/* 밑의 체크박스 클릭 발생시, 모두 선택 체크해제 */
						$(".chBox").click(function() {
							$("#checkAll").prop("checked", false);
						});
						
						/* 체크박스 클릭 발생시, 총합계 계산 */
						$(document).on("click", "input[class='chBox']", function() {
							console.log("클릭확인");
							$.ajax({
								type: 'get',
								url : "/shop/test",
								success : function(json) {
									console.log("여기가 동작하는지" + json);
									$('#subtotal').empty();
									$('#shipping').empty();
									$('#total').empty();
		
									$(document).ready(function() {
									
										var sum = 0;
										$("input[class='chBox']:checked").each(function() {
											sum = sum + (Number($(this).attr("data-sum")));
											console.log("sum값:" +sum);
											console.log("이건?" + $(this).attr("data-sum"));
										});
										$('#subtotal').html(numberFormat(sum)+"원");
										if (sum < 50000) {
											$('#shipping').html("2,500원");
											$('#total').html(numberFormat(sum+2500)+"원");
										} else {
											$('#shipping').html("Free");
											$('#total').html(numberFormat(sum)+"원");
										}
									});
									
								},error:function(json){
									
								}
							});
						});
						
						/* 모두 선택 클릭 발생시, 총합계 계산 */
						$(document).on("click", "input[id='checkAll']", function() {
							console.log("클릭확인");
							$.ajax({
								type: 'get',
								url : "/shop/test",
								success : function(json) {
									console.log("여기가 동작하는지" + json);
									$('#subtotal').empty();
									$('#shipping').empty();
									$('#total').empty();
									
									$(document).ready(function() {
									
										var sum = 0;
										$("input[class='chBox']:checked").each(function() {
											sum = sum + (Number($(this).attr("data-sum")));
											console.log("sum값:" +sum);
											console.log("이건?" + $(this).attr("data-sum"));
										});
										$('#subtotal').html(numberFormat(sum)+"원");
										if (sum < 50000) {
											$('#shipping').html("2,500원");
											$('#total').html(numberFormat(sum+2500)+"원");
										} else {
											$('#shipping').html("Free");
											$('#total').html(numberFormat(sum)+"원");
										}
									});
									
								},error:function(json){
									
								}
							});
						});
						
						/* + 버튼 클릭시  */
						$(document).on('click', '#quantity_inc_button', function(){
							var $button = $(this);
							var oldValue = $button.parent().parent().find(".quantity_input").val();

							  var newVal;
							  newVal = parseFloat(oldValue) + 1;
							  
							  console.log("클릭확인과 oldValue,newVal 값" + oldValue,newVal);
							  
							  $button.parent().parent().find(".quantity_input").val(newVal);
							  
							  var checkArr = new Array();
							  var checkSt = new Array();
							  
							  console.log("checkArr값:" + $button);
							  console.log("stock값" + newVal);
								
								checkArr.push($button.attr("data-cartNum"));
								checkSt.push(newVal);

							    $.ajax({
								url : "/shop/updateCart",
								type : "post",
								data : { chbox : checkArr,
									     stock : checkSt 
								},	
								dataType : "json",
								success : function(result){
									
									console.log("result값1" + result);
									
									if(result == 1) {
										console.log("여기가 실행됨");
										$.ajax({
											type: 'get',
											url : "/shop/test2",
											data : { chbox : checkArr },
											success : function(json) {
												console.log("여기가 동작하는지" + json);
												$button.parent().parent().parent().parent().parent().find(".cart_item_total").empty();
												$button.parent().parent().parent().parent().parent().find(".chbox").empty();
												$('#subtotal').empty();
												$('#shipping').empty();
												$('#total').empty();
												
												
												var html = '';
							
												function numberFormat(inputNumber) {
													   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													}
												
												$(json).each(function(i, obj) {
													
													console.log("곱하기값" + obj.gdsPrice*obj.cartStock);
													
													console.log("값확인" + obj.gdsName);
													
													$button.parent().parent().parent().parent().parent().find(".cart_item_total").append(numberFormat(obj.gdsPrice * obj.cartStock) + '원');
													
													html = $('<input type="checkbox" name="chBox" class="chBox" data-cartNum="' + obj.cartNum + '" data-sum="' + obj.gdsPrice * obj.cartStock + '" checked="checked" />');
													$button.parent().parent().parent().parent().parent().find(".chbox").append(html);
										
												});
			
												$(document).ready(function() {
													
													var sum = 0;
													$("input[class='chBox']:checked").each(function() {
														sum = sum + (Number($(this).attr("data-sum")));
														console.log("sum값:" +sum);
														console.log("이건?" + $(this).attr("data-sum"));
													});
													$('#subtotal').html(numberFormat(sum)+"원");
													if (sum < 50000) {
														$('#shipping').html("2,500원");
														$('#total').html(numberFormat(sum+2500)+"원");
													} else {
														$('#shipping').html("Free");
														$('#total').html(numberFormat(sum)+"원");
													}
												});
												
											},error:function(json){
												
											}
										});
										
										} else {
										console.log("result값2" + result);
										alert("실패");
									}
								}
							});
						});
						
						/* - 버튼 클릭시  */
						$(document).on('click', '#quantity_dec_button', function(){
							var $button = $(this);
							var oldValue = $button.parent().parent().find(".quantity_input").val();

							  var newVal;
							  newVal = parseFloat(oldValue) - 1;
							  
							  console.log("클릭확인과 oldValue,newVal 값" + oldValue,newVal);
							  
							  $button.parent().parent().find(".quantity_input").val(newVal);
							  
							  var checkArr = new Array();
							  var checkSt = new Array();
							  
							  console.log("checkArr값:" + $button);
							  console.log("stock값" + newVal);
								
								checkArr.push($button.attr("data-cartNum"));
								checkSt.push(newVal);

							    $.ajax({
								url : "/shop/updateCart",
								type : "post",
								data : { chbox : checkArr,
									     stock : checkSt 
								},	
								dataType : "json",
								success : function(result){
									
									console.log("result값1" + result);
									
									if(result == 1) {
										console.log("여기가 실행됨");
										$.ajax({
											type: 'get',
											url : "/shop/test2",
											data : { chbox : checkArr },
											success : function(json) {
												console.log("여기가 동작하는지" + json);
												$button.parent().parent().parent().parent().parent().find(".cart_item_total").empty();
												$button.parent().parent().parent().parent().parent().find(".chbox").empty();
												$('#subtotal').empty();
												$('#shipping').empty();
												$('#total').empty();
												
												
												var html = '';
							
												function numberFormat(inputNumber) {
													   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													}
												
												$(json).each(function(i, obj) {
													
													console.log("곱하기값" + obj.gdsPrice*obj.cartStock);
													
													console.log("값확인" + obj.gdsName);
													
													$button.parent().parent().parent().parent().parent().find(".cart_item_total").append(numberFormat(obj.gdsPrice * obj.cartStock) + '원');
													
													html = $('<input type="checkbox" name="chBox" class="chBox" data-cartNum="' + obj.cartNum + '" data-sum="' + obj.gdsPrice * obj.cartStock + '" checked="checked" />');
													$button.parent().parent().parent().parent().parent().find(".chbox").append(html);
										
												});
			
												$(document).ready(function() {
													
													var sum = 0;
													$("input[class='chBox']:checked").each(function() {
														sum = sum + (Number($(this).attr("data-sum")));
														console.log("sum값:" +sum);
														console.log("이건?" + $(this).attr("data-sum"));
													});
													$('#subtotal').html(numberFormat(sum)+"원");
													if (sum < 50000) {
														$('#shipping').html("2,500원");
														$('#total').html(numberFormat(sum+2500)+"원");
													} else {
														$('#shipping').html("Free");
														$('#total').html(numberFormat(sum)+"원");
													}
												});
												
											},error:function(json){
												
											}
										});
										
										} else {
										console.log("result값2" + result);
										alert("실패");
									}
								}
							});
						});
						
						/* 수량값 수정 후, 마우스 포커스가 벗어날경우  */
						$(document).on('keyup', '.quantity_input', function(){
							var $button = $(this);
							var Value = $(this).val();
							  
							var checkArr = new Array();
							var checkSt = new Array();
							  
							  console.log("checkArr값:" + $button.attr("data-cartNum"));
							  console.log("Value값:" + Value);
								
								checkArr.push($button.attr("data-cartNum"));
								checkSt.push(Value);

							    $.ajax({
								url : "/shop/updateCart",
								type : "post",
								data : { chbox : checkArr,
									     stock : checkSt 
								},	
								dataType : "json",
								success : function(result){
									
									console.log("result값1" + result);
									
									if(result == 1) {
										console.log("여기가 실행됨");
										$.ajax({
											type: 'get',
											url : "/shop/test2",
											data : { chbox : checkArr },
											success : function(json) {
												console.log("여기가 동작하는지" + json);
												$button.parent().parent().parent().parent().find(".cart_item_total").empty();
												$button.parent().parent().parent().parent().find(".chbox").empty();
												$('#subtotal').empty();
												$('#shipping').empty();
												$('#total').empty();
												
												
												var html = '';
							
												function numberFormat(inputNumber) {
													   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
													}
												
												$(json).each(function(i, obj) {
													
													console.log("곱하기값" + obj.gdsPrice*obj.cartStock);
													
													console.log("값확인" + obj.gdsName);
													
													$button.parent().parent().parent().parent().find(".cart_item_total").append(numberFormat(obj.gdsPrice * obj.cartStock) + '원');
													
													html = $('<input type="checkbox" name="chBox" class="chBox" data-cartNum="' + obj.cartNum + '" data-sum="' + obj.gdsPrice * obj.cartStock + '" checked="checked" />');
													$button.parent().parent().parent().parent().find(".chbox").append(html);
										
												});
			
												$(document).ready(function() {
													
													var sum = 0;
													$("input[class='chBox']:checked").each(function() {
														sum = sum + (Number($(this).attr("data-sum")));
														console.log("sum값:" +sum);
														console.log("이건?" + $(this).attr("data-sum"));
													});
													$('#subtotal').html(numberFormat(sum)+"원");
													if (sum < 50000) {
														$('#shipping').html("2,500원");
														$('#total').html(numberFormat(sum+2500)+"원");
													} else {
														$('#shipping').html("Free");
														$('#total').html(numberFormat(sum)+"원");
													}	
												});
												
											},error:function(json){
												
											}
										});
										
										} else {
										console.log("result값2" + result);
										alert("실패");
									}
								}
							});
						});
						
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample3_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample3_detailAddress").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>

<%@ include file="../includes/footer.jsp" %>