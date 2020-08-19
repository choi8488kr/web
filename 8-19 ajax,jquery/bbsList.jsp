<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file="./ssi.jsp" %>
<%@ include file="top.jsp" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsList.jsp]</title>
  <style type="text/css">
    *{font-size:16pt; font-weight:bold;  font-family:  Segoe UI Symbol , comic Sans MS ;  }
    a{font-size:16pt; font-weight:bold;  text-decoration:none; }
    a:hover{font-size:16pt; font-weight:bold; text-decoration:underline; }   
    th{color: white;}          
  </style>

  <script type="text/javascript">
 	function changeclear( ){
 		myform.keyword.value="";
 		myform.keyword.focus();
 	}//end
  </script>
 </head>
 

<body>
<%!
 int start, end ; 
 int pagecount;  
 int pageNUM ;   
 int startpage, endpage; 
 String pnum;  
 int temp; 
 int num; 

 String sqry; 
 String skey, sval; 
 String returnpage; 
 
 SimpleDateFormat sdf;
 Date dt;
%>

 <%
 //로그인 유지
//   String id = (String)session.getAttribute("userId");
//   if(id == null){
// 	  response.sendRedirect("index.jsp");
// 	  return;
//   }
  skey=request.getParameter("keyfield"); 
  sval=request.getParameter("keyword"); 
  if(skey==null || skey=="" || sval==null || sval==""){
	  sqry=" where b_name like '%%' "; 
	  skey=""; sval="";
  }else{ sqry=" where "+skey+" like '%"+sval+"%'";  }
   
  returnpage="&keyfield="+skey+"&keyword="+sval ; 
  
  System.out.println("bbsList" + returnpage);
  System.out.println("bbsList" + sqry);
		  
   msg="select count(*) as cnt from bbs "+ sqry; //  
   ST=CN.createStatement();
   RS=ST.executeQuery(msg);
   if(RS.next()==true){
	 Gtotal=RS.getInt("cnt");   
   }
 %>

 <table width=1500 border=1 cellspacing=0 style="margin-left: auto; margin-right: auto;">  
 
  <tr bgcolor="#21517B">
  	<th>No</th> <th>사 번</th> <th>이 름</th> <th>제 목</th> <th>조회수</th> <th>날짜</th>
  </tr>
 <%
   pnum=request.getParameter("pageNum");
   if(pnum==null || pnum==""){ pnum="1"; }
   pageNUM=Integer.parseInt(pnum); 
     /* start=(pageNUM-1)*10+1 ; 
     end=pageNUM*10 ; */  
     start = Gtotal-(pageNUM-1)*10 - 9;
     end = Gtotal-(pageNUM-1)*10;
     
     if(Gtotal%10==0){ pagecount=Gtotal/10; }
     else{ pagecount=(Gtotal/10)+1; } 
   
     temp=(pageNUM-1)%10;
     startpage=pageNUM-temp; 
     endpage=startpage+9; 
     if(endpage>pagecount){ endpage=pagecount;} 
     
   String x=" select * from ( " ;
   String y=" select rownum rn, g.* from bbs g " + sqry;  
   String z=" ) where rn between "+start+" and "+end + "order by b_wdate desc";
   msg=x+y+z;  
   
   sdf =  new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");
   dt = new Date();
   dt = sdf.parse(sdf.format(dt));

   ST=CN.createStatement();
   RS=ST.executeQuery(msg); 
   num=Gtotal-(pageNUM-1)*10+1;
   while(RS.next()==true){
	   sabun=RS.getInt("b_sabun");
	   title=RS.getString("b_title");
	   num--;
	   ST3=CN.createStatement();
	   msg3="select count(*) as rcnt from bbsreply where br_sabun="+sabun;
	   RS3=ST3.executeQuery(msg3);
	   if(RS3.next()==true){
	   	Rtotal = RS3.getInt("rcnt");
	   } 
	   Date sd = sdf.parse(RS.getString("b_wdate"));
 %>	   
   <tr align="center"  onmouseover="style.backgroundColor='#dddddd'" onmouseout="style.backgroundColor=''">
     <td> <%= num %> </td>
     <td> <%= RS.getInt("b_sabun")   %> </td>
     <td> <%= RS.getString("b_name")  %></td>
     <td> <%if((dt.getTime() - sd.getTime())/600000 < 10){%><font style="font-size:12pt; color:red;">(new)</font><%}%><a href="bbsDetail.jsp?idx=<%=sabun%>"><%= title %></a>
     	  <%if(Rtotal>0){%><font style="font-size:12ptl; color:#11217B;"><%out.println("["+Rtotal+"]");}%></font>
     </td>
     <td> <%= RS.getString("b_cnt")  %></td>
     <td> <%= RS.getDate("b_wdate")  %></td>
   </tr>  
  
 <%  
   }
 %>
 
  <tr align="center">
   <td colspan="6">
     <%
      if(startpage>10){
     	out.println("<a href=bbsList.jsp?pageNum="+(startpage-10)+returnpage+">[이전]</a>");   
       }
     %>
   
     <%
      for(int i=startpage; i<=endpage; i++){
   	   if(i==pageNUM){
   		out.println("<font style='font-size:24pt; color:red'>["+i+"]</font>");   
   	   }
   	   else{
   	    out.println("<a href=bbsList.jsp?pageNum="+i+returnpage+">[" + i + "]</a>" );
   	   }
      }
     %> 
     
     <%
      if(endpage<pagecount){
   	out.println("<a href=bbsList.jsp?pageNum="+(startpage+10)+returnpage+">[다음]</a>");   
      }
     %>
   </td>
  </tr>
  
 <tr align="center">
  	<td colspan="6">
  	 <form name="myform" action="bbsList.jsp">
  	 	<select name="keyfield" onchange="changeclear();">
  	 	   <option value="" selected>전체검색</option>
  	 	   <option value="b_name"  <% if(skey.equals("b_name")){out.println("selected");} %> >이름검색</option>
  	 	   <option value="b_title" <% if(skey.equals("b_title")){out.println("selected");} %> >제목검색</option>
  	 	   <option value=""> 내용검색 </option>
  	 	</select>
  	 	<input type="text" name="keyword" value="<%=sval %>" size=10>
  	 	<input type="submit" value="검 색 "> 
  	 	<input type="button" value="index" onclick="location.href='index.jsp'"> &nbsp;&nbsp;
  	 </form>
  	</td>
  </tr>
 </table> 

</body>
</html>
