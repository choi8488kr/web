
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestWrite.jsp 입력화면]  </title>
  <style type="text/css">
	*{ font-size: 20pt; }
	a{ font-size: 20pt; color:green; text-decoration:none; }
	a:hover{ font-size:30pt; color:blue; text-decoration:underline; }
  </style>
	
	<script type="text/javascript">
	</script>
</head>
<body>
 <p>
 guestEdit.jsp문서 입력화면 <p>
 <%
    Gdata = request.getParameter("idx");
    msg="select * from guest where sabun =  " + Gdata ;
    ST=CN.createStatement();
    RS=ST.executeQuery(msg); //조회한 한건 결과를 RS기억 
    if(RS.next()==true) {
      Gsabun = RS.getInt("sabun");
      Gtitle = RS.getString("title");
      Gname = RS.getString("name");
      Gpay = Integer.parseInt(RS.getString("pay"));
      Gwdate = RS.getDate("wdate");
      Gemail = RS.getString("email");
   	} 
  %>
 
 <form method="get" action="guestEditSave.jsp">
    사번:<input type="text" name="sabun" value=<%=Gsabun %> readonly="readonly"> <br>
    이름:<input type="text" name="name" value=<%=Gname %>> <br>
    제목:<input type="text" name="title" value=<%=Gtitle %>> <br>
    급여:<input type="text" name="pay" value=<%=Gpay %>> <br>
    메일:<input type="text" name="email" value=<%=Gemail %> > <br>
      <input type="submit" value="수정하기">
      <input type="reset" value="입력취소">
 </form>
	
 <br>
 <a href="guestWrite.jsp">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="guestList.jsp">[전체출력]</a>
 <p><br>
</body>
</html>



