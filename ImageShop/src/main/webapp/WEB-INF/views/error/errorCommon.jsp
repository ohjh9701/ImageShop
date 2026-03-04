<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Member Login</title>
<link rel="stylesheet" href="/css/success.css">
</head>
<body>

	<!-- 메인화면 작업 영역 시작 -->
		<div class="success">
			<h2>${ex}</h2>
			<a href="javascript:window.history.back();" class="main"><spring:message
					code="common.error.backPage" /></a><br>
			<a href="/" class="charge"><spring:message
					code="common.error.returnHome" /></a>
		</div>
	<!-- 메인화면 작업 영역 끝 -->


</body>
</html>