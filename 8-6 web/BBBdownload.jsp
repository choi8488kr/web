<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>

<%@ page import="java.util.Date" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> BBBdownload.jsp </title>
	<style type="text/css">
	  *{ font-size: 20pt; font-weight: bold; }
	  a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	</style>

	</head>
<body>
	BBBdownload.jsp단독실행금지 <br>	
<%
 //request.setCharacterEncoding("UTF-8");

 String path = application.getRealPath("storage");
 String data = request.getParameter("fname");
 System.out.println("BBBdownload.jsp문서로 넘어온파일명 = " + data ); 
 File file = new File( path, data) ; //파일화

 //************response내장개체 헤더정의=>팝업창처럼실행
 //정석 response.setHeader("Content-Disposition","attachment;filename="+ URLEncoder.encode(data, "UTF-8") ); //다운로드정보표시하는 팝업창역할
 response.setHeader("Content-Disposition","attachment;filename="+data); //다운로드정보표시하는 팝업창역할 // 원본
 //축소 response.setHeader("C-D","attach~;fn="+data); //다운로드정보표시하는 팝업창역할 
 try{
   Date dt = new Date( );
   Calendar cc = new GregorianCalendar( );
   //추상메소드가 있으면 추상클래스/인터페이스 
   InputStream is = new FileInputStream(file) ;
   OutputStream os = response.getOutputStream();
   
   //표준데이터타입=primitiveType  byte,int,double,boolean,char,long
   byte[] bt = new byte[(int)file.length()] ; //byte타입은 1바이트타입
   is.read(bt,0,bt.length);
   os.write(bt); 
   
   is.close();
   os.close();
}catch(Exception e){ }
%>	

</body>
</html>









