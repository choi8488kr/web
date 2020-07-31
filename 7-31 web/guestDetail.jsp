<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         
<%@ include file="ssi.jsp" %>

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
 <jsp:useBean id="DTO" class="net.tis.sql.GuestDTO"/>
 <jsp:useBean id="DAO" class="net.tis.sql.GuestSQL"/>
 
 <%!GuestDTO gdto = new GuestDTO(); %>
  <%
  DTO.setSabun(Integer.parseInt(request.getParameter("idx")));
  gdto = DAO.dbDetail(DTO);
    
  %>
 <p>
 <p>
 <table width="700" border="1" cellspacing="0" cellpading="10">
 <tr>
 	<td colspan="2" align="center"><%=gdto.getSabun() %> 상세 페이지</td>
 </tr>
 <tr>
 	<td rowspan="5" align="center"><img src="images/jadoo.png" width="300"></td>
 	<td> 이름 : <%=gdto.getName() %></td>
 </tr>
 <tr>
 	<td> 제목 : <%=gdto.getTitle() %></td>
 </tr>
 <tr>
 	<td> 날짜 : <%=gdto.getWdate() %></td>
 </tr>
 <tr>
 	<td> 급여 : <%=gdto.getPay() %></td>
 </tr>
 <tr>
 	<td> 메일 : <%=gdto.getEmail() %></td>
 </tr>
 <tr>
 	<td colspan="2" align="center">
 		<a href="guestEdit.jsp?idx=<%=Gsabun%>">[수정]</a>
 		<a href="guestWrite.jsp">[등록]</a>
 		<a href="guestDelete.jsp?idx=<%=Gsabun%>">[삭제]</a>
 		<a href="index.jsp">[index]</a>
 		<a href="guestList.jsp">[전체출력]</a>
 	</td>
 </tr>
 </table>
 		
 <p>
 <!-- 댓글포함 -->

 
 <p><br>
</body>
</html>




