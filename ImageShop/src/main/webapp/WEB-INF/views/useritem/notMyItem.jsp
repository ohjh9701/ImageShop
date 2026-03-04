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
			<spring:message code="item.header.downloadError" />
		</h2>
		<p>
			<spring:message code="item.notMyItem" />
		</p>
		<a href="list" class="charge"><spring:message code="action.list" /></a>
	</div>
</body>
</html>