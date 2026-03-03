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
<title>T1 Item Registration</title>
<link rel="stylesheet" href="/css/itemRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="main-wrapper">
		<div class="container">
			<h2>T1 Shop 상품 수정</h2>
			<form:form modelAttribute="item" action="/item/remove" method="post"
				enctype="multipart/form-data">
				<form:hidden path="itemId" />
				<form:hidden path="pictureUrl" />
				<form:hidden path="previewUrl" />
				<table>
					<tr>
						<td><spring:message code="item.itemName" /></td>
						<td><form:input path="itemName" disabled="true"/></td>
					</tr>
					<tr class="price">
						<td><spring:message code="item.itemPrice" /></td>
						<td><form:input path="price" disabled="true"/></td>
					</tr>

					<tr>
						<td><spring:message code="item.picture" /></td>
						<td><img src="picture?itemId=${item.itemId}" width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="item.preview" /></td>
						<td><img src="display?itemId=${item.itemId}" width="210"></td>
					</tr>
					<tr>
						<td><spring:message code="item.itemDescription" /></td>
						<td><form:textarea path="description" disabled="true"/></td>
					</tr>
				</table>
			</form:form>
			<div>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
				<button type="submit" id="btnList">
					<spring:message code="action.list" />
				</button>

			</div>
		</div>
	</div>
	<!-- 메인화면 작업 영역 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			$("#btnRemove").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>
</body>
</html>