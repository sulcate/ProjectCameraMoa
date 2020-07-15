<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/resources/js/jquery-3.2.1.min.js"></script>
</head>
<body>

<script>
$( document ).ready(function() {
			<sec:authorize access="hasRole('ROLE_BLACK')">
			self.location="/user/logout";
			alert("이용이 정지된 계정입니다.");
			</sec:authorize>
		});
</script>

</body>
</html>