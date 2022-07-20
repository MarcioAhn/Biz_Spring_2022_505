<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
  
<!DOCTYPE html>
<html>
<script>
	const rootPath = '${rootPath}'
</script>
<script src="${rootPath}/resources/js/address.js?ver=2022-07-20-005" /></script>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
html {
	width: 100vw;
	height: 30vh;
}
body {
	width: 100%;
	display: flex;
	flex-direction: column;
}
header {
	height: 100%;
	background-color: #497dd6;
	color: white;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: cetner;
	align-items: center;
	
}
header h1 {
font-weight: 900;
text-shadow: 1px 1px 1px black;
}
nav ul {
	display: flex;
	list-style: none;
	background-color: #6284bf;
	color: white;
}
nav li {
	padding: 12px 16px;
	margin: 1.5rem;
}
nav a {
	color:inherit;
	text-decoration: none;
}
	
</style>	
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
</body>
</html>