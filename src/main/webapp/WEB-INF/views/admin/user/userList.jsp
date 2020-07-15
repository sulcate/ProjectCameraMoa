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
            <h1>회원 관리</h1>
         </div>
         <div>
            카메라모아에 가입한 회원 목록입니다. 권한 버튼 클릭시, 해당 id의 권한을 관리자 혹은 일반회원으로 변경 가능합니다.
         </div>
         <br><br>
                 <div id="container_box">
                 <table>

               <tr>
                  <th>id</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>연락처</th>
                  <th>주소</th>
                  <th>권한</th>
                  <th>블랙리스트</th>
               </tr>
               
            <tbody>
               <c:forEach items="${userList }" var="userList" varStatus="status">
               <tr>
                  <td>${userList.userid}</td>
                  <td>${userList.userName}</td>
                  <td>${userList.userEmail}</td>
                  <td>
                     ${userList.userPhone}
                  </td>
                  <td>
                     (${userList.userZipCode}) ${userList.userFirAddr} ${userList.userSecAddr} ${userList.userAddrDetail}
                  </td>
                  
                  <form role="form" method="post" class="authForm_${userList.userid}">
                     <input type="hidden" name="userid" value="${userList.userid}" />
                        <input type="hidden" name="auth" class="auth_${userList.userid}" value="" />
                        <c:if test="${userList.auth eq 'ROLE_ADMIN'}">
                           <td><button type="button" id="userAuth0_btn_${userList.userid}" class="btn btn-primary">관리자</button></td>
                        </c:if>
                     <c:if test="${userList.auth eq 'ROLE_USER'}">
                        <td><button type="button" id="userAuth1_btn_${userList.userid}" class="btn btn-primary">일반회원</button></td>
                     </c:if>
                     <c:if test="${userList.auth eq 'ROLE_BLACK'}">
                        <td><button type="button" class="btn btn-primary">차단됨</button></td>
                     </c:if>
                     <c:if test="${userList.auth eq 'ROLE_USER'}">
                     	<td><button type="button" id="userAuth2_btn_${userList.userid}" class="btn btn-danger">차단하기</button></td>
                     </c:if>
                     <c:if test="${userList.auth eq 'ROLE_BLACK'}">
                     	<td><button type="button" id="userAuth3_btn_${userList.userid}" class="btn btn-info">차단해제</button></td>
                     </c:if>
                  </form>
                  
               </tr>

               <c:if test="${status.last }">
               <tr>
                  <td colspan="7" style="text-align:right;">
                  총 회원 수: <span style="color:red;"><c:out value="${status.count}" /></span>명
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
        
        <c:forEach items="${userList }" var="userList" varStatus="status">
        <script>
      
         $("#userAuth0_btn_${userList.userid}").click(function() {
            var con = confirm("일반회원 상태로 변경됩니다.");
            if (con) {
               $(".auth_${userList.userid}").val("ROLE_USER");
               $(".authForm_${userList.userid}").submit();
            }
         });
      
         $("#userAuth1_btn_${userList.userid}").click(function() {
            var con = confirm("관리자 상태로 변경됩니다.");
            if (con) {
               $(".auth_${userList.userid}").val("ROLE_ADMIN");
               $(".authForm_${userList.userid}").submit();
            }
         });
         
         $("#userAuth2_btn_${userList.userid}").click(function() {
             var con = confirm("해당 회원을 차단 하시겠습니까?");
             if (con) {
                $(".auth_${userList.userid}").val("ROLE_BLACK");
                $(".authForm_${userList.userid}").submit();
             }
          });
         
         $("#userAuth3_btn_${userList.userid}").click(function() {
             var con = confirm("해당 회원의 차단을 해제 하시겠습니까?");
             if (con) {
                $(".auth_${userList.userid}").val("ROLE_USER");
                $(".authForm_${userList.userid}").submit();
             }
          });

      </script>
      </c:forEach>

<%@ include file="../includes/footer.jsp" %>

</sec:authorize>