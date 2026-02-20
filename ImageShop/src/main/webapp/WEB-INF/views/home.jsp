<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--
<script type="text/javascript" src="/js/test.js"></script>
<link type="stylesheet" href="/css/style.css">
-->
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div align="center">
	<h1>
		<spring:message code="common.homeWelcome" />
	</h1>
	<P>${serverTime}</P>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>