<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> AAA.jsp </title>
   <style type="text/css">
     *{ font-size: 20pt; font-weight: bold; }
     a{ font-size: 24pt; text-decoration:none; color:blue ; font-family: Comic Sans MS; }
     a:hover{ font-size: 30pt; text-decoration:underline; color:green ; font-family: Comic Sans MS; }
   </style>

   <script type="text/javascript">
     function handleFileSelect(){
         var files = document.getElementById('file').files[0]; 
            var reader = new FileReader();  
                    
           reader.onload = (function(theFile) {
             return function(e) {
             //alert(theFile.name);
             
             //원본 var img_view = ['<img src="', e.target.result, '" name="', escape(theFile.name),'"   width="450" height="250"  alt="tis" />'].join('');
             var img_view = ['<img src=', e.target.result + '  width="450" height="250"  alt="tis" />'].join('');
             //alert(img_view);
             //내껏 var img_view = "[<img src="+theFile.name+" width='450' height='250'  alt='tis' >]" + join("");  
             document.getElementById('preview').innerHTML = img_view ;
             };
          })(files);
        reader.readAsDataURL(files);    
     }//end   
     
     
     function previewFiles() { //새로만든함수
        var preview = document.querySelector('#preview');
        var files   = document.querySelector('input[type=file]').files;
        //var files = document.getElementById('file').files[0];
        //document.getElementById('preview')
        
        function readAndPreview(file) {
          //file.name` 형태의 확장자 규칙에 주의하세요
          if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
            var reader = new FileReader();

            //reader.onload = (function(theFile) { 코드기술 } ).(files)
            reader.addEventListener("load", function () {
              var image = new Image();
              image.width = 400;
              image.height = 200;
              //image.title = file.name;
              image.src = this.result;
              preview.appendChild( image );
            }, false);

            reader.readAsDataURL(file);
          } //정규식end
        }

        if (files) {
          [].forEach.call(files, readAndPreview);
        }

      }
   </script>
</head>
<body>
   <form action="BBB.jsp" method="post"  enctype="multipart/form-data" >
        <input type="hidden" name="num" value="7789"> <br>
       제목: <input type="text" name="title" value="snow"> <br>
        파일: <input type="file" name="file1" id="file" onchange="handleFileSelect();"> <p>
       <input type="submit" value="파일전송">
       <input type="reset" value="입력취소">
   </form>
   
   <div id="preview"></div>
   
   <hr>
   <a href="AAA.jsp">[AAA.jsp]</a>
   <a href="index.jsp">[index.jsp]</a>
   <a href="guestList.jsp">[guestList.jsp]</a>
</body>
</html>
