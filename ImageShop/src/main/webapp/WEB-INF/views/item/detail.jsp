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
<link rel="stylesheet" href="/css/itemDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<div class="item-detail-wrapper">
			<div class="item-image-section">
				<div class="main-image">
					<img src="display?itemId=${item.itemId}" alt="${item.itemName}">
				</div>
			</div>

			<div class="item-info-section">
				<div class="item-header">
					<span class="category-tag">T1 OFFICIAL MERCHANDISE</span>
					<h2 class="item-title">${item.itemName}</h2>
					<h4 class="item-category">${item.category}</h4>
					<div class="item-price-box">
						<span class="price-label">판매가</span> <span class="item-price">
							<fmt:formatNumber value="${item.price}" pattern="###,###" />원
						</span>
					</div>
				</div>

				<div class="item-description">
					<h4>PRODUCT INFO</h4>
					<p>${item.description}</p>
				</div>

				<form:form modelAttribute="item" action="buy" id="itemForm">
					<form:hidden path="itemId" />
					<form:hidden path="pictureUrl" />
					<form:hidden path="previewUrl" />

					<div class="action-buttons">
						<sec:authorize access="hasAnyRole('ROLE_MEMBER')">
							<button type="submit" id="btnBuy" class="btn-t1-red">
								<spring:message code="action.buy" />
							</button>
						</sec:authorize>

						<button type="button" id="btnList" class="btn-t1-outline">
							<spring:message code="action.list" />
						</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>


	<!-- 메인화면 작업 영역 끝 -->

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<!-- 이벤트 처리 영역 -->

	<script>
		$(document).ready(function() {
			var formObj = $("#item");
			// 구매하기 버튼 이벤트 처리 
			$("#btnBuy").on("click", function() {
				formObj.submit();
			});
			$("#btnList").on("click", function() {
				self.location = "list";
			});
		});
	</script>

</body>
</html>