<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Admin Setup Failed</title>
<link rel="stylesheet" href="/css/success.css">
</head>
<body>
	<div class="success">
		<h2>
			<spring:message code="common.cannotSetupAdmin" />
		</h2>
		<a href="/" class="main"><spring:message code="action.home" /></a>
	</div>
</body>
</html>