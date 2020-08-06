<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply.jsp] </title>
	<style type="text/css">
	  *{ font-size: 16pt; font-weight: bold; }
	  a{ font-size: 16pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 18pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:yellow;   height:130px;
	  }
	</style>

	<script type="text/javascript">
	
	</script>
</head>
<body>
<h1>영화리뷰</h1>
<form name="detail_form" method="post" action="mov_board">
<table>
	<%
	code = request.getParameter("idx");
	msg="update mov_review set mrv_chnum=mrv_chnum+1 where mrv_code = "+code;
	ST = CN.createStatement();
	ST.executeUpdate(msg);
	
	msg="select * from mov_review where mrv_code = "+code;
	
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	while(RS.next()){
		file =RS.getString("mrv_img");
		%>
			<tr>
				<td>제목 : <%=RS.getString("mrv_title") %>
				</td>
			</tr>
			<tr>
				<td>포스터 : <%if(file==null){ %> 파일없음 <% }else{ %> <img src="./storage/<%=file%>" width=250 height=150> <% } %>
				</td>
			</tr>
			<tr>
				<td>내용 : <%=RS.getString("mrv_content") %>
				</td>
			</tr>		
		<%
	}
	%>

</table>


</form>

<p>
<a href="mov_review.jsp">[리뷰 등록]</a>
<a href="mov_board.jsp">[리뷰 게시판]</a>

</body>
</html>






