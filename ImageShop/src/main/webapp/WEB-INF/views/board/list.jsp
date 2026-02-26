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
<title>Code Group List</title>
<link rel="stylesheet" href="/css/boardList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>
			<spring:message code="board.header.list" />
		</h2>

		<div class="list-card">
			<div class="list-ctrl-bar">
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<a href="/board/register">새 글 작성</a>
				</sec:authorize>
			</div>

			<table border="1">
				<tr>
					<th align="center" width="80"><spring:message code="board.no" /></th>
					<th align="center" width="320"><spring:message
							code="board.title" /></th>
					<th align="center" width="100"><spring:message
							code="board.writer" /></th>
					<th align="center" width="180"><spring:message
							code="board.regdate" /></th>

				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4"><spring:message code="common.listEmpty" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="board">
							<tr>
								<td align="center">${board.boardNo}</td>

								<td align="left"><a
									href="/board/detail${pagination.makeQuery(pagination.pageRequest.page)}&boardNo=${board.boardNo}">${board.title}</a>
								</td>

								<td align="center">${board.writer}</td>
								<td align="center"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

			<div class="pagination-container">
				<c:if test="${pagination.prev}">
					<a
						href="/board/list${pagination.makeQuery(pagination.startPage - 1)}"
						class="nav-arrow">&laquo;</a>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<a href="/board/list${pagination.makeQuery(idx)}"
						class="${pagination.pageRequest.page eq idx ? 'active-page' : ''}">
						${idx} </a>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<a href="/board/list${pagination.makeQuery(pagination.endPage +1)}"
						class="nav-arrow">&raquo;</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- 메인화면 작업 영역 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 이벤트 처리 영역 -->
	<script>
		let result = "${msg}";
		if (result === "SUCCESS") {
			alert("<spring:message code='common.processSuccess' />");
		} else if (result === "FAIL") {
			alert("<spring:message code='common.processFail' />");
		}
	</script>
</body>
</html>