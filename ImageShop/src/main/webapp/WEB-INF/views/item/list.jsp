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
<link rel="stylesheet" href="/css/itemList.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>
			<spring:message code="item.header.list" />
		</h2>

		<div class="list-ctrl-bar">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/item/register" class="btn-register">새 상품 등록</a>
			</sec:authorize>
		</div>

		<div class="category-section">
			<h3 class="category-title">
				T1 OFFICIAL KIT <span class="sub-title">| T1 팀 유니폼</span>
			</h3>
			<div class="item-grid">
				<c:set var="tkExists" value="false" />
				<c:forEach items="${itemList}" var="item">
					<c:if test="${item.category eq 'Team-Kit'}">
						<c:set var="tkExists" value="true" />
						<div class="item-card">
							<div class="item-img-box">
								<img src="/item/display?itemId=${item.itemId}"
									onerror="this.src='/img/no-image.png'">
							</div>
							<div class="item-info">
								<div class="item-name">${item.itemName}</div>
								<div class="item-category">${item.category}</div>
								<div class="item-price">
									<fmt:formatNumber value="${item.price}" pattern="###,###" />
									원
								</div>
							</div>
							<div class="item-actions">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="remove?itemId=${item.itemId}" class="btn-remove">삭제</a>
									<a href="modify?itemId=${item.itemId}" class="btn-edit">수정</a>
								</sec:authorize>
								<a href="detail?itemId=${item.itemId}" class="btn-read">상세보기</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${not tkExists}">
					<p class="empty-msg">등록된 Team-Kit 상품이 없습니다.</p>
				</c:if>
			</div>
		</div>

		<hr class="section-divider">

		<div class="category-section">
			<h3 class="category-title">
				T1 COLLECTION <span class="sub-title">| T1 콜라보레이션</span>
			</h3>
			<div class="item-grid">
				<c:set var="colExists" value="false" />
				<c:forEach items="${itemList}" var="item">
					<c:if test="${item.category eq 'Collaboration'}">
						<c:set var="colExists" value="true" />
						<div class="item-card">
							<div class="item-img-box">
								<img src="/item/display?itemId=${item.itemId}"
									onerror="this.src='/img/no-image.png'">
							</div>
							<div class="item-info">
								<div class="item-name">${item.itemName}</div>
								<div class="item-category">${item.category}</div>
								<div class="item-price">
									<fmt:formatNumber value="${item.price}" pattern="###,###" />
									원
								</div>
							</div>
							<div class="item-actions">
								<sec:authorize access="hasRole('ROLE_ADMIN')">
									<a href="remove?itemId=${item.itemId}" class="btn-remove">삭제</a>
									<a href="modify?itemId=${item.itemId}" class="btn-edit">수정</a>
								</sec:authorize>
								<a href="detail?itemId=${item.itemId}" class="btn-read">상세보기</a>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${not colExists}">
					<p class="empty-msg">등록된 COLLECTION 상품이 없습니다.</p>
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