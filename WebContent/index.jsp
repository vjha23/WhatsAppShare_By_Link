<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	var request;
	function sendDownload(){
		var pathname=document.getElementById("attachment").value;
		var partOfPath=pathname.split('\\');
		var lengthOfPath=partOfPath.length;
		var fileName=partOfPath[lengthOfPath-1];
		var url="download.jsp?name="+fileName;
		
		
		if(window.XMLHttpRequest){
			request=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			request=new ActiveXObject("Microsoft.XMLHTTP");
		}try{
			request.onreadystatechange=getDownload;
			request.open("GET",url,true);
			request.send();
		}catch(e){
			alert("unable to connect to server");
		}
	}
	function getDownload(){
		if(request.readyState==4){
			var pathname=document.getElementById("attachment").value;
			var partOfPath=pathname.split('\\');
			var lengthOfPath=partOfPath.length;
			var fileName=partOfPath[lengthOfPath-1];
			
			var val=request.responseText;
			document.getElementById('display').innerHTML='<a id="whatsapp" href="download.jsp?name='+fileName+'">download the file</a>';
			var mylink=document.getElementById("whatsapp");
			var myurl=mylink.href;
			var whatsapp='<a href="https://web.whatsapp.com/send?text='+myurl+'" data-action="share/whatsapp/share">Share via Whatsapp web</a>';
			document.getElementById('share').innerHTML=whatsapp;
		}
	}
	
	
	
</script>
<body>
<form action="upload.jsp" method="post" enctype="multipart/form-data">  
Select File:<input id="attachment" type="file" name="fname" /><br/>  
<input type="submit"/>  
</form>

							
<span id="display"></span>
<span id="share"></span>
  																																					
<button id="download" onClick="sendDownload()">Share on WhatsApp!</button> 
</body> 

</html>