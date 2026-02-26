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
<title>Board Modify</title>
<link rel="stylesheet" href="/css/boardRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>T1 커뮤니티</h2>
		<form:form modelAttribute="board" method="post">
			<form:hidden path="boardNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage"
				value="${pgrq.sizePerPage}">
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
			<!-- 로그인(인가)된 정보를 pinfo 변수에 저장 -->
			<sec:authentication property="principal" var="pinfo" />
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="btnModify">
					<spring:message code="action.modify" />
				</button>
			</sec:authorize>

			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<!-- 인가된 정보의 ID가 게시글 작성자와 동일한지 체크 - 동일하면 수정/삭제 버튼 출력 -->
				<c:if test="${pinfo.username eq board.writer}">
					<button type="submit" id="btnModify">
						<spring:message code="action.modify" />
					</button>
				</c:if>
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
			let formObj = $("#board");
			$("#btnModify").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				let page = $("#page").val();
				let sizePerPage = $("#sizePerPage").val();
				self.location = "list?page=" + page + "&sizePerPage=" + sizePerPage;
			});
		});
	</script>
</body>
</html>