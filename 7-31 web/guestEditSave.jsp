<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWriteSave.jsp] </title>
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
   //guestWriteSave.jsp 단독실행하면에러발생 
   Gsabun = Integer.parseInt(request.getParameter("sabun"));
   Gname = request.getParameter("name");
   Gtitle = request.getParameter("title") ;
   Gpay = Integer.parseInt(request.getParameter("pay"));
   Gemail = request.getParameter("email");
    
    System.out.println("넘어온사번=" + Gsabun );
    System.out.println("넘어온이름=" + Gname );
    System.out.println("넘어온제목=" + Gtitle );  
    System.out.println("넘어온급여=" + Gpay );  
    System.out.println("넘어온메일=" + Gemail );  
    
try{
  	//guestWriteSave.jsp문서단독실행금지 에러발생 
  	//입력insert작업전에 먼저 sabun중복



  	//response.sendRedirect("guestWrite.jsp");
  	%>
  	<div align="center">
  	<img src="images/a1.png"> <br>
  	</div>
 
  	
  	<%
  	
  
	  	//PreparedStatement명령어 수정해서 저장처리
	    msg = "update guest set name=?, title=?, wdate=sysdate, pay=?, email=? where sabun="+Gsabun ;
	  	PST = CN.prepareStatement(msg);
	  		
	  		PST.setString(1, Gname);
	  		PST.setString(2, Gtitle);
	  		PST.setInt(3, Gpay);
	  		PST.setString(4, Gemail);
	  	PST.executeUpdate(); //PST.executeUpdate(X)
	    System.out.println("PreparedStatement명령어 데이터로 저장성공했습니다.") ;
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










