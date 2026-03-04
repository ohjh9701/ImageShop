<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common.css">
</head>
<body>
	<div class="success">
		<h2>
			<spring:message code="common.error.urlNotFound" />
		</h2>

		<a href="javascript:window.history.back();" class="main"><spring:message
				code="common.error.backPage" /></a><br>
		<a href="/" class="charge"><spring:message
				code="common.error.returnHome" /></a>
	</div>
</body>
</html>