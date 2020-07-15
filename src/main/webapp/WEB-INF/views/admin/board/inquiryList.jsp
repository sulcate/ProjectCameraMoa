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
				<h1>1:1문의</h1>
			</div>
			<div>
				카메라모아에 작성 된 문의 목록입니다. 제목을 클릭하여 문의글을 삭제하거나 답변하기를 클릭하여 답변글을 작성 할 수 있습니다.
			</div>
			<br><br>
           		<div id="container_box">
			<table>

					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변</th>
					</tr>
					
				<tbody>
					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:forEach items="${list }" var="inquiry" varStatus="status">
					<c:if test="${inquiry.lev eq 0}">
					<c:set var="i" value="${i + 1}"/>
					</c:if>
					<c:if test="${inquiry.lev ne 0}">
					<c:set var="j" value="${j + 1}"/>
					</c:if>
					<tr>
						<td>${inquiry.ibno}</td>
						<td>
							<a href="/admin/board/inquiryGet?ibno=${inquiry.ibno}">${inquiry.ititle }</a>
						</td>
						<td>${inquiry.iwriter}</td>
						<td>
							<fmt:formatDate value="${inquiry.iregdate}" pattern="yyyy-MM-dd"/>
						</td>
							<c:if test="${inquiry.lev eq 0}">
							<td><button type="button" id="reply_${inquiry.ibno}" class="btn btn-primary">답변하기</button></td>
							</c:if>					
					</tr>
					
						<script>
							$("#reply_${inquiry.ibno}").on("click", function(e) {
								location.href = "/admin/board/inquiryReply?ibno=" + ${inquiry.ibno };
							});
						</script>
					
					<c:if test="${status.last }">
					<tr>
						<td colspan="5" style="text-align:right;">
						총 문의 갯수: <span style="color:red;">${i}</span>개
						</td>
					</tr>
					<tr>
						<td colspan="5" style="text-align:right;">
						총 답변 갯수: <span style="color:red;">${j}</span>개
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