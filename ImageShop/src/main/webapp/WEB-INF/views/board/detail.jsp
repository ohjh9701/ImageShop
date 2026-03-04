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
<link rel="stylesheet" href="/css/boardDetail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />

	<!-- 메인화면 작업 영역 시작 -->
	<div class="container">
		<h2>T1 커뮤니티</h2>
		<form:form modelAttribute="board">
			<form:hidden path="boardNo" />
			<!-- 현재 페이지 번호와 페이징 크기를 숨겨진 필드 요소를 사용하여 전달한다. -->
			<input type="hidden" id="searchType" name="searchType"
				value="${pgrq.searchType}">
			<input type="hidden" id="keyword" name="keyword"
				value="${pgrq.keyword}">
			<input type="hidden" id="page" name="page" value="${pgrq.page}">
			<input type="hidden" id="sizePerPage" name="sizePerPage"
				value="${pgrq.sizePerPage}">
			<table>
				<tr>
					<td><spring:message code="board.title" /></td>
					<td><form:input path="title" readonly="true" /></td>
					<td align="right" class="reg-date">작성일 : <fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${board.regDate}" />
					</td>
					<td><font color="red"><form:errors path="title" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.writer" /></td>
					<td colspan="2"><form:input path="writer" readonly="true" /></td>
					<td><font color="red"><form:errors path="writer" /></font></td>
				</tr>
				<tr>
					<td><spring:message code="board.content" /></td>
					<td colspan="2"><form:textarea path="content" readonly="true" /></td>
					<td><font color="red"><form:errors path="content" /></font></td>
				</tr>
			</table>
		</form:form>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication property="principal" var="pinfo" />
		</sec:authorize>
		<h2>Coment</h2>
		<div class="reply_view">
			<table>
				<c:choose>
					<c:when test="${empty replyList}">
						<tr>
							<td colspan="4" class="empty-msg">여러분의 소중한 댓글을 남겨주세요.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${replyList}" var="reply">
							<tr>
								<td align="center" style="width: 130px;">${reply.member.userId}</td>

								<td align="left" class="reply-content-area">
									<div id="reply-text-${reply.replyNo}">${reply.content}</div>

									<form action="/reply/modify" method="post"
										id="reply-edit-form-${reply.replyNo}"
										style="display: none; margin: 0;">
										<input type="hidden" name="replyNo" value="${reply.replyNo}">
										<input type="hidden" name="boardNo" value="${board.boardNo}">
										<textarea name="content" class="inline-edit-textarea">${reply.content}</textarea>
										<div class="inline-edit-btns">
											<button type="submit" class="btn-reply-save">저장</button>
											<button type="button" class="btn-reply-cancel"
												onclick="cancelEdit(${reply.replyNo})">취소</button>
										</div>
									</form>
								</td>

								<td align="center" style="width: 140px;"><fmt:formatDate
										pattern="yyyy-MM-dd HH:mm" value="${reply.regDate}" /></td>

								<td class="reply-action-btns" style="width: 150px;"><sec:authorize
										access="isAuthenticated()">
										<c:if test="${pinfo.username eq reply.member.userId}">
											<div id="action-btns-${reply.replyNo}">
												<button type="button" class="btn-reply-modify"
													onclick="showEditForm(${reply.replyNo})">수정</button>

												<form action="/reply/delete" method="post"
													style="display: inline-block; margin: 0;">
													<input type="hidden" name="replyNo"
														value="${reply.replyNo}"> <input type="hidden"
														name="boardNo" value="${board.boardNo}">
													<button type="submit" class="btn-reply-delete"
														onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
												</form>
											</div>
										</c:if>
									</sec:authorize></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</div>

		<sec:authorize access="hasAnyRole('ROLE_MEMBER', 'ROLE_ADMIN')">
			<div class="reply_register">
				<form action="/reply/replyRegister" method="get">
					<input type="hidden" name="username" value="${pinfo.username}" />
					<input type="hidden" name="boardNo" value="${board.boardNo}" /> <label
						for="reply_content">댓글작성</label>
					<textarea id="reply_content" name="content"></textarea>
					<button type="submit">댓글작성</button>
				</form>
			</div>
		</sec:authorize>

		<div>
			<!-- 로그인(인가)된 정보를 pinfo 변수에 저장 -->
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<button type="submit" id="btnEdit">
					<spring:message code="action.edit" />
				</button>
				<button type="submit" id="btnRemove">
					<spring:message code="action.remove" />
				</button>
			</sec:authorize>

			<sec:authorize access="hasRole('ROLE_MEMBER')">
				<!-- 인가된 정보의 ID가 게시글 작성자와 동일한지 체크 - 동일하면 수정/삭제 버튼 출력 -->
				<c:if test="${pinfo.username eq board.writer}">
					<button type="submit" id="btnEdit">
						<spring:message code="action.edit" />
					</button>
					<button type="submit" id="btnRemove">
						<spring:message code="action.remove" />
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
		$(document).ready(
				function() {
					let formObj = $("#board");
					$("#btnEdit").on(
							"click",
							function() {
								let boardNo = $("#boardNo").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								let keyword = $("#keyword").val();
								let searchType = $("#searchType").val();
								self.location = "modify?page=" + page
										+ "&sizePerPage=" + sizePerPage
										+ "&searchType=" + searchType
										+ "&keyword=" + keyword + "&boardNo="
										+ boardNo;
							});
					$("#btnRemove").on(
							"click",
							function() {
								let boardNo = $("#boardNo").val();
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								let keyword = $("#keyword").val();
								let searchType = $("#searchType").val();
								self.location = "remove?page=" + page
										+ "&sizePerPage=" + sizePerPage
										+ "&searchType=" + searchType
										+ "&keyword=" + keyword + "&boardNo="
										+ boardNo;
							});
					$("#btnList").on(
							"click",
							function() {
								let page = $("#page").val();
								let sizePerPage = $("#sizePerPage").val();
								let keyword = $("#keyword").val();
								let searchType = $("#searchType").val();
								self.location = "list?page=" + page
										+ "&sizePerPage=" + sizePerPage
										+ "&searchType=" + searchType
										+ "&keyword=" + keyword;
							});
				});
		
		function showEditForm(replyNo) {
		    $('.inline-edit-textarea').parent().hide();
		    $('span[id^="reply-text-"]').show();
		    $('.reply-action-btns').show();

		    $('#reply-text-' + replyNo).hide();
		    $('#action-btns-' + replyNo).hide();

		    $('#reply-edit-form-' + replyNo).fadeIn(200);
		}

		function cancelEdit(replyNo) {
		    $('#reply-edit-form-' + replyNo).hide();
		    
		    $('#reply-text-' + replyNo).show();
		    $('#action-btns-' + replyNo).show();
		}
	</script>


</body>
</html>