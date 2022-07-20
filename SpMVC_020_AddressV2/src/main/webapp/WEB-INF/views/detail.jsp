<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.icon {
	margin: 20px;
	font-size: 150%;
}

i {
	padding: 10px;
}

.container {
	margin: 20px auto;
}
</style>
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/464cf13c93.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="w3-card-4 w3-dark-grey" style="width: 50%">
			<div class="w3-container w3-center">
				<div class="icon">
					<i class="fa-solid fa-user-vneck" ></i>
				</div>
				<h3>${ADDR.a_name}</h3>
				<h3>${ADDR.a_tel}</h3>
				<h3>${ADDR.a_address}</h3>
				<div class="icon">
					<a href="${rootPath}/update?seq=${ADDR.a_seq}"><i
						class="fa-solid fa-pen-to-square"></i></a> <a
						href="${rootPath}/delete?seq=${ADDR.a_seq}"><i
						class="fa-solid fa-trash-can"></i></a> <a href="${rootPath}/"><i
						class="fa-solid fa-house"></i></a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>