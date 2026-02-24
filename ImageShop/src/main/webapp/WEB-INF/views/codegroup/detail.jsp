<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code Group Detail</title>
<link rel="stylesheet" href="/css/detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
	<h2>
		<spring:message code="codegroup.header.read" />
	</h2>
	<form:form modelAttribute="codeGroup">
		<table>
			<tr>
				<td><spring:message code="codegroup.groupCode" /></td>
				<td><form:input path="groupCode" readonly="true" /></td>
				<td><font color="red"><form:errors path="groupCode" /></font></td>
			</tr>
			<tr>
				<td><spring:message code="codegroup.groupName" /></td>
				<td><form:input path="groupName" readonly="true" /></td>
				<td><font color="red"><form:errors path="groupName" /></font></td>
			</tr>
		</table>
	</form:form>
	<div>
		<button type="submit" id="btnEdit">
			<spring:message code="action.edit" />
		</button>
		<button type="submit" id="btnRemove">
			<spring:message code="action.remove" />
		</button>
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
			let formObj = $("#codeGroup");
			<!-- groupCode 값을 가져와서 modify url에 넘겨주고 수정 작업 진행 -->
			$("#btnEdit").on("click", function() {
				let groupCode = $("#groupCode");
				let groupCodeValue = groupCode.val();
				self.location = "modify?groupCode=" + groupCodeValue;
			});
			<!-- formObj 객체 정보를 활용하여 action과 mathod를 정의하고 remove url에 넘겨주고 삭제 작업 진행 -->
			$("#btnRemove").on("click", function() {
				formObj.attr("action", "/codegroup/remove");
				formObj.attr("method", "get");
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				//self.location = "/codegroup/list";아래와같은문장
				self.location = "list";
			});
		});
	</script>
</body>
</html>