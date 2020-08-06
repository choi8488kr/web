
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mov_reviewsave.jsp</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String path=application.getRealPath("storage");
	System.out.println("경로 " + path);
	int size=1024*1024*7;
	DefaultFileRenamePolicy dfr = new  DefaultFileRenamePolicy( );
	MultipartRequest mr=new MultipartRequest(request,path,size,"UTF-8", dfr);
	
	identity = mr.getParameter("id");
	pass = mr.getParameter("pass");
	title = mr.getParameter("title");
	content = mr.getParameter("content");
	file = mr.getFilesystemName("file");
	System.out.println(identity);
	System.out.println(pass);
	String a ="select count(mg_id) cnt from mov_guinfo ";
	String b =" where mg_id = '" + identity + "' and mg_pass = '" + pass +"'";
	msg=a+b;
	if(file==null||file==""){
		file="";
	}
	System.out.println(123455);
	try{
		System.out.println(123455);
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		System.out.println(123455);
		if(RS.getInt("cnt")!=1){
%>
		<script type="text/javascript">
			alert("아이디 혹은 비밀번호가 틀렸습니다.");
		</script>
<% 
		response.sendRedirect("mov_review.jsp");
		}else{
			System.out.println(123455);
			a ="insert into mov_review ";
			b ="values(mov_review_seq.nextval,?,?,?,?,sysdate,0)";
			msg=a+b;
			PST=CN.prepareStatement(msg);
			PST.setString(1,identity);
  	  		PST.setString(2,title);
  	  		PST.setString(3,content);
  	  		PST.setString(4,file);  	
  	  		PST.executeUpdate(); 
  	  		System.out.println("mov_review테이블  저장성공");  
  	  		response.sendRedirect("mov_board.jsp");
		}		
	}catch(Exception e){
		System.out.println("mov_reviewcheck.jsp" + e);
		}
%>
	


</body>
</html>