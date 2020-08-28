<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"   %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp]  </title>
  <style type="text/css">
   
	*{ font-size: 20pt; }
	a{ font-size: 18pt; color:blue; text-decoration:none; }
	a:hover{ font-size:20pt; color:green;  text-decoration:none;  }
	#span_rcnt { font-size:16pt; color:red; }
  </style>
	
  <script type="text/javascript">
    function clearText(){
	   document.sform.keyword.value="";
	   document.sform.keyword.focus();
	}
  </script>
</head>
<body>


 <table width="1200" border="1" cellspacing="0">
   <tr align="right">
   	 <td colspan="6">
   	   <a href="guestWrite.jsp">[신규등록]</a> 
   	   <a href="index.jsp">[index]</a> 
   	   <a href="login.jsp">[로그인]</a> &nbsp;
   	      총레코드갯수:${Gtotal }/${Atotal } &nbsp;&nbsp;
   	  </td>
   </tr>
   
  <tr bgcolor="yellow">
    <td>행번호</td>  <td>사번</td> <td>이름</td> 
    <td>제목</td>   <td>날짜</td> <td>조회수</td>  
  </tr>

  <c:forEach var="dto" items="${LG}">
   <tr>
     <td>${dto.rn }  </td> 
     <td>${dto.sabun }  </td> 
     <td>${dto.name }  </td> 
     <td> <a href="gdetail.do?idx=${dto.sabun }">${dto.title }<font color="red" style="font-size:16pt"><c:if test="${dto.rcnt>0}">[${dto.rcnt}]</c:if></font></a></td> 
     <td>${tdo.wdate }  </td> 
     <td>${dto.hit }  </td>
   </tr>
  </c:forEach>
<tr>
   <td colspan="6" align="center"> 
   <c:if test="${startpage>10 }"><a href="glist.do?pageNum=${startpage-10}">[이전]</a></c:if>
   	<c:forEach var="i" begin="${startpage }" end="${endpage }" step="1">
   		<c:choose>
   			<c:when test="${i == pageNUM}">
   				<font style='font-size:26pt; color:red'> [${i}] </font>
   			</c:when>
   			<c:otherwise>
   				<a href="glist.do?pageNum=${i}${returnpage}"> [${i}] </a>
   			</c:otherwise>
   		</c:choose>
   	</c:forEach>
   	<c:if test="${endpage<pagecount }"><a href="glist.do?pageNum=${startpage+10 }">[다음]</a></c:if>
   </td>
</tr>
 
 <tr>
   <td colspan="6" align="center">  
     <form name="sform">
        <b>검색:</b>
       <select name="keyfield" onchange="clearText();">
         <option value="">---검색선택--- </option>
         <option value="name" <c:if test="${skey eq 'name'}">selected</c:if>>이름검색</option>
         <option value="title" <c:if test="${skey eq 'title'}">selected</c:if> >제목검색</option>
         <option value="">내용검색</option>
       </select>
       <input type="text" name="keyword" size="10" value="${sval }">
       <input type="submit" value=" 검 색 ">
     </form>
   </td>
 </tr> 
 
 </table>		
</body>
</html>












