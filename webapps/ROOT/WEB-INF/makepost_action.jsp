<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="org.apache.commons.fileupload.FileItem"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="DataJava.DBconnect" %>


<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<html lang="ko">

  <head>

  </head>

    <body>
      <%
      DBconnect dbcon = new DBconnect();
      Connection con = dbcon.getConnection();
      Statement stmt = null;
      PreparedStatement pst = null;
      ResultSet rs = null;
    
      long miliseconds = System.currentTimeMillis();
      SimpleDateFormat dformat1 = new SimpleDateFormat("yyyyMMdd");
      SimpleDateFormat dformat2 = new SimpleDateFormat("HHmmss");
      java.sql.Date now = new java.sql.Date(miliseconds);
      String strDate1 = dformat1.format(now);
      String strDate2 = dformat2.format(now);
      String strDate3 = strDate1 + strDate2;

      String userID = (String) session.getAttribute("userID");
      String userPassword = (String) session.getAttribute("userPassword");
      String userNickname = (String) session.getAttribute("userNickname");
      String userDate = (String) session.getAttribute("userDate");

      if(userID == null){
        try {
          
            script.println("<script>");
            script.println("alert('you need to signin')");
            script.println("history.back()");
            script.println("</script>");
            
          } catch (Exception e) {
                e.printStackTrace();
          }
      }

      String title = "";
      String contents = "";
      int imageCount = 0;
      boolean tcFlag = false;
      String imageNames="";
      String realFolder="";

      String saveFolder="contentsfile/environment/" + strDate1 + "/" + strDate2 + "/" + userID;
      String encType="utf-8";
      int DiskmaxSize=500*1024*1024;
      int maxSize=50*1024*1024;

      ServletContext context=this.getServletContext();
      realFolder = context.getRealPath(saveFolder);
      out.println("?????? : " + realFolder);
      File dir = new File(realFolder);
      if(!dir.exists()){
          dir.mkdirs();
      }


      PrintWriter script = response.getWriter();
      String sql = null;
      try{
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(DiskmaxSize);
        factory.setRepository(new File(realFolder));

        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxSize);
        upload.setHeaderEncoding("utf-8");
        List<FileItem> items = upload.parseRequest(request);
        
        for(FileItem item:items) {
          if (item.isFormField()) { // processFormField
            if(tcFlag == false){
              tcFlag = true;
              title = item.getString("utf-8");
            } else {
              contents = item.getString("utf-8");
            }
          } else {
            if( item.getSize() > 0) {
              String filename = item.getName();
              File uploadFile = new File(realFolder + "/" + filename);
              imageNames = imageNames + filename + "*";
              item.write(uploadFile);
              imageCount++;
            }
          }
        }

        sql = "INSERT INTO post(userID, title, contents, userNickname, uploadDate, imageCount, imageDir, imageNames) VALUES (?,?,?,?,?,?,?,?)";
        pst = con.prepareStatement(sql);
        pst.setString(1, userID);
        pst.setString(2, title);
        pst.setString(3, contents);
        pst.setString(4, userNickname);
        pst.setString(5, strDate3);
        pst.setInt(6, imageCount);
        pst.setString(7, saveFolder);
        pst.setString(8, imageNames);
        pst.executeUpdate();
        if(pst != null) try { pst.close(); } catch(SQLException ex) {}
        if(con != null) try { con.close(); } catch(SQLException ex) {}

        script.println("<script>");
        script.println("alert('post complete')");
        script.println("history.back()");
        script.println("</script>");
      } catch(Exception e){
        script.println("<script>");
        script.println("alert('fail to process fileupload ')");
        script.println("history.back()");
        script.println("</script>");
        out.println(userID + title + contents + userNickname + strDate3 + imageCount + realFolder);
      }
       %>
    </body>

</html>