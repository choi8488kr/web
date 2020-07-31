
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
	
	<script type="text/javascript">
		var Gflag=false;
		
		function nullCheck(){
			//돔 = DOM 모댈 객체 document, window, location, history 생략 가능
			var a = document.myform.sabun.value;
			var b = document.myform.name.value;
			var c = document.myform.title.value;
			var d = document.myform.pay.value;
			
			if(a==null || a==""){
				alert("사번 데이터를 입력하세요");
				myform.sabun.focus();
				return;
			}else{
				myform.name.focus();	
			}
			if(b==null || b==""){
				alert("이름 데이터를 입력하세요");
				myform.name.focus();
				return;
			}else{
				myform.title.focus();	
			}
			if(c==null || c==""){
				alert("제목 데이터를 입력하세요");
				myform.title.focus();
				return;
			}else{
				myform.pay.focus();	
			}
			if(d==null || d==""){
				alert("급여 데이터를 입력하세요");
				myform.pay.focus();
				return;
			}else{
				myform.email.focus();	
			}
			var size = myform.sabun.value.length;
			if(size!=4){
				alert("사번 데이터는 4자리여야만 합니다.");
				myform.sabun.value="";
				myform.sabun.focus();
				return;
			}
			var size2 = myform.pay.value.length;
			if(size2!=2){
				alert("급여 데이터는 2자리여야만 합니다.");
				myform.pay.value="";
				myform.pay.focus();
				return;
			}
			
			var check = myform.idDuplication.value;
			if(check != "idCheck"){
				alert("아이디 중복체크를 해주세요.");
				return;
			}
			
			document.myform.submit(); // action 속성의 문서랑 연결됨
		}
		
		function info(){
			window.open("popup.jsp","??","width=350,height=550,left=400,top=200");
		}
		
		function idCheck(){
			
			var len_sabun=document.myform.sabun.value.length;
			var a=document.myform.sabun.value;
			Gsabun=a;
			if(a==null || a==""){
				alert("사번 id를 입력하세요");
				myform.sabun.focus();
				return;
			}
			open("openID.jsp?idx="+a,"bb","width=500,height=170,left=600,top=200");
			
		}
		
	</script>
</head>
<body onload="info();">
 <p>
 guestWrite.jsp문서 입력화면 <p>
 
 <form name="myform" method="get" action="guestWriteSave.jsp">
    사번:<input type="text" name="sabun" maxlength="4" size="10">
      <input type="button" onclick="idCheck();" value="ID중복">
      <br>
    이름:<input type="text" name="name" > <br>
    제목:<input type="text" name="title" value="rain"> <br>
    급여:<input type="text" name="pay" value="24"> <br>
    메일:<input type="text" name="email" value="bc@ti.org" > <br>
      <input type="button" onclick="nullCheck();" value="등록하기">
      <input type="hidden" name="idDuplication" value="idUncheck">
      <input type="reset" value="입력취소">
 </form>
	
 <br>
 <a href="guestWrite.jsp">[등록]</a>
 <a href="index.jsp">[index]</a>
 <a href="guestList.jsp">[전체출력]</a>
 <p><br>
</body>
</html>



