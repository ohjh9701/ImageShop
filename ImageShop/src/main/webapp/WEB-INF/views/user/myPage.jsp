<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Membership : My Page</title>
<link rel="stylesheet" href="/css/myPage.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<div class="container">
		<div class="profile-header">
			<h2>${member.userName}님안녕하세요</h2>
			<p class="membership-status">T1 OFFICIAL MEMBER</p>
		</div>

		<div class="mypage-card">
			<div class="card-left">
				<div class="user-main-info">
					<h3>${member.userName}</h3>
					<span class="user-id">@${member.userId}</span>
				</div>
			</div>

			<div class="card-right">
				<div class="info-group">
					<label>가입일</label>
					<p>
						<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${member.regDate}" />
					</p>
				</div>
				<div class="info-group">
					<label>직업</label>
					<p>
						<c:set var="jobFound" value="false" />
						<c:forEach items="${jobList}" var="code">
							<c:if test="${member.job eq code.value}">
                ${code.label}
                <c:set var="jobFound" value="true" />
							</c:if>
						</c:forEach>

						<%-- 만약 일치하는 코드가 없거나 member.job이 비어있을 경우 --%>
						<c:if test="${not jobFound}">
            미설정
        </c:if>
					</p>
				</div>
				<div class="info-group">
					<label>보유 코인</label>
					<p class="coin-text">
						<fmt:formatNumber value="${member.coin}" pattern="###,###" />
						Point
					</p>
				</div>
				<div class="info-group">
					<label>계정 권한</label>
					<div class="auth-tags">
						<c:forEach items="${member.authList}" var="auth">
							<span class="auth-tag">${auth.auth}</span>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>

		<div class="mypage-actions">
			<button type="button" id="btnEdit"
				onclick="location.href='/member/modify'">회원정보 수정</button>
			<button type="button" id="btnCoinHistory"
				onclick="location.href='/coin/history'">코인 충전 내역</button>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>