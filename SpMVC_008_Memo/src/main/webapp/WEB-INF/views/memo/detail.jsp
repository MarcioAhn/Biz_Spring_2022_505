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
<style>
img {
	width: 200px;
}
</style>
</head>
<body>
<section class="w3-container">
		<div class="w3-container detail-flex">
			<div>
				<img src="${rootPath}/upload/${MEMO.m_image}">
			</div>
			<div class="detail">
				<p>작성자 : ${MEMO.m_author}
				<p>작성일자 : ${MEMO.m_date}
				<p>작성시각 : ${MEMO.m_time}
				<p>메모내용 : ${MEMO.m_memo}
			</div>
		</div>
		<div class="btn-box">
			<a href="${rootPath}/memo/list" class="list">리스트</a> <a
				href="${rootPath}/memo/${MEMO.m_seq}/update" class="update">수정</a>
			
			<a href="javascript:void(0)" class="delete">삭제</a>
		</div>
	</section>
</body>
<script>
		document.querySelector("a.delete")?.addEventListener("click",()=>{
			if(confirm("정말 삭제할까요?")) {
				document.location.replace("${rootPath}/memo/${MEMO.m_seq}/delete")
			}
		})
	
	</script>

</html>