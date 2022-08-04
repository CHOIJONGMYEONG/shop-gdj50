<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
		<form action="<%=request.getContextPath()%>/customerDeleteAction.jsp" method="post">
			비밀번호: <input type="password" name="customerPass">
			<button type="submit">삭제</button>
		</form>


	</div>



</body>
</html>