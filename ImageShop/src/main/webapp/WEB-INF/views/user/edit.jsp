<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Membership : Edit Profile</title>
<link rel="stylesheet" href="/css/memberEdit.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/menu.jsp" />

    <div class="container">
        <div class="edit-header">
            <h2>EDIT PROFILE</h2>
            <p>회원님의 소중한 정보를 안전하게 관리하세요.</p>
        </div>

        <form:form modelAttribute="member" action="/user/edit" method="post" id="editForm">
            <form:hidden path="userNo" />
            
            <div class="edit-card">
                <div class="form-group">
                    <label>ID</label>
                    <form:input path="userId" readonly="true" class="input-readonly" />
                    <small>아이디는 변경할 수 없습니다.</small>
                </div>

                <div class="form-group">
                    <label>NAME</label>
                    <form:input path="userName" placeholder="이름을 입력하세요" />
                    <form:errors path="userName" cssClass="error-msg" />
                </div>

                <div class="form-group">
                    <label>NEW PASSWORD</label>
                    <form:password path="userPw" placeholder="새 비밀번호를 입력하세요" />
                    <form:errors path="userPw" cssClass="error-msg" />
                </div>

                <div class="form-group">
                    <label>JOB</label>
                    <form:select path="job" class="select-job">
                        <form:option value="" label="직업을 선택하세요" />
                        <form:options items="${jobList}" itemValue="value" itemLabel="label" />
                    </form:select>
                </div>

                <div class="form-group">
                    <label>MEMBERSHIP STATUS</label>
                    <div class="status-badge">${member.enabled == "1" ? 'ACTIVE' : 'INACTIVE'}</div>
                </div>
            </div>

            <div class="edit-actions">
                <button type="submit" id="btnSubmit">저장하기</button>
                <button type="button" id="btnCancel" onclick="history.back()">취소</button>
            </div>
        </form:form>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>