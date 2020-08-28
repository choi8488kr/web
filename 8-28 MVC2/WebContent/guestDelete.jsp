
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestWriteSave.jsp]</title>
<style type="text/css">
* {
	font-size: 26pt;
}

a {
	font-size: 26pt;
	color: green;
	text-decoration: none;
}

a:hover {
	font-size: 30pt;
	color: blue;
	text-decoration: underline;
}
</style>

<script type="text/javascript">
	</script>
</head>
<body>
	<p>
<script type="text/javascript">


</script>


		<%
		String temp = (String)session.getAttribute("naver");
		if(temp==null || temp==""){
		%>
			<script>
				alert("삭제권한이 없슴니다 로그인후 이용하세요");
				location.href="login.jsp";
			</script>
			
		<%	
		}else{

			String Gdata = request.getParameter("idx");
			
		%>
			<script>
				alert("데이터 삭제 성공");
				location.href="guestList.jsp";
			</script>
		<% } %>
		
		<div align="center">
		<img src="images/a1.png"> <br>
	</div>
	<script type="text/javascript">
		alert("<%=Gdata%>" + "사번데이터는 삭제되었습니다.");
		location.href = "glist.do";
	</script>
	
		<%
			
		
			//에러있든없든 무조건 guestList.jsp문서로 이동
			//response.sendRedirect("guestList.jsp");
		%>
	
	
	<p>
  <a href="guestWrite.jsp">[등록]</a>
  <a href="index.jsp">[index]</a>
  <a href="guestList.jsp">[전체출력]</a>
	<p>
		<br>

</body>
</html>










