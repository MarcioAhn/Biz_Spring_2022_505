<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
</head>
<body>
	<form method="POST">
		<input name="st_num" type="hidden"
			value='<c:out value="${STUDENTS.st_num}" default="0"/>' /> 
			<input
			name="st_name" placeholder="이름" value="${STUDENTS.st_name}" />
			<input
			name="st_dept" placeholder="학과" value="${STUDENTS.st_dept}" /> 
			<input
			name="st_tel" placeholder="전화번호" value="${STUDENTS.st_tel}" /> 
			<input
			name="st_address" placeholder="주소" value="${STUDENTS.st_address}" />
		<button>저장</button>
	</form>
</body>
</html>