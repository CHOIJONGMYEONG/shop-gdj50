<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="<%=request.getContextPath()%>/admin/addGoodsAction.jsp"
		method="post" enctype="multipart/form-data"
	>
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="goodsName"></td>
			</tr>
			<tr>
				<td>상품가격</td>
				<td><input type="text" name="goodsPrice"></td>
			</tr>
			<tr>
				<td>이미지 파일</td>
				<td><input type="file" name="goodsImg"></td>
			</tr>
			
		</table>
		
		
		
		<button type="submit">이미지파일 업로드</button>	
	
			
		 
	</form>
	
	
	
</body>
</html>