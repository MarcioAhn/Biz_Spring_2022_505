<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="rootPath" />    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<script src="https://kit.fontawesome.com/464cf13c93.js" crossorigin="anonymous"></script>
<style>

	div.food_body {
		width: 60%;
		margin:10px auto;
		padding:2rem;
	}
	

	div.complete {
		text-decoration: red line-through;
		color: #aaa;
	}
	div.icon {
	display: inline-block;
	margin-left: auto;
	font-size: 150%;
}

</style>
<script>
document.addEventListener("DOMContentLoaded",()=>{
    const div_body = document.querySelector("div.food_body")
    
    div_body?.addEventListener("click",(e)=>{
        const target = e.target
        console.log(target)
        if(target.tagName === "I" 
        		&& target.classList?.contains("fa-pen-to-square")) {
        	
        	const seq = target?.dataset.seq
        	if(target?.classList.contains("complete")) {
        		alert("완료된 항목은 수정할 수 없음")
        		return false
        	}
        	document.location.href = "${rootPath}/food/update?t_seq=" + seq
        			
        } else if (target.tagName == "SPAN" 
        		&& target.classList?.contains("food_content")) {
        	const parentDiv = target.closest("DIV")
        	console.log(parentDiv)
        	const seq = parentDiv?.dataset.seq
        	document.location.href = "${rootPath}/food/comp?t_seq=" + seq 
        }
    })
})


</script>


<div class="food_body w3-card-4">
	<sec:authorize access="isAuthenticated()">
		<h1 class="w3-text-gray">[ <sec:authentication property="principal.username" /> ] 님의 FOOD LIST</h1>
		<c:forEach items="${FOODS}" var="FOOD">
			<div 
				data-seq="${FOOD.t_seq}"
				title="시작 : ${FOOD.t_sdate}" 
				class="food_content w3-border w3-padding-16 w3-margin 
				<c:if test='${not empty FOOD.t_edate}'> complete </c:if>
				">
				< 섭취음식 : ${FOOD.t_content} >
				<span class="food_content w3-text">
				( 기록날짜 : ${FOOD.t_sdate } )
				</span>
				
				
				<c:if test="${not empty FOOD.t_edate}">
					<span class="food_content">섭취완료</span>
					<span class="food_content">${FOOD.t_edate}</span>
					<span class="food_content">${FOOD.t_etime}</span>
				</c:if>

				<c:if test="${FOOD.t_complete}">
					<span class="food_content">섭취완료</span>
					<span class="food_content">${FOOD.t_edate}</span>
					<span class="food_content">${FOOD.t_etime}</span>
				</c:if>
				
				<div class="icon">
						<i data-seq="${FOOD.t_seq}" class="fa-solid fa-pen-to-square"></i>
						<a href="${rootPath}/food/${FOOD.t_seq}/delete"><i
							class="fa-solid fa-trash-can"></i></a>
				</div>
			</div>
		</c:forEach>
		<form:form>
			<input name="t_content"
					value="${FOOD.t_content}" 
					placeholder="FOOD Insert" 
					class="w3-input w3-border"/>
		</form:form>
	</sec:authorize>
</div>

