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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html {
	width: 100vw;
	height: 100vh;
}

body {
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
}

form {
	width: 50%;
	text-align: center;
}

input {
	padding: 1rem;
	width: 400px;
	margin: 20px;
}


.number {
	width: 100px;
}

button {
	padding: 10px;
}
</style>
</head>
<body>
	<form method="POST" enctype="multipart/form-data">
		<input name="m_seq" type="hidden"
			value='<c:out value="${MEMO.m_seq}" default="0"/>'> <input
			name="m_title" placeholder="도서명을 입력하세요" value="${MEMO.m_title}">
		<div class="sub-content">
			<textarea rows="10" cols="45" class="memo_content" name="m_memo"
				placeholder="서평을 입력해 주세요">${MEMO.m_memo}</textarea>
		</div>
		<div>
			읽은 페이지 : <input class="number" type="number" name="m_page"
				value="${MEMO.m_page}">
		</div>
		<input name="file" type="file" accept="images/*">
		<button>도서기록</button>
	</form>
</body>
</html>