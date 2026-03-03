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
<title>T1 Coin Charge</title>
<link rel="stylesheet" href="/css/CoinCharge.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="main-wrapper">
		<div class="container">
			<h2>
				<spring:message code="coin.header.chargeCoin" />
			</h2>

			<form:form modelAttribute="chargeCoin" action="charge" method="post">
				<table>
					<tr>
						<td><spring:message code="coin.amount" /></td>
						<td><form:input path="amount" /></td>
						<td><font color="red"><form:errors path="amount" /></font></td>
					</tr>
				</table>
			</form:form>

			<div>
				<button type="submit" id="btnCharge">
					<spring:message code="action.charge" />
				</button>
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			var formObj = $("#chargeCoin");

			$("#btnCharge").on("click", function() {
				formObj.submit();
			});

			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>