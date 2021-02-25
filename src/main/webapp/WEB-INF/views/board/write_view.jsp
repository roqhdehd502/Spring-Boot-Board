<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MY BOARD: WRITE</title>

	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-primary navbar-dark">
		<h1 align="center">MY BOARD</h1>
	</nav>

	<form action="write" method="post">
		<table class="table">
      
         <tr>
            <td> 이름 </td>
            <td> <input type="text" name="bName" size = "50"> </td>
         </tr>
         <tr>
            <td> 제목 </td>
            <td> <input type="text" name="bTitle" size = "50"> </td>
         </tr>
         <tr>
            <td> 내용 </td>
            <td> <textarea name="bContent" rows="10" ></textarea> </td>
         </tr>
         <tr >
            <td colspan="2"> 
            	<input class="btn btn-primary" type="submit" value="입력"> &nbsp;&nbsp; 	
            	<button type="button" class="btn btn-primary" onclick="location.href='list2'">목록</button>
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