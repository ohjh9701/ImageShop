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
<title>T1 Notice List</title>
<link rel="stylesheet" href="/css/boardList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>
			<spring:message code="notice.header.list" />
		</h2>

		<!-- 검색 폼을 만든다. -->
		<div class="list_top_menu">
		<form:form modelAttribute="pgrq" method="get"
			action="list${pgrq.toUriStringByPage(pgrq.page)}">
			<div class="search-bar">
			<form:select path="searchType" items="${searchTypeCodeValueList}"
				itemValue="value" itemLabel="label" />
			<form:input path="keyword" />
			<button id='searchBtn'>
				<spring:message code="action.search" />
			</button>
			</div>
			<div class="list-ctrl-bar">
				<a href="/notice/list${pgrq.toUriStringByPage(pgrq.page)}" class="list_back">리스트 돌아가기</a>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<a href="/notice/register">새 글 작성</a>
				</sec:authorize>
			</div>
		</form:form>
		</div>

		<div class="list-card">

			<table border="1">
				<tr>
					<th align="center" width="15%"><spring:message code="notice.no" /></th>
					<th align="center" width="50%"><spring:message
							code="notice.title" /></th>
					<th align="center" width="35%"><spring:message
							code="board.regdate" /></th>

				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="3"><spring:message code="common.listEmpty" /></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="notice">
							<tr>
								<td align="center">${notice.noticeNo}</td>

								<td align="left"><a
									href="/notice/detail${pgrq.toUriString(pgrq.page)}&noticeNo=${notice.noticeNo}">
									<c:out value="${notice.title}" /></a></td>

								<td align="center"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${notice.regDate}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

			<div class="pagination-container">
				<c:if test="${pagination.prev}">
					<a
						href="/notice/list${pagination.makeQuery(pagination.startPage - 1)}"
						class="nav-arrow">&laquo;</a>
				</c:if>

				<c:forEach begin="${pagination.startPage}"
					end="${pagination.endPage}" var="idx">
					<a href="/notice/list${pagination.makeQuery(idx)}"
						class="${pagination.pageRequest.page eq idx ? 'active-page' : ''}">
						${idx} </a>
				</c:forEach>

				<c:if test="${pagination.next && pagination.endPage > 0}">
					<a href="/notice/list${pagination.makeQuery(pagination.endPage +1)}"
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