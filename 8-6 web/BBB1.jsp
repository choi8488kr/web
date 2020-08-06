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
 //ServletContext sc = config.getServletContext();
 //String path= sc.getRealPath("storage");
 String path = application.getRealPath("storage");
 System.out.println(path);
 
 int size= 1024*1024*7; 
 DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
 //new MultipartRequest(1request,2경로,3크기,4인코딩,5생략파일중복여부) ;
 //MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8",dfr) ;
 MultipartRequest mr = new MultipartRequest(request,path,size,"UTF-8") ;
 
 String a=mr.getParameter("num");
 String b=mr.getParameter("title");
 //String c=mr.getParameter("file1"); //파일이름만 넘어와요
 String c= mr.getFilesystemName("file1"); //
  out.println("mr넘어온번호 = " + a  + "<br>");
  out.println("mr넘어온제목 = " + b  + "<br>");
  out.println("mr넘어온파일 = " + c  + "<p>");
  
  File ff = mr.getFile("file1");
  long fsize = ff.length(); //int 4Byte, long 8Byte
  System.out.println(c+" 파일크기 = " + fsize +"Byte");
  out.println("<br>" + c+" 파일크기 = " + fsize +"Byte <br>");
%>   

<a href="BBBdownload.jsp?fname=<%=c%>"><img src="<%=request.getContextPath()%>/storage/<%=c%>" width="350" height="150"></a>  &nbsp;
<a href="BBBdownload.jsp?fname=<%=c%>"><img src="./storage/<%=c%>" width="350" height="150"></a> <p>

   <a href="AAA.jsp">[AAA.jsp]</a>
   <a href="index.jsp">[index.jsp]</a>
   <a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>

