<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         
<%@ include file="ssi.jsp" %>
<%@ page import="net.tis.sql.GuestDTO" %>
<%@ page import="net.tis.sql.GuestSQL" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"   %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestDetail.jsp]  </title>
  <style type="text/css">
	*{ font-size: 20pt; }
	a{ font-size: 24pt; color:green; text-decoration:none; }
	a:hover{ font-size:24pt; color:blue; text-decoration:underline; }
  </style>
	
  <script type="text/javascript">
  </script>
</head>
<body>

 <p>
 <p>
 <table width="700" border="1" cellspacing="0" cellpading="10">
 <tr>
 	<td colspan="2" align="center">${dto.name} 상세 페이지</td>
 </tr>
 <tr>
 	<td rowspan="5" align="center"><img src="images/jadoo.png" width="300"></td>
 	<td> 이름 : ${dto.name} </td>
 </tr>
 <tr>
 	<td> 제목 : ${dto.title} </td>
 </tr>
 <tr>
 	<td> 날짜 : ${dto.wdate}</td>
 </tr>
 <tr>
 	<td> 급여 : ${dto.pay}</td>
 </tr>
 <tr>
 	<td> 메일 : ${dto.email}</td>
 </tr>
 <tr>
 	<td colspan="2" align="center">
 		<a href="geditpre.do?idx=${dto.sabun}">[수정]</a>
 		<a href="ginset.do">[등록]</a>
 		<a href="gdelete.do?idx=${dto.sabun}">[삭제]</a>
 		<a href="index.jsp">[index]</a>
 		<a href="glist.do">[전체출력]</a>
 	</td>
 </tr>
 </table>
 		
 <p>
 <!-- GuestDetailController 서블릿문서 디스패처포워딩 greplyList.do 댓글출력 포워딩 -->
 <!-- 댓글출력 GuestReplyList 서블릿 문서 포워딩 guestDetail.jsp -->
	<jsp:include page="guestReply.jsp"></jsp:include>
 <p><br>
</body>
</html>




