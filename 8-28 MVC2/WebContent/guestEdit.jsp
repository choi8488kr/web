
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


 <form action="gedit.do">
    사번:<input type="text" name="sabun" value="${dto.sabun}"  readonly="readonly"> <br>
    이름:<input type="text" name="name" value="${dto.name}"> <br>
    제목:<input type="text" name="title" value="${dto.title}"> <br>
    급여:<input type="text" name="pay" value="${dto.pay}"> <br>
    메일:<input type="text" name="email" value="${dto.email}" > <br>
      <input type="submit" value="수정하기">
      <input type="reset" value="입력취소">
 </form>
	
 <br>
 <a href="ginset.do">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="glist.do">[전체출력]</a>
 <p><br>
</body>
</html>



