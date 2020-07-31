<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8" %>
<%@ page import="java.text.SimpleDateFormat"%>      
<%@ page import="java.util.Date" %> 
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestList.jsp]  </title>
  <style type="text/css">
   
	*{ font-size: 20pt; }
	a{ font-size: 18pt; color:blue; text-decoration:none; }
	a:hover{ font-size:18pt; color:green;  text-decoration:none;  }
  </style>
	
  <script type="text/javascript">
  function updated(){
	  //document.getElementById("keyfield");
	  search.keyword.value="";
	  search.keyword.focus();
  }
  </script>
</head>
<body>
 <jsp:useBean id="DTO" class="net.tis.sql.GuestDTO"/>
 <jsp:useBean id="DAO" class="net.tis.sql.GuestSQL"/>
 <jsp:setProperty property="*" name="DTO"/>

 <%
 ///////////////////////////////////////////////////
 GGtotal = DAO.GGtotal();
 Gtotal = DAO.Gtotal(DAO.sqry);
 
 
  //2020-07-28-목요일  페이징,검색,댓글 
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  Date dt = new Date( );
  //제목옆에 60분=1시간전에 올라온 글에 대해서 new깃발이나 red색표시 	
 
//   out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");	 

  
  
  ///////////////////////////////////////////////////////////////
   msg = "select * from ( select rownum rn, g.* from (select * from guest"+sqry+" order by sabun) g) where rn  between  " + start + "  and  " + end ;
   // select * from (select rownum rn, g.* from (select * from guest where name like '%b%' order by sabun) g) where rn between 11 and 20;
   ST=CN.createStatement();
   RS=ST.executeQuery(msg); //조회한전체결과를 RS기억 
  // msg = "select rownum,  g.* from guest g " ;

 %>
 
 <table width="1200" border="1" cellspacing="0">
   <tr align="right">
   	 <td colspan="7">
   	   <a href="guestWrite.jsp">[입력]</a> 
   	   <a href="index.jsp">[index]</a> 
   	   <a href="login.jsp">[로그인]</a> &nbsp;
   	     총레코드갯수: <%=Gtotal %> /<%=GGtotal %> &nbsp;&nbsp;
   	  </td>
   </tr>
   
   <tr bgcolor="yellow">
    <td>행번호</td> <td>사번</td> <td>이름</td> 
    <td>제목</td>   <td>날짜</td> <td>조회수</td> <td>삭제</td>
   </tr>

<%!GuestDTO gdto = new GuestDTO(); %>
<%
	ArrayList<GuestDTO> ar = new ArrayList();
	DAO.paging(DTO);
	ar = DAO.dbSelect(DTO);
	//
	
	for(int i=0;i<ar.size();i++){
		gdto = ar.get(i);
  
%>   
   <tr  onmouseover="style.backgroundColor='rgb(0,200,200)'" 
        onmouseout="style.backgroundColor=''">
     <td> <%= gdto.getRn() %> </td> 
     <td> <%= gdto.getSabun() %> </td> 
     <td> <%= gdto.getName() %> </td> 
     <td> <a href="guestDetail.jsp?idx=<%=gdto.getSabun()%>"> <%= gdto.getTitle() %>  </a><font style='font-size:12pt; color:red'><%if(RGtotal>0){%> [ <%=RGtotal %> ] <%}%></font> </td> 
     <td> <%= gdto.getPay() %> </td> 
     <td> <%= gdto.getHit() %> </td>
     <td align="center">
      <input type="button" onclick="location.href='guestDelete.jsp?idx=<%=gdto.getSabun()%>' " value="삭제">
     </td>    
   </tr>
<% } %>  

 <tr>
   <td colspan="7" align="center">
    <%
    
    //이전
     if ( DAO.startpage > 10 )  { //[1] > 10 만족하지 않아서 [이전][1] ~  
   	  out.println("<a href=guestList.jsp?pageNum="+(DAO.startpage-10)+returnpage+">[이전]</a>");	 
   	 }
    
      for(int i=DAO.startpage;i<=DAO.endpage; i++){
      	if(i==DAO.pageNUM){
      		out.println("<font style='font-size:26pt; color:red'>["+i+"]</font> ");	
      	}else{
   	     out.println("<a href=guestList.jsp?pageNum="+i+returnpage+">["+i+"]</a>");
      	}
   	  }//for end
    
   	 //다음
   	 if ( DAO.endpage < DAO.pagecount )  { //[10] < 32크면
   	  out.println("<a href=guestList.jsp?pageNum="+(DAO.startpage+10)+returnpage+">[다음]</a>");	 
   	 }
    %> 
   </td>
 </tr> 
 <tr>
 	<td colspan="7" align="center">
 		<form id="search" name="search" action="guestList.jsp">
 		검색 :
 			<select id="keyfield" name="keyfield" onchange="updated()">
 				<option value="">-----검색키워드-----</option>
 				<option value="name" <%if(skey.equals("name")){ %> selected="selected" <% }%>>이름검색</option>
 				<option value="title" <%if(skey.equals("title")){ %> selected="selected" <% } %>>제목검색</option>
 				<option value="">내용검색</option>
 			</select>
 			<input type="text" id="keyword" name="keyword" size="10" placeholder="검색어입력" value=<%=sval%>>
 			<input type="submit" value="검색">
 		</form>
 	</td>
 </tr>
 </table>		
</body>
</html>












