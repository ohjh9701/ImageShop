<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Modify</title>
<link rel="stylesheet" href="/css/boardRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>T1 커뮤니티</h2>
		<form:form modelAttribute="notice" action="modify" method="post">
			<form:hidden path="noticeNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="searchType" name="searchType" value="${pgrq.searchType}">
			<input type="hidden" id="keyword" name="keyword" value="${pgrq.keyword}">
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage"
				value="${pgrq.sizePerPage}">
			<table>
					<tr>
						<td><spring:message code="notice.title" /></td>
						<td><form:input path="title" /></td>
						<td><font color="red"><form:errors path="title" /></font></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">admin[관리자]</td>
					</tr>
					<tr>
						<td><spring:message code="notice.content" /></td>
						<td><form:textarea path="content" /></td>
						<td><font color="red"><form:errors path="content" /></font></td>
					</tr>
				</table>
		</form:form>

		<div>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="btnModify">
					<spring:message code="action.modify" />
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
			let formObj = $("#notice");
			$("#btnModify").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				let page = $("#page").val();
				let sizePerPage = $("#sizePerPage").val();
				let keyword = $("#keyword").val();
				let searchType = $("#searchType").val();
				self.location = "list?page=" + page + "&sizePerPage=" + sizePerPage + "&searchType=" + searchType + "&keyword=" + keyword;
			});
		});
	</script>
</body>
</html>