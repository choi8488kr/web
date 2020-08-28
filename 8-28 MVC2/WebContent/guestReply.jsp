<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"   %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

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
	  #btnEdit{font-size:14pt;background:#00FFFF;}
	</style>
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <link rel="stylesheet" href="/resources/demos/style.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript">
	 function replyEdit(num,writer,content,sabun){
		 $('#writer'+num).html("<input type=text id='writer' value="+writer+" size=12>");
		 $('#content'+num).html("<input type=text id='content' value="+content+" size=12>");
		 $('#bt'+num).html("<input type='button' id='btnEdit' onclick=\"editSave("+num+","+sabun+")\" value='수정완료'>"+
				 			"<a href='javascript:location.reload();'>[취소]</a>");
		 
	 }
	 function editSave(num, sabun){
		 var wt = $('#writer').val();
		 var ct = $('#content').val();
		 location.href="greplyUpdate.do?num="+num+"&writer="+wt+"&content="+ct+"&sabun="+sabun;
	 }
	
	 
	</script>
</head>
<body>
   

 	
 <form action="greplyInsert.do">
 	 <table width=900 border=1 cellspacing=0>
 	 <tr>
 	  	<td> <img src="images/z1.gif"> Gidx: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="sabun" value="${rsabun}" size=30 readonly> </td>
 	  	<td rowspan="3"  align="center">
 	  		<input type="submit" id="rsave" name="bt_save" value="댓글저장">
 	  	</td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 저자: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="writer" size=30> </td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 내용: <img src="images/z1.gif">  </td>
 	  	<td> <textarea rows="3" cols="27" name="content"></textarea> </td>
 	  </tr>
 	 </table>
 </form>
 	
 <p>
 <table width=900 border=0 cellspacing=0>
 <caption> <<<< 댓글내용출력  &nbsp; 댓글갯수:${Rtotal} &nbsp;>>>> </caption>
  <tr bgcolor="pink" >
  	<td>번호</td>
  	<td>저자</td>
  	<td>댓글내용</td>
  	<td>수정/삭제</td>
  </tr>

  <c:forEach var="rdto" items="${rLG}" >
  <tr onmouseover="style.backgroundColor='yellow'" onmouseout="style.backgroundColor='' ">

  	<td width=70 id="num${rdto.num}">  ${rdto.num} </td>
  	<td width=150 id="writer${rdto.num }"> ${rdto.writer} </td>
  	<td width=200 id="content${rdto.num }"> ${rdto.content} </td>
  	<td id="bt${rdto.num }">
  		<a href="greplyDelete.do?Gidx=${rsabun }&num=${rdto.num}">[del]</a>
  		<a href="#" onclick="replyEdit('${rdto.num}' ,'${rdto.writer }','${rdto.content }','${rdto.sabun }')">[edit]</a> 
  	</td>
  	
  </tr>
  </c:forEach>

 </table>	
 
 <p style="margin-bottom:150px">
 <p><br>
</body>
</html>






