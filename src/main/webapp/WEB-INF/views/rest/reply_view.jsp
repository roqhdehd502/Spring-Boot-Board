<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MY REST BOARD: REPLY</title>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
   	$(document).ready(function(){
      $("#modifyForm").submit(function(event){         
           event.preventDefault();
           var bId = $("#bId").val();
           var bGroup = $("#bGroup").val();
           var bStep = $("#bStep").val();
           var bIndent = $("#bIndent").val();
           var bName = $("#bName").val();
           var bTitle = $("#bTitle").val();
           var bContent = $("#bContent").val();           
           
           console.log(bId);
           console.log(bGroup);
           console.log(bStep);
           console.log(bIndent);
           console.log(bName);
           console.log(bTitle);
           console.log(bContent);
           console.log($(this).attr("action"));    
           
           var form = {
                 bId: bId,
                 bGroup: bGroup,
                 bStep: bStep,
                 bIndent: bIndent,
                 bName: bName,
                 bTitle: bTitle,
                 bContent: bContent
           };

           $.ajax({
             type : "PUT",
             url : $(this).attr("action"),
             cache : false,
             contentType:'application/json; charset=utf-8',
             data: JSON.stringify(form),
             success: function (result) {       
               if(result == "SUCCESS"){     
                  $(location).attr('href', '${pageContext.request.contextPath}/restful/board/')                            
               }                       
             },
             error: function (e) {
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

	<form id="modifyForm" action="${pageContext.request.contextPath}/restful/board/reply/${reply_view.bId}" method="post">
		<table class="table">
			<input type="hidden" id="bId" name="bId" value="${reply_view.bId}">
			<input type="hidden" id="bGroup" name="bGroup" value="${reply_view.bGroup}">
			<input type="hidden" id="bStep" name="bStep" value="${reply_view.bStep}">
			<input type="hidden" id="bIndent" name="bIndent" value="${reply_view.bIndent}">
			<tr>
				<td>번호</td>
				<td>${reply_view.bId}</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${reply_view.bHit}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" id="bName" name="bName" value="${reply_view.bName}"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="bTitle" name="bTitle" value="${reply_view.bTitle}"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="20" rows="10" id="bContent" name="bContent">${reply_view.bContent}</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input class="btn btn-primary" type="submit" value="답변">&nbsp;&nbsp;
					<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/restful/board'">목록</button>
				</td>
			</tr>
		</table>
	</form>

	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>