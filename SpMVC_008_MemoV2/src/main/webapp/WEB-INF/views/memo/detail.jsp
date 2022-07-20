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
<script src="https://kit.fontawesome.com/464cf13c93.js"
	crossorigin="anonymous"></script>
<style>
body {
	justify-content: center;
	align-items: center;
	position: relative;
}

.all {
	width: 50%;
	margin: 20px auto;
}

.container {
	display: flex;
	flex-direction: row;
}

img {
	margin: 0;
	padding: 0;
	float: left;
	width: 300px;
	height: 30vh;
	box-shadow: inset 0px 0px 12px 3px rgb(0 0 0/ 5%);
}

.right {
	float: right;
	margin: 50px;
}

.icon {
	margin: 10px;
	font-size: 200%;
}
</style>
</head>
<body>
	<form>
		<div class="all">
			<div class="container">
				<img src="${rootPath}/upload/${MEMO.m_up_image}"
					alt="${MEMO.m_image}" width="100px">

				<div class="right">
					<h2>도서명 : ${MEMO.m_title}</h2>
					<div>작성자 : ${MEMO.m_author}</div>
					<div>작성일자 : ${MEMO.m_date}</div>
					<div>작성시각 : ${MEMO.m_time}</div>
					<div>책갈피 : ${MEMO.m_page}page</div>
					<div>서평 : ${MEMO.m_memo}</div>

					<div class="icon">
						<a href="${rootPath}/memo/${MEMO.m_seq}/update"><i
							class="fa-solid fa-pen-to-square"></i></a> <a
							href="${rootPath}/memo/${MEMO.m_seq}/delete"><i
							class="fa-solid fa-trash-can"></i></a> <a href="${rootPath}/"><i
							class="fa-solid fa-house"></i></a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>