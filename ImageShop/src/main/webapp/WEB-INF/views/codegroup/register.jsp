<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>T1 Code Group Registration</title>
<link rel="stylesheet" href="/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menu.jsp" />
	<div class="main-wrapper">
	<div class="container">
		<h2>
			<spring:message code="codegroup.header.register" />
		</h2>


		<form:form modelAttribute="codeGroup" action="/codegroup/register" method="post">
			<div class="form-group">
				<label for="groupCode"><spring:message code="codegroup.groupCode" /></label>
				<form:input path="groupCode" placeholder="그룹 코드를 입력하세요" />
				<font color="red"><form:errors path="groupCode"/></font>
			</div>

			<div class="form-group">
				<label for="groupName"><spring:message code="codegroup.groupName" /></label>
				<form:input path="groupName" placeholder="그룹 명칭을 입력하세요" />
				<font color="red"><form:errors path="groupName"/></font>
			</div>

			<div>
				<button type="submit" id="btnRegister">
					<spring:message code="action.register" />
				</button>
				<button type="button" id="btnList">
					<spring:message code="action.list" />
				</button>
			</div>

		</form:form>
	</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
		<!-- $(document).ready(function() : Html 코드가 document로 객체가 완료되었을 때 이벤트를 실행 -->
		$(document).ready(function() {
			<!-- var formObj = $("#codeGroup") : modelAttribute="codeGroup"을 찾아서 form:form 영역의 객체를 formObj안에 대입한다.  -->
			let formObj = $("#codeGroup");
			<!-- $("#btnRegister").on("click", function() : 등록 버튼을 클릭할 때 작동되는 이벤트 핸들러 정의  -->
			$("#btnRegister").on("click", function() {
				<!-- action="/register" method="get" : 서버로 객체 등록 -->
				formObj.submit();
			});
			<!-- $("#btnList").on("click", function() : 목록 버튼을 클릭할 때 작동되는 이벤트 핸들러 정의  -->
			$("#btnList").on("click", function() {
				<!-- codegroup/list url로 이동 -->
				self.location = "list";
			});
		});
	</script>

</body>
</html>