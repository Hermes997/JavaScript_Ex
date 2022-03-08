<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<meta name="viewport" content="width=device-width,initial-scale=1.0" />

<html lang="ko">

  <head>

  </head>

    <body>
      <%
      String realFolder="";

      String saveFolder="imageFile";
      String encType="utf-8";
      int maxSize=50*1024*1024;

      ServletContext context=this.getServletContext();

      realFolder = context.getRealPath(saveFolder);


      MultipartRequest multi=null;
      out.println("경로 : " + realFolder);
      try{
          
          multi = new MultipartRequest(
              request,
              realFolder,
              maxSize,
              encType,
              new DefaultFileRenamePolicy()
          );

        Enumeration en = multi.getParameterNames();
        while(en.hasMoreElements()){
            String name=(String)en.nextElement();
            String value=multi.getParameter(name);
            out.print("<br>" + name + " : "+ value);
        }
        out.print("<br>");
        
        en=multi.getFileNames();
        while(en.hasMoreElements()){

            String name=(String)en.nextElement();

            String originFile=multi.getOriginalFileName(name);

            String systemFile=multi.getFilesystemName(name);

            String fileType=multi.getContentType(name);

            File file=multi.getFile(name);

            out.println("파라미터 이름 : "+ name + "<br>");
            out.println("원본 이름 : "+ originFile + "<br>");
            out.println("시스템 이름 : "+ systemFile + "<br>");
            out.println("파일 타입 이름 : "+ fileType + "<br>");

            if(file!=null){
                out.println("크기 : " + file.length() + "byte" + "<br>");
            }
        }
      } catch(Exception e){
          out.println("파일 처리간 문제 발생");
      }
       %>
    </body>

</html>