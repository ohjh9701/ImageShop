<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Member Success</title>
<link rel="stylesheet" href="/css/success.css">
</head>
<body>
	<div class="success">
		<h2>
			<spring:message code="common.joinMemberFailed"
				arguments="${userName}" />
		</h2>
		<a href="/user/register"><spring:message code="action.register" /></a>
	</div>
</body>
</html>