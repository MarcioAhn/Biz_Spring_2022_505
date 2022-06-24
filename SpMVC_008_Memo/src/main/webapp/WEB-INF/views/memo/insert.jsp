<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Insert title here</title>
</head>
<body>
<form method="POST" class="w3-container" enctype="multipart/form-data">
	<h1>메모 추가</h1>
	<div>
		<input name="m_author" class="w3-input" placeholder="개발자Email"  value="${MEMO.m_author}" > 
		<input name="m_date" type="date" class="w3-input" placeholder="작성일자"  value="${MEMO.m_date}" hidden="hidden">  
		<input name="m_time" type="time" class="w3-input" placeholder="작성시각"  value="${MEMO.m_time}" hidden="hidden">
	</div>
	<textarea placeholder="메모내용" rows="10" cols="20" class="w3-input" name="m_memo">${MEMO.m_memo}</textarea>
		<input type="file" accept="image/*" name="mimage"/>
	<button class="w3-button w3-indigo memo-save">저장</button>
</form>
</body>
</html>