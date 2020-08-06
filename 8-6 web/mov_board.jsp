<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [guestReply.jsp] </title>
	<style type="text/css">
	  *{ font-size: 15pt; font-weight: bold; }
	  a{ font-size: 15pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
	  a:hover{ font-size: 16pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
	  #rsave{
	    font-size: 26pt; font-weight: bold;
	    background:yellow;   height:130px;
	  }
	</style>

	<script type="text/javascript">
	
	</script>
</head>
<body>
<h1>영화리뷰게시판</h1>
<form name="board_form" method="post" action="mov_board">
<table>
<tr align="center">
	<td>번호</td>		<td>제목</td>		<td>글쓴이</td>	<td>조회</td>		<td>날짜</td>
</tr>
<%
////////////////////paging////////////////////
msg="select count(*) as cnt from mov_review " ;
 ST=CN.createStatement();
 RS=ST.executeQuery(msg);
 RS.next(); //if, while 없이 이동
 int Rcount = RS.getInt("cnt"); //
pnum = request.getParameter("pageNum");  //[13]클릭하면 문자로 13로 기억

if( pnum==null || pnum==""){ pnum="1"; }
pageNUM = Integer.parseInt(pnum);        //[13]클릭하면 숫자로 13로 기억
//System.out.println("클릭한 페이지 = " + pageNUM);



start = Rcount-(pageNUM-1)*10 - 9;
end = Rcount-(pageNUM-1)*10;

//[이전] [11]  ~[14]클릭~~ [20][다음]
tmp = (pageNUM-1)%10 ; //14-1%10 결과은 3  
startpage = pageNUM-tmp ; //11   31
endpage = startpage+9 ; //20     40

//페이지갯수를 구해야 이전,다음 이동이 가능합니다
//총페이지수 Gtotal=316  pagecount=32
if( Rcount%10==0 ) { pagecount = Rcount/10; }
else { pagecount = (Rcount/10)+1; }
System.out.println(start);
System.out.println(end);
if(endpage>pagecount) { endpage=pagecount; }

////////////////////////////////////////////////////////
	msg="select * from " +
	"((select rownum rn, g.* from (select * from mov_review order by mrv_writedate) g) "+ 
			"order by rn desc) "+ 
	"where rn between "+start+" and "+ end;
	

	ST=CN.createStatement();
	RS=ST.executeQuery(msg);
	while(RS.next()){
		Date Rdate = new Date();
		code = RS.getString("mrv_code");
		Rnum = Integer.parseInt(RS.getString("rn"));
		String Rtitle = RS.getString("mrv_title");
		int Rhit = Integer.parseInt(RS.getString("mrv_chnum"));
		Rwriter = RS.getString("mrv_id");
		Rdate = RS.getDate("mrv_writedate");
		msg="select count(*) cnt from (select r.mrp_code from mov_repl r inner join mov_review v on v.mrv_code = r.mrp_code)";
		ST1=CN.createStatement();
		RS1=ST1.executeQuery(msg);
		int Rtotal=0;
		while(RS1.next()){
			Rtotal = Integer.parseInt(RS1.getString("cnt"));
			
		}
		%>
		<tr>
			<td><%= Rnum%></td> 
			<td><a href="review_detail.jsp?idx=<%=code%>"><%= Rtitle%></a><font style='font-size:12pt; color:red'> <%if(Rtotal>0){%> [ <%=Rtotal %> ] <%}%></font></td> 
			<td><%= Rwriter%></td>
			<td><%= Rhit%></td>
			<td><%= Rdate%></td>
		</tr>
		<%
	}
%>
<tr>
	<td colspan="5" align="center">
	<%

    //이전///////////////////////////////////
     if ( startpage > 10 )  { //[1] > 10 만족하지 않아서 [이전][1] ~  
   	  out.println("<a href=mov_board.jsp?pageNum="+(startpage-10)+">[이전]</a>");	 
   	 }
    
      for(int i=startpage;i<=endpage; i++){
      	if(i==pageNUM){
      		out.println("<font style='font-size:15pt; color:red'>["+i+"]</font> ");	
      	}else{
   	     out.println("<a href=mov_board.jsp?pageNum="+i+">["+i+"]</a>");
      	}
   	  }//for end
    
   	 //다음
   	 if ( endpage < pagecount )  { //[10] < 32크면
   	  out.println("<a href=mov_board.jsp?pageNum="+(startpage+10)+">[다음]</a>");	 
   	 }
   	  //////////////////////////////////////////////////
    %> 
    </td>
</tr>

</table>

</form>

<p>
<a href="mov_review.jsp">[리뷰 등록]</a>
<a href="mov_board.jsp">[리뷰 게시판]</a>

</body>
</html>






