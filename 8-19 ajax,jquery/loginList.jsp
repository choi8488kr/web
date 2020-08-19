<%@ page language="java" contentType="text/html; charset=UTF-8"   %>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html> <head>
<title> [loginList.jsp]</title>
   <style type="text/css">
	  *{font-size:14pt; font-weight:bold;  font-family: Comic Sans MS ; margin-left: 10px; }
	  a{font-size:14pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
	  a:hover{font-size:16pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
</head>
<body>
 <p><br>
 
<%
  //loginList.jsp
   String a = request.getParameter("userid");
   String b = request.getParameter("pwd");
  try{
   msg="select count(*) as cnt from login where userid =? and pwd =? ";
   PST=CN.prepareStatement(msg);
   		PST.setString(1, a);
   		PST.setString(2, b);
   RS=PST.executeQuery();
  }catch(Exception ex){ System.out.println(ex); }
 if(RS.next()==true){ Gtotal=RS.getInt("cnt"); }
 if( Gtotal>0){	 
	 session.setAttribute("naver", a);
	 out.println("<font color=red>"+a+"회원님의 로그인성공!!!</font>");
	 out.println("<input type='button' onclick='myload();' value='로그아웃'>");
  }else{
	out.println("<font color=red>회원님의 로그인실패</font>");
	out.println("<input type='button' onclick='myload();' value='로그인'>");  
  }%>
</body>
</html>







