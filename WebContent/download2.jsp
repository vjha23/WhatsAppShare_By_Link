<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.activation.MimetypesFileTypeMap"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.OutputStream"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String filePath ="/home/pericent/MyWorkspace/FileuploadByJsp/WebContent/document/"; 
String fileName = request.getParameter("n");

MimetypesFileTypeMap mimeTypesMap = new MimetypesFileTypeMap();
String mimeType = mimeTypesMap.getContentType(request.getParameter("fileName"));

response.setContentType(mimeType);
response.setHeader("Content-disposition", "attachment; filename=" + fileName);

OutputStream out2 = response.getOutputStream();
FileInputStream in = new FileInputStream(filePath);
byte[] buffer = new byte[4096];
int length;
while ((length = in.read(buffer)) > 0) {
    out2.write(buffer, 0, length);
}
in.close();
out.flush();


%>
</body>
</html>