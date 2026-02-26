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
<title>T1 Board Registration</title>
<link rel="stylesheet" href="/css/boardRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="main-wrapper">
		<div class="container">
			<h2>
				T1 커뮤니티 글작성
			</h2>
			<form:form modelAttribute="board" action="/board/register"
				method="post">
				<table>
					<tr>
						<td><spring:message code="board.title" /></td>
						<td><form:input path="title" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="board.writer" /></td>
						<td><form:input path="writer" readonly="true" /></td>
						<td><font color="red"><form:errors path="writer" /></font></td>
					</tr>
					<tr>
						<td><spring:message code="board.content" /></td>
						<td><form:textarea path="content" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
			</form:form>
			<div>
				<sec:authorize access="isAuthenticated()">
				<button type="button" id="btnRegister">
					<spring:message code="action.register" />
				</button>
				</sec:authorize>
					<button type="button" id="btnList">
						<spring:message code="action.list" />
					</button>
			</div>
		</div>
	</div>
	<!-- 메인화면 작업 영역 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#board");
			$("#btnRegister").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>