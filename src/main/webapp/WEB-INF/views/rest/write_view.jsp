<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MY REST BOARD: WRITE</title>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<script type="text/javascript">
   	$(document).ready(function(){
      $("#writeForm").submit(function(event){         
           event.preventDefault();
           var bName = $("#bName").val();
           var bTitle = $("#bTitle").val();
           var bContent = $("#bContent").val();           
           
           console.log(bName);
           console.log(bTitle);
           console.log(bContent);
           console.log($(this).attr("action"));    
           
           var form = {
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
	<form id="writeForm" action="${pageContext.request.contextPath}/restful/board/write" method="post">
		<table class="table">
			<tr>
				<td>이름</td>
				<td><input type="text" id="bName" name="bName" size="50"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" id="bTitle" name="bTitle" size="50"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="20" rows="10" id="bContent" name="bContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn btn-primary" type="submit" value="입력"> &nbsp;&nbsp;
				 	<button type="button" class="btn btn-primary" onclick="location.href = '${pageContext.request.contextPath}/restful/board'">목록</button>
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