<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave22222.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
<jsp:useBean id="dao" class="net.tis.sql.GuestSQL"></jsp:useBean>
<jsp:useBean id="dto" class="net.tis.sql.GuestDTO"></jsp:useBean>
  <p>
  
 <%
   //guestWriteSave.jsp 단독실행하면에러발생 
   int Gsabun = Integer.parseInt(request.getParameter("sabun"));
   String Gname = request.getParameter("name");
   String Gtitle = request.getParameter("title") ;
   int Gpay = Integer.parseInt(request.getParameter("pay"));
   String Gemail = request.getParameter("email");

    
try{
  	//guestWriteSave.jsp문서단독실행금지 에러발생 
  	//입력insert작업전에 먼저 sabun중복
  
  	%>
  	<jsp:setProperty property="*" name="dto"/>
  	
  	<%
  	
  	dao.dbInsert(dto);

	    response.sendRedirect("guestList.jsp");
	    
  
}catch(Exception ex){ System.out.println("에러 "+ex); }
  
   //에러있든없든 무조건 guestList.jsp문서로 이동
   //response.sendRedirect("guestList.jsp");
 %>	

  <p>
  <a href="guestWrite.jsp">[등록]</a>
  <a href="index.jsp">[index]</a>
  <a href="guestList.jsp">[전체출력]</a><p><br>
</body>
</html>










