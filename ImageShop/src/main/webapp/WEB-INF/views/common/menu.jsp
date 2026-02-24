<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link rel="stylesheet" href="/css/common.css">

<div class="menu-container" align="center">
    <table>
        <tr>
        	<!-- 회원가입메뉴 -->
            <td width="25%"><a href="/user/register"><spring:message code="header.joinMember" /></a></td>
			<!-- 회원 관리를 메뉴에 추가한다. -->
			<td width="25%"><a href="/user/list"><spring:message code="menu.user.admin" /></a></td>
        	<!-- 코드그룹관리메뉴 -->
            <td width="25%"><a href="/codegroup/list"><spring:message code="menu.codegroup.list" /></a></td>
        	<!-- 코드관리메뉴 -->
			<td width="25%"><a href="/codedetail/list"><spring:message code="menu.codedetail.list" /></a></td>
        </tr>
    </table>
</div>
<hr>
