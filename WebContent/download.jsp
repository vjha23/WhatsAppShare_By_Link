<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.activation.MimetypesFileTypeMap"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%    
  String filename = request.getParameter("name"); 
String contentType = new MimetypesFileTypeMap().getContentType(filename);
  String filepath = "/home/pericent/MyWorkspace/FileuploadByJsp/WebContent/document/";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  response.setHeader("Cache-Control", "no-cache");
	
  File file = new File(filepath+filename);
  FileInputStream fileIn = new FileInputStream(file);
  ServletOutputStream out2 = response.getOutputStream();

  byte[] outputByte = new byte[4096];
  //copy binary contect to output stream
  while(fileIn.read(outputByte, 0, 4096) != -1)
  {
      out2.write(outputByte, 0, 4096);
  }
  fileIn.close();
  out2.flush();
  out2.close();
  
  //java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
      
StringBuffer sb = new StringBuffer("whatever string you like");
InputStream in = new ByteArrayInputStream(sb.toString().getBytes("UTF-8"));
ServletOutputStream outSteam = response.getOutputStream();

byte[] outputByte1 = new byte[4096];
//copy binary contect to output stream
while(in.read(outputByte1, 0, 4096) != -1)
{
    outSteam.write(outputByte1, 0, 4096);
}
in.close();
outSteam.flush();
outSteam.close();      
  
 // out.println("<h1>File name is "+filename);
%>   
</body>
</html>