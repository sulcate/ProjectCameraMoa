<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<sec:authentication property="principal.username" var="userid" />

<html lang="en">

<head>
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
#container_box table { width:1100px; align:center; }
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background: #eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
#container_box table caption { font-size:25px; font-weight:bold; padding:5px; color:#800000;}
</style>

</head>


<body>

<%@ include file="../includes/header.jsp" %>
    
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <div>
				<h1>주문 관리</h1>
			</div>
			<div>
				카메라모아에서 배송 대기중인 주문 목록 및 상품이 발송된 주문 목록입니다. 주문번호를 클릭해 상세페이지에서 상태를 변경할 수 있습니다.
			</div>
			<br><br>
           		<div id="container_box">
           		<table>
           		<caption>배송 대기중인 주문 목록</caption>

					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>주문자</th>
						<th>수령인</th>
						<th>주소</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
					
				<tbody>
					<c:set var="i" value="0" />
					<c:forEach items="${orderList }" var="orderList" varStatus="status">
					<c:if test="${orderList.delivery == '배송 준비'}">
					<c:set var="i" value="${i + 1}"/>
					<tr>
						<td>
							<a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
						</td>
						<td><fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd" /></td>
						<td>${orderList.userId}</td>
						<td>${orderList.orderRec}</td>
						<td>
							(${orderList.postCode}) ${orderList.userAddr1} ${orderList.userAddr2} ${orderList.userAddr3}
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원
						</td>
						<td>${orderList.delivery }</td>
					</tr>
					</c:if>
					<c:if test="${status.last }">
					<tr>
						<td colspan="7" style="text-align:right;">
						총 주문 건수: <span style="color:red;"><c:out value="${i}" /></span>개
						</td>
					</tr>
					</c:if>
				
					</c:forEach>
				</tbody>
			</table><br><br><br>
			
			<table>
           		<caption>배송 중인 주문 목록</caption>

					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>주문자</th>
						<th>수령인</th>
						<th>주소</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
					
				<tbody>
					<c:set var="j" value="0" />
					<c:forEach items="${orderList }" var="orderList" varStatus="status">
					<c:if test="${orderList.delivery == '배송 중'}">
					<c:set var="j" value="${j + 1}"/>
					<tr>
						<td>
							<a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
						</td>
						<td><fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd" /></td>
						<td>${orderList.userId}</td>
						<td>${orderList.orderRec}</td>
						<td>
							(${orderList.postCode}) ${orderList.userAddr1} ${orderList.userAddr2} ${orderList.userAddr3}
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원
						</td>
						<td>${orderList.delivery }</td>
					</tr>
					</c:if>
					<c:if test="${status.last }">
					<tr>
						<td colspan="7" style="text-align:right;">
						총 진행 건수: <span style="color:red;"><c:out value="${j}" /></span>개
						</td>
					</tr>
					</c:if>
				
					</c:forEach>
				</tbody>
			</table><br><br><br>
			
			<table>
			<caption>배송이 끝난 주문 목록</caption>
					<tr>
						<th>주문번호</th>
						<th>주문날짜</th>
						<th>주문자</th>
						<th>수령인</th>
						<th>주소</th>
						<th>가격</th>
						<th>상태</th>
					</tr>
					
				<tbody>
				<c:set var="k" value="0" />
				<c:forEach items="${orderList }" var="orderList" varStatus="status">
					<c:if test="${orderList.delivery == '배송 완료'}">
					<c:set var="k" value="${k + 1}"/>
					<tr>
						<td>
							<a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
						</td>
						<td><fmt:formatDate value="${orderList.orderDate}" pattern="yyyy.MM.dd" /></td>
						<td>${orderList.userId}</td>
						<td>${orderList.orderRec}</td>
						<td>
							(${orderList.postCode}) ${orderList.userAddr1} ${orderList.userAddr2} ${orderList.userAddr3}
						</td>
						<td>
							<fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원
						</td>
						<td>${orderList.delivery }</td>
					</tr>
					</c:if>
					<c:if test="${status.last }">
					<tr>
						<td colspan="7" style="text-align:right;">
						총 완료 건수: <span style="color:red;"><c:out value="${k}" /></span>개
						</td>
					</tr>
					</c:if>
					
					</c:forEach>
				</tbody>
			</table>
	
		</div>
            </div>    
        </div>
        <!-- /#page-wrapper -->
        
<%@ include file="../includes/footer.jsp" %>

</sec:authorize>