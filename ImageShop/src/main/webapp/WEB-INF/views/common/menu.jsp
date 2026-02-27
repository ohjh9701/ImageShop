<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/css/common.css">

<div class="menu-container">
	<table>
		<tr>
			<td width="20%" class="menu-home"><a href="/"><spring:message
						code="header.home" /></a></td>

			<!-- 로그인을 하지 않은 경우 true -->
			<sec:authorize access="!isAuthenticated()">
				<!-- 회원 게시판를 메뉴에 추가한다. -->
				<td width="20%"><a href="/board/list"><spring:message
							code="menu.board.member" /></a></td>
				<!-- 공지사항을 메뉴에 추가한다. -->
				<td width="20%"><a href="/notice/list"><spring:message
							code="menu.notice.member" /></a></td>
							<!-- 상품리스트를 메뉴에 추가한다. -->
				<td width="20%"><a href="/item/list"><spring:message
							code="menu.item.member" /></a></td>
			</sec:authorize>

			<!-- 인증된 사용자인 경우 true -->
			<sec:authorize access="isAuthenticated()">

				<!-- 관리자 권한을 가진 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<td width="10%"><a href="/user/list"><spring:message
								code="menu.user.admin" /></a></td>
					<td width="10%"><a href="/codegroup/list"><spring:message
								code="menu.codegroup.list" /></a></td>
					<td width="10%"><a href="/codedetail/list"><spring:message
								code="menu.codedetail.list" /></a></td>
					<!-- 회원 게시판를 메뉴에 추가한다. -->
					<td width="10%"><a href="/board/list"><spring:message
								code="menu.board.member" /></a></td>
								<!-- 공지사항을 메뉴에 추가한다. -->
				<td width="10%"><a href="/notice/list"><spring:message
							code="menu.notice.member" /></a></td>
								<!-- 상품리스트를 메뉴에 추가한다. -->
				<td width="10%"><a href="/item/list"><spring:message
							code="menu.item.member" /></a></td>
				</sec:authorize>

				<!-- 회원 권한을 가진 사용자인 경우 true -->
				<sec:authorize access="hasRole('ROLE_MEMBER')">
					<!-- 회원 게시판를 메뉴에 추가한다. -->
					<td width="15%"><a href="/board/register">T1 커뮤니티 글쓰기</a></td>
					<td width="15%"><a href="/board/list">T1 커뮤니티</a></td>
					<!-- 공지사항을 메뉴에 추가한다. -->
				<td width="15%"><a href="/notice/list"><spring:message
							code="menu.notice.member" /></a></td>
							<!-- 상품리스트를 메뉴에 추가한다. -->
				<td width="15%"><a href="/item/list"><spring:message
							code="menu.item.member" /></a></td>
				</sec:authorize>
			</sec:authorize>

			<td width="20%" class="menu-auth"><sec:authorize
					access="!isAuthenticated()">
					<div class="auth-group">
						<a href="/user/register" class="register-link"> <spring:message
								code="header.joinMember" />
						</a> <a href="/auth/login" class="login-btn"> <spring:message
								code="auth.header.login" />
						</a>
					</div>
				</sec:authorize> <sec:authorize access="isAuthenticated()">
					<div class="user-info">
						<span class="user-name"> <span class="user-id"> <sec:authentication
									property="principal.username" />
						</span>님
						</span> <a href="/auth/logout" class="logout-link"> <spring:message
								code="header.logout" />
						</a>
					</div>
				</sec:authorize></td>
		</tr>
	</table>
</div>
<hr>
