<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave222.jsp] </title>
  <style type="text/css">
	*{ font-size: 26pt; }
	a{ font-size: 26pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
  <p>
  
 <%
   //guestWriteSave2222.jsp 단독실행하면에러발생 
   Gsabun = Integer.parseInt(request.getParameter("sabun"));
   Gname = request.getParameter("name");
   Gtitle = request.getParameter("title") ;
   Gpay = Integer.parseInt(request.getParameter("pay"));
   Gemail = request.getParameter("email");
    
    System.out.println("사번=" + Gsabun + "<br>");
    System.out.println("이름=" + Gname + "<br>");
    System.out.println("제목=" + Gtitle + "<br>");  
    System.out.println("급여=" + Gpay + "<br>");  
    System.out.println("메일=" + Gemail + "<br>");  
    
  try{
  	//guestWriteSave222.jsp문서 단독실행금지 
  	//Statement명령어
  	ST=CN.createStatement();
    msg="insert into guest values("+Gsabun+",'"+Gname+"','"+Gtitle+"',sysdate,"+Gpay+",0,'"+Gemail+"')" ;
    System.out.println(msg);
    ST.executeUpdate(msg);
    System.out.println("Statement명령어 데이터로 저장성공했습니다.") ;
  }catch(Exception ex){ System.out.println("에러 "+ex); }
   
   response.sendRedirect("guestList.jsp");
 %>	

  <p>
  <a href="guestWrite.jsp">[등록]</a>
  <a href="index.jsp">[index]</a>
  <a href="guestList.jsp">[전체출력]</a><p><br>
</body>
</html>










