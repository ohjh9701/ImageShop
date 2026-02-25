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

			<td width="20%"><a href="/user/list"><spring:message
						code="menu.user.admin" /></a></td>
			<td width="20%"><a href="/codegroup/list"><spring:message
						code="menu.codegroup.list" /></a></td>
			<td width="20%"><a href="/codedetail/list"><spring:message
						code="menu.codedetail.list" /></a></td>

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
