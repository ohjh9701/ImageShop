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
<link rel="stylesheet" href="/css/userList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<div class="header-coin">

			<h2>
				<spring:message code="coin.header.listPay" />
			</h2>
			<a href="/user/myPage" class="btn-register">마이페이지</a>

			<table border="1">
				<tr>
					<th align="center" width="80"><spring:message code="coin.no" /></th>
					<th align="center" width="120"><spring:message
							code="coin.itemName" /></th>
					<th align="center" width="120"><spring:message
							code="coin.payAmount" /></th>
					<th align="center" width="180"><spring:message
							code="coin.regdate" /></th>
				</tr>
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="4"><spring:message code="common.listEmpty" />
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list}" var="payCoin">
							<tr>
								<td align="center">${payCoin.historyNo}</td>
								<td align="left">${payCoin.itemName}</td>
								<td align="left">${payCoin.amount}</td>
								<td align="center"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${payCoin.regDate}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>

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