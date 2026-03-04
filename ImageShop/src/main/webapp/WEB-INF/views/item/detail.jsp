<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail : ${board.title}</title>
<link rel="stylesheet" href="/css/itemRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>
			<spring:message code="item.header.read" />
		</h2>

		<form:form modelAttribute="item" action="buy">
			<form:hidden path="itemId" />
			<form:hidden path="pictureUrl" />
			<form:hidden path="previewUrl" />

			<table>
				<tr>
					<td><spring:message code="item.itemName" /></td>
					<td>${item.itemName}</td>
				</tr>
				<tr>
					<td><spring:message code="item.itemPrice" /></td>
					<td>${item.price}원</td>
				</tr>
				<tr>
					<td><spring:message code="item.preview" /></td>
					<td><img src="display?itemId=${item.itemId}" width="210"></td>
				</tr>
				<tr>
					<td><spring:message code="item.itemDescription" /></td>
					<td><form:textarea path="description" disabled="true" /></td>
				</tr>
			</table>
		</form:form>
		<div>
			<!-- 구매하기 버튼 추가 -->
			<sec:authorize access="hasAnyRole('ROLE_MEMBER')">
			<button type="submit" id="btnBuy">
				<spring:message code="action.buy" />
			</button>
			</sec:authorize>
			<button type="submit" id="btnList">
				<spring:message code="action.list" />
			</button>
		</div>
	</div>


	<!-- 메인화면 작업 영역 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 이벤트 처리 영역 -->

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			// 구매하기 버튼 이벤트 처리 
			$("#btnBuy").on("click", function() 
			{ formObj.submit(); 
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>

</body>
</html>