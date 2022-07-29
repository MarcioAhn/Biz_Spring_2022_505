<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<style>
	form.student.input {
		width: 80%;
		margin: 20px auto;
	}
	form.student.input div {
		display: flex;
	}
	form.student.input input,
	form.student.input button {
		flex: 1;
		padding: 16px 12px;
		margin: 5px;
	}
</style>
<form method="POST" class="student input">
	<div><input name="st_name" value="${STUDENTS.st_name}"/></div>
	<div><input name="st_dept" value="${STUDENTS.st_dept}"/></div>
	<div><input name="st_tel" value="${STUDENTS.st_tel}"/></div>
	<div><input name="st_addr" value="${STUDENTS.st_addr}"/></div>
	<div><button>저장</button></div>
</form>

