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
#container_box table { width:1100px; align:center; }
#container_box table th { font-size:20px; font-weight:bold;
							text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background: #eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
</style>

</head>

<body>

<%@ include file="../includes/header.jsp" %>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
            <div>
				<h1>구매후기</h1>
			</div>
			<div>
				카메라모아에 등록 된 구매후기 목록입니다. 제목을 클릭하여 글을 삭제하거나 댓글 등록,삭제를 할 수 있습니다.
			</div>
			<br><br>
           		<div id="container_box">
			<table>

					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>최종수정일</th>
					</tr>
					
				<tbody>
					<c:forEach items="${list }" var="review" varStatus="status">
					<tr>
						<td>${review.bno}</td>
						<td>
							<a href="/admin/board/reviewGet?bno=${review.bno}">${review.title }</a> <b style="color:#800000">[ <c:out value="${review.replyCnt}" /> ]</b>
						</td>
						<td>${review.writer}</td>
						<td>
							<fmt:formatDate value="${review.regdate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>
							<fmt:formatDate value="${review.updateDate}" pattern="yyyy-MM-dd" />
						</td>
					</tr>
					<c:if test="${status.last }">
					<tr>
						<td colspan="5" style="text-align:right;">
						총 후기 갯수: <span style="color:red;">${status.count}</span>개
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