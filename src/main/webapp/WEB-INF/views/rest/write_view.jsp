<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MY REST BOARD: WRITE</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
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
	<div class="jumbotron jumbotron-fluid">
  		<h1 align="center">MY BOARD</h1>
	</div>
	
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<h1 align="center">WRITE</h1>
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

	<div align="center" class="jumbotron jumbotron-fluid">
  		<p>Copyrights&copy;All rights reserved by bootstrap.
	</div>	

</body>
</html>