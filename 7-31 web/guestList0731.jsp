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
 <jsp:useBean id="SQL" class="net.tis.sql.GuestSQL"/>

 <%
 ///////////////////////////////////////////////////
 msg="select count(*) as cnt from guest " ;
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 RS.next(); //if, while 없이 이동
 GGtotal = RS.getInt("cnt"); //Gtotal = 316기억 
 
  //2020-07-28-목요일  페이징,검색,댓글 
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  Date dt = new Date( );
  //제목옆에 60분=1시간전에 올라온 글에 대해서 new깃발이나 red색표시 	
 
  pnum = request.getParameter("pageNum");  //[13]클릭하면 문자로 13로 기억
 
  if( pnum==null || pnum==""){ pnum="1"; }
  pageNUM = Integer.parseInt(pnum);        //[13]클릭하면 숫자로 13로 기억
  //System.out.println("클릭한 페이지 = " + pageNUM);
  
  start = (pageNUM-1)*10+1 ; //[14]클릭  시작행 131
  end = (pageNUM*10) ; //[14]클릭  끝행 140
  
  //[이전] [11]  ~[14]클릭~~ [20][다음]
  tmp = (pageNUM-1)%10 ; //14-1%10 결과은 3  
  startpage = pageNUM-tmp ; //11   31
  endpage = startpage+9 ; //20     40
  
  //페이지갯수를 구해야 이전,다음 이동이 가능합니다
  //총페이지수 Gtotal=316  pagecount=32
  if( Gtotal%10==0 ) { pagecount = Gtotal/10; }
  else { pagecount = (Gtotal/10)+1; }
  
  if(endpage>pagecount) { endpage=pagecount; }
  
  sqry=" ";
  skey=request.getParameter("keyfield");
  sval=request.getParameter("keyword") ;
  
  //System.out.println("넘어온 필드="+skey+" 키워드="+sval);
  if(skey==null || skey=="" || sval==null || sval==""){
  	skey="";
  	sval="";
  	sqry=" where name like '%%' ";
  	
  }else{
    sqry=" where "+skey+" like '%"+sval+"%'";
    
  }
  returnpage="&keyfield="+skey+"&keyword="+sval;
//   out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");	 
  
  msg="select count(*) as cnt from guest "+sqry ;
  ST=CN.createStatement();
  RS=ST.executeQuery(msg);
  RS.next(); //if, while 없이 이동
  Gtotal = RS.getInt("cnt"); 
  
  
  
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

<%
  //guestList.jsp문서는 단독실행가능 
  while(RS.next()==true) {
    Gsabun = RS.getInt("sabun");
    Gtitle = RS.getString("title");
    String msg3="select count(*) as rcnt from guestreply where sabun="+Gsabun;
    ST1=CN.createStatement();
    RS1=ST1.executeQuery(msg3);
    if(RS1.next()==true) {   RGtotal=RS1.getInt("rcnt");   }
%>   
   <tr  onmouseover="style.backgroundColor='rgb(0,200,200)'" 
        onmouseout="style.backgroundColor=''">
     <td> <%= RS.getInt("rn") %> </td> 
     <td> <%= Gsabun %> </td> 
     <td> <%= RS.getString("name") %> </td> 
     <td> <a href="guestDetail.jsp?idx=<%=Gsabun%>"> <%= Gtitle %>  </a><font style='font-size:12pt; color:red'><%if(RGtotal>0){%> [ <%=RGtotal %> ] <%}%></font> </td> 
     <td> <%= RS.getDate("wdate") %> </td> 
     <td> <%= RS.getInt("hit") %> </td>
     <td align="center">
      <input type="button" onclick="location.href='guestDelete.jsp?idx=<%=Gsabun%>' " value="삭제">
     </td>    
   </tr>
<% } %>  

 <tr>
   <td colspan="7" align="center">
    <%
    //이전
     if ( startpage > 10 )  { //[1] > 10 만족하지 않아서 [이전][1] ~  
   	  out.println("<a href=guestList.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");	 
   	 }
    
      for(int i=startpage;i<=endpage; i++){
      	if(i==pageNUM){
      		out.println("<font style='font-size:26pt; color:red'>["+i+"]</font> ");	
      	}else{
   	     out.println("<a href=guestList.jsp?pageNum="+i+returnpage+">["+i+"]</a>");
      	}
   	  }//for end
    
   	 //다음
   	 if ( endpage < pagecount )  { //[10] < 32크면
   	  out.println("<a href=guestList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");	 
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












