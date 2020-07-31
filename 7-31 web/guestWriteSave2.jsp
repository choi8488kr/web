<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[guestWriteSave]</title>
<style type="text/css">
	*{font-size :24pt;}
	a{font-size :24pt; color:green; text-decoration: none;}
	a:hover{font-size :30pt; color:blue; text-decoration: underline;}
</style>
<script type="text/javascript">
</script>

</head>
<body>
	<p>
	
	<%
		
		Gsabun=Integer.parseInt( request.getParameter("sabun"));
		Gname=request.getParameter("name");
		Gtitle=request.getParameter("title");
		Gpay=Integer.parseInt(request.getParameter("pay"));
		Gemail=request.getParameter("email");
		
		out.println("사번="+Gsabun+"<br>");
		out.println("이름="+Gname+"<br>");
		out.println("제목="+Gtitle+"<br>");
		out.println("급여="+Gpay+"<br>");
		out.println("메일="+Gemail+"<br>");
		
		try{
			msg="insert into guest values(?,?,?,sysdate,?,0,?)";
			PST=CN.prepareStatement(msg);
				PST.setInt(1,Gsabun);
				PST.setString(2,Gname);
				PST.setString(3,Gtitle);
				PST.setInt(4,Gpay);
				PST.setString(5,Gemail);
			
			System.out.println();
			System.out.println(msg);
			out.println(msg);
			
			PST.executeUpdate();
			System.out.println(Gsabun+" 데이터로 저장성공");
			
		}catch(Exception e){ System.out.println(e); }
		//저장성공후 실패상관없이 무조건 전체출력화면으로 이동
		response.sendRedirect("guestList.jsp");
	%>

	<p>
	<a href="guestWrite.jsp">[등록]</a>
	<a href="index.jsp">[index]</a>
	<a href="guestList.jsp">[전체출력]</a>
	<P>
	<br>
</body>
</html>