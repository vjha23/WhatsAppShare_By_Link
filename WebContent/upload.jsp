<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>  
    <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%  

MultipartRequest m = new MultipartRequest(request, "/home/pericent/MyWorkspace/FileuploadByJsp/WebContent/document",1000000000);  
out.print("<button onClick='Send()'> Go to the home page </button>");
  
  
  %>
</body>
<script >
	function Send(){
		window.location.replace("index.jsp");
	}
</script>
</html>