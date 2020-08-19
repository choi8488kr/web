<%@ page contentType="text/html; charset=UTF-8" %>

 <script type="text/javascript">
    var xhr = null; //전역변수선언
    var ID = "";
    var PW = "";

    function first() {
		xhr = new XMLHttpRequest(); 
		
		ID = form.userid.value;
		PW = form.pwd.value;
		if (ID == "" || PW == "" || ID == null || PW == null ) {
			alert("userID,PWD공백입니다");
		} else {
			var url = "loginList.jsp?userid=" + ID + "&pwd=" + PW;
			//alert(url);
			xhr.onreadystatechange = two; //괄호없음two=display
			xhr.open('GET', url, true);
			xhr.send(null);
		}
	}//first end
	
	function two() {
	  if(xhr.readyState==4){
		if(xhr.status==200){
		  var str = xhr.responseText;
		  //alert(str);
		  document.getElementById("result").innerHTML=str;   
	  	 }//200 end
	   }//4 end
	}//two end 
     
	
   function myload(){
   	 location.reload( );
     form.userid.focus(); //입력란속성에 autofocus  
   }//end
 </script>

<link rel="stylesheet" type="text/css" href="../css/style.css">
<DIV>
  <img src='../images/carousel6.png' width='100%' height='200px'  id='topIMG'>
  
  <nav id="topMenu">
    <ul>
      <li><a class='menuLink' href='index.jsp'>공지사항</a></li>
      <li><a class='menuLink' href='bbsList.jsp'>목록으로</a></li>
      <li><a class='menuLink' href='Input.html'>글쓰기</a></li>
      <li><a class='menuLink' href='bbsImgList.jsp'>앨범보기</a></li>
	      <li>
	        <span class='menuLogin'>
	          <div id="result">
		  	 	<form name="form">
		  	 	 userID:<input type="text" name="userid" size=6  value="sky">
		  	 	 PWD:<input type="text" name="pwd"  size=6  value="1234">
		  	 	      <input type="button"  onClick="first( );" value="로그인">
		  	 	 </form>
		  	   </div>
	  	 	 </span>   
	      </li>  
    </ul>
  </nav>
  
</DIV>

