<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication property="principal.username" var="userid" />

<html lang="en">

<head>
<script src="/resources/js/jquery-3.2.1.min.js"></script>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" type="image/png" sizes="16x16" href="/resources/pluginsAdmin/images/favicon.png">
    <title>Pixel Admin - Responsive Admin Dashboard Template built with Twitter Bootstrap</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resources/bootstrapAdmin/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="/resources/pluginsAdmin/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- toast CSS -->
    <link href="/resources/pluginsAdmin/bower_components/toast-master/css/jquery.toast.css" rel="stylesheet">
    <!-- morris CSS -->
    <link href="/resources/pluginsAdmin/bower_components/morrisjs/morris.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="/resources/cssAdmin/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="/resources/cssAdmin/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="/resources/cssAdmin/colors/blue-dark.css" id="theme" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<style>
	body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
	ul { padding:0; margin:0; list-style:none;  }
 
	div#root { width:90%; margin:0 auto; }
	
	header#header { font-size:40px; padding:20px 0; }
	header#header h1 a { color:#000; font-weight:bold; }
	
	nav#nav { padding:10px; text-align:right; }
	nav#nav ul li { display:inline-block; margin-left:10px; }
 
 		section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
	section#container::after { content:""; display:block; clear:both; }
	aside { float:left; width:200px; }
	div#container_box { float:right; width:calc(100% - 10px - 20px); }
	
	aside ul li { text-align:center; margin-bottom:10px; }
	aside ul li a { display:block; width:100%; padding:10px 0;}
	aside ul li a:hover { background:#eee; }
	
	footer#footer { background:#f9f9f9; padding:20px; }
	footer#footer ul li { display:inline-block; margin-right:10px; } 
</style>

<style>
 .orderInfo { border:5px solid #D8D8D8; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #D8D8D8; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:150px; height:auto; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 .deliveryChange { text-align:right; }
 .delivery1_btn,
 .delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
</style>

</head>


<body>

<%@ include file="../includes/header.jsp" %>
    
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <div>
				<h1>주문 상세 페이지</h1>
			</div>
			<div>
				주문 상세 페이지입니다. 배송상태를 변경할 수 있습니다.
			</div>
			<br><br>
           		<div id="container_box">
		
			<div class="orderInfo">
				<c:forEach items="${orderView }" var="orderView" varStatus="status">
				
					<c:if test="${status.first }">
						<p><span>주문자</span>${orderView.userId}</p>
						<p><span>주문날짜</span><fmt:formatDate value="${orderView.orderDate}" pattern="yyyy.MM.dd" /></p>
   						<p><span>수령인</span>${orderView.orderRec}</p>
   						<p><span>주소</span>(${orderView.postCode}) ${orderView.userAddr1} ${orderView.userAddr2} ${orderView.userAddr3}</p>
   						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
   						<p><span>상태</span>${orderView.delivery }</p>
   						
   						<div class="deliveryChange">
   							<form role="form" method="post" class="deliveryForm">
   							
   								<input type="hidden" name="orderId" value="${orderView.orderId }" />
   								<input type="hidden" name="delivery" class="delivery" value="" />
   								
   								<button type="button" id="delivery0_btn" class="btn btn-primary">배송 준비</button>
   								<button type="button" id="delivery1_btn" class="btn btn-primary">배송 중</button>
   								<button type="button" id="delivery2_btn"class="btn btn-primary">배송 완료</button>
   								
   								<script>
   								$("#delivery0_btn").click(function() {
										var con = confirm("배송 준비 상태로 변경됩니다.");
										if (con) {
											$(".delivery").val("배송 준비");
											run();
										}
								});
								
									$("#delivery1_btn").click(function() {
										var con = confirm("배송 중 상태로 변경됩니다.");
										if (con) {
											$(".delivery").val("배송 중");
											run();
										}
									});
									
									$("#delivery2_btn").click(function() {
										var con = confirm("배송 완료 상태로 변경됩니다.");
										if (con) {
											$(".delivery").val("배송 완료");
											run();
										}
									});
   									
   									function run() {
   										$(".deliveryForm").submit();
   									}
   								</script>
   							</form>
   							
   						</div>
   					</c:if>
   				</c:forEach>
			</div>
		
			<ul class="orderView">
				<c:forEach items="${orderView }" var="orderView">
				<li>
					<div class="thumb">
						<img src="${orderView.gdsThumbImg }" />
					</div>
					<div class="gdsInfo">
						<p>
							<span>상품명</span>${orderView.gdsName}<br />
    						<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
    						<span>구입 수량</span>${orderView.cartStock} 개<br />
    						<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원
						</p>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
            </div>    
        </div>
        <!-- /#page-wrapper -->
    
<%@ include file="../includes/footer.jsp" %>

</sec:authorize>
