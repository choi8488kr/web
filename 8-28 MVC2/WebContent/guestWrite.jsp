
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>         

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
	
	
</head>
<body onload="info();">
<jsp:include page="guest_header.jsp" />
 <p>
 guestWrite.jsp문서 & ginsert.do 연결<p>
 
 <form name="myform" action="ginsert.do">
    사번:<input type="text" name="sabun" maxlength="4" size="10">
    
      <input type="button" onclick="idCheck();" value="ID중복">
    	<span id="sabun_ch"></span>  
      <br>
    이름:<input type="text" name="name" ><span id="name_ch"></span> <br>
    제목:<input type="text" name="title" value="rain"><span id="title_ch"></span> <br>
    급여:<input type="text" name="pay" value="24"><span id="pay_ch"></span> <br>
    메일:<input type="text" name="email" value="do@ti.org" > <br>
      <input type="submit"  value="등록하기">
      <input type="hidden" name="idDuplication" value="idUncheck">
      <input type="reset" value="입력취소">
      
      
      
 </form>
	
 <br>
 <a href="ginset.do">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="login.jsp">[로그인]</a>
 <a href="glist.do">[전체출력]</a>
 <p><br>
 
 <jsp:include page="guest_footer.jsp" />
</body>
</html>



