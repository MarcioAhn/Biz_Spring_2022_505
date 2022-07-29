<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<div class="student detail_body">
	<div>학번 :</div>
	<div class="student detail">${STUDENTS.st_num}</div>
</div>
<div class="student detail_body">
	<div>이름 :</div>
	<div class="student detail">${STUDENTS.st_name}</div>
</div>
<div class="student detail_body">
	<div>학과 :</div>
	<div class="student detail">${STUDENTS.st_dept}</div>
</div>
<div class="student detail_body">
	<div>전화번호 :</div>
	<div class="student detail">${STUDENTS.st_tel}</div>
</div>
<div class="student detail_body">
	<div>주소 :</div>
	<div class="student detail">${STUDENTS.st_addr}</div>
</div>

<div>
	<c:forEach items="${STUDENTS.scoreList}" var="SCORE">
		<div>${SCORE.sb_name}(${SCORE.sc_sbcode}) : ${SCORE.sc_score}</div>
	</c:forEach>
</div>
<div>
	<a href="${rootPath}/student/update?st_num=${STUDENTS.st_num}">수정하기</a>
	<a href="${rootPath}/student">학생리스트로 가기</a>
</div>