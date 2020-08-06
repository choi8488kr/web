<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> BBB.jsp </title>
   <style type="text/css">
     *{ font-size: 20pt; font-weight: bold; }
     a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
     a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
   </style>

   <script type="text/javascript">
      
   </script>
</head>
<body>
<%

 String path = application.getRealPath("storage");

 int size=1024*1024*7;
 DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy();
 //MultipartRequest mr = new MultipartRequest(request,2 경로 ,3 크기,4 인코딩,5 문서덮어씌우기 생략가능); 
 MultipartRequest mr = new MultipartRequest(request,path ,size,"UTF-8",drp);
 
//  String a=request.getParameter("num");
//  String b=request.getParameter("title");
//  String c=request.getParameter("file1"); //
 //String c=mr.getParameter("file1"); //파일이름만 넘어와요
 String a =mr.getParameter("num");
 String b =mr.getParameter("title");
 //String c =mr.getParameter("file1");//스토리지에 저장만함
 String c =mr.getFilesystemName("file1");
 
  out.println("넘어온번호 = " + a  + "<br>");
  out.println("넘어온제목 = " + b  + "<br>");
  out.println("넘어온파일 = " + c  + "<p>");
  
  File ff = mr.getFile("file1");
  long fsize = ff.length();
  out.println(c+"파일크기는 "+fsize+"Byte <br>");
  
%>   
	<br>
	<a href="BBBdownload.jsp?fname=<%=c%>"><img src="<%=request.getContextPath() %>/storage/<%=c %>" width="300" height="120"></a>
	<a href="BBBdownload.jsp?fname=<%=c%>"><img src="./storage/<%=c %>" width="300" height="120"></a>
  <br>
   <a href="AAA.jsp">[AAA.jsp]</a>
   <a href="index.jsp">[index.jsp]</a>
   <a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>




