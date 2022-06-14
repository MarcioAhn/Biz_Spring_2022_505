<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<form method="POST">
	<div>
		<input name="isbn" id="isbn" placeholder="ISBN"> 
		<input name="title" id="title" placeholder="도서명 입력후 Enter">
	</div>
	<div>
		<input name="author" placeholder="저자"> 
		<input name="publisher" placeholder="출판사"> 
		<input name="pubdate" placeholder="출판일">
		<input name="price" type="number" placeholder="가격">
	</div>
	<div>
		<input name="link" placeholder="자세히 보기"> 
		<input name="image" placeholder="이미지경로">
	</div>
		<input name="discount" placeholder="자세히 보기"> 
		<input name="description" placeholder="이미지경로">
	
	<div>
	<button type="submit">저장</button>
	<button type="reset">새로작성</button>
	<button type="button" class="list"><a href="${rootPath}/books/list">리스트보기</a></button>
	</div>
</form>