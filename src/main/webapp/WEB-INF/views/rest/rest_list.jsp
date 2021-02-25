<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MY REST BOARD: LIST</title>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function (){
		$('.a-delete').click(function(event){
			// 이벤트를 취소할 때 동작을 멈춘다.
			event.preventDefault();
			console.log("ajax 호출전");
			
			// <a>의 parent(<td>)의 parent 즉, <tr>를 지칭한다.(클로저)
			/*
				어떻게 제이쿼리는 this가 <a>인 것을 알고있을까?
				: a 태그내 .a-delete 클릭 이벤트가 발생 되었으므로!
				: $('.a-delete').click(function(event)
			*/
			var trObj = $(this).parent().parent(); 
 
			$.ajax({
				// AJAX의 타입(삭제)
				type : 'DELETE',
				
				// <a>의(this) 속성(href)을 가져온다.(attr)
				url : $(this).attr("href"),
				
				// 캐시를 false 설정하여 페이지가 새로 고쳐질때
				// 데이터를 남기지 않는다(?)
				cache : false,
				
				success: function(result){
					console.log(result);
					if(result=="SUCCESS"){
						// trObj 변수를 삭제한다.(게시글 삭제)
						$(trObj).remove();
						console.log("REMOVED!")
					}
				},
				error:function(e){
					console.log(e);
				}
			})
		});	
	});	
</script>
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<h1 align="center">MY BOARD</h1>
	</nav>

	<table class="table table-hover">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>삭제</th>
		</tr>
			
		<c:forEach items="${list}" var="dto">
        	<tr>
            	<td>${dto.bId}</td>
				<td>${dto.bName}</td>
				<td>
					<c:forEach begin="1" end="${dto.bIndent}">[Re]</c:forEach>
					<a href="${pageContext.request.contextPath}/restful/board/${dto.bId}">${dto.bTitle}</a></td>
				<td>${dto.bDate}</td>
				<td>${dto.bHit}</td>
				<td><a class="a-delete" href="${pageContext.request.contextPath}/restful/board/${dto.bId}">삭제</a></td>		
       	   </tr>
       </c:forEach>  	   
	</table>
	
	<div align="center">
		<ul class="pagination justify-content-center">
			<c:if test="${pageMaker.prev}">
				<li class="page-item">
					<a href="list2${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a>
				</li>
			</c:if>
		
			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<c:out value="${pageMaker.cri.pageNum == idx?'':''}" />
				<li class="page-item">
					<a href="list2${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>
				
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item">
				 	<a href="list2${pageMaker.makeQuery(pageMaker.endPage +1)}">다음</a>
				</li>
			</c:if><br>
		</ul>
	</div>
	
	<div align="center">
		<button type="button" class="btn btn-primary btn-block" onclick="location.href = '${pageContext.request.contextPath}/restful/board/write'">글쓰기</button>
	</div>
	
	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>