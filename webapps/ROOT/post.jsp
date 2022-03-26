<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
<%@ page import="DataJava.DBconnect" %>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Envir_Astro</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/blog/">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">
    <link href="css/blog.css" rel="stylesheet">
    <!-- Custom styles for this template -->

    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/home.js"></script>
  </head>
  <body>
    <%
        DBconnect dbcon = new DBconnect();
        Connection con = dbcon.getConnection();
        Statement stmt = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        String userID = (String) session.getAttribute("userID");
        String userPassword = (String) session.getAttribute("userPassword");
        String userNickname = (String) session.getAttribute("userNickname");
        String userDate = (String) session.getAttribute("userDate");
        PrintWriter script = response.getWriter();
        int imageCount = 0;
        String uploadedImage = null;
        String [] uploadedImageList = null;
    %>

<div class="container">
  <header class="blog-header py-3">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-1 pt-1">
        <a id = "lan1" href="#"> English</a>
      </div>
      <div class="col-1 pt-1">
        <a id = "lan2" href="#"> Korean </a>
      </div>
      <div class="col-1 pt-1">
        <a id = "lan3" href="#"> Japanese </a>
      </div>

      <div class="col-6 text-center">
        <a class="blog-header-logo text-dark" href="main">Envir_Astro</a>
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
        <%
          try {
            
            if(userID != null) {
        %>
        <%=
              "<a class=\"btn btn-sm btn-outline-success\" id=\"userInfomation\" href=\"#\" style=\"margin: 5px\"> " + userNickname + " </a>" +
              "<a class=\"btn btn-sm btn-outline-secondary\" id=\"logoutset\" href=\"ps-checkout\" style=\"margin: 5px\"> " + "Log out" + " </a>"
        %>
        <%
            } else {

        %>
        <%=   
              "<a class=\"btn btn-sm btn-outline-primary\" id=\"signin\" href=\"check\" style=\"margin: 5px\"> Sign in </a>" + 
              "\n<a class=\"btn btn-sm btn-outline-secondary\" id=\"signup\" href=\"welcome\" style=\"margin: 5px\"> Sign up </a>"

        %>
        <%
            }
          } catch(Exception e) {
            e.printStackTrace();
          }

        %>

      </div>
    </div>
  </header>


  <div class="nav-scroller py-1">
    <nav class="text-center">
      <a class="col-4" href="#">World</a>
      <a class="col-4" href="list">Environment</a>
      <a class="col-4" href="#">Astronomy</a>
    </nav>
  </div>

  <div class="container">
  <div class="row">
        <h2 class="col-8 mt-5 mb-3">Environment</h2>
        <div class="col-4 mt-5">
        <div class="row">
        <div class="col-12 d-flex justify-content-end">
        <a class="btn btn-sm btn-outline-primary" id="makepost" href="fill" style="margin: 5px"> New </a>
        </div>
        </div>
        </div>
  </div>


<div class="table-responsive">
  <table class="table table-striped table-sm">
    <thead>
      <tr>
        <th>Picture</th>
        <th>PostID</th>
        <th>Nickname</th>
        <th>Title</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
    <%
    try {
      String query = "SELECT * FROM post ORDER BY postID DESC";
      stmt = con.createStatement();
      rs = stmt.executeQuery(query);

      while(rs.next()) {
      %>
      <tr>
          <td><img src=
          <%
          imageCount = rs.getInt("imageCount");
          if(imageCount > 0) {
            uploadedImage = rs.getString("imageNames");
            uploadedImageList = uploadedImage.split("\\*");
          }
          
          %>
          <%
          if(imageCount > 0) {
            out.println("\"" + rs.getString("imageDir") + "/" + uploadedImageList[imageCount - 1] + "\"");
          } else {
            out.println("\"" + "\"");
          }

          %>
           class="img-thumbnail" width="50" height="50" alt="..."></td>
          <td><%= rs.getString("postID") %></td>
          <td><%= rs.getString("userNickname") %></td>
          <td><% out.print("<a href='view?postID=" + rs.getString("postID") + "'>" + rs.getString("title") + "</a>"); %></td>
          <td><%= rs.getString("uploadDate") %></td>
      </tr>
      <%
      }
    }catch(SQLException ex){
          out.println(ex.getMessage());
          ex.printStackTrace();
    }finally{
          if(rs != null) try { rs.close(); } catch(SQLException ex) {}
          if(stmt != null) try { stmt.close(); } catch(SQLException ex) {}
          if(con != null) try { con.close(); } catch(SQLException ex) {}
    }
%>


    </tbody>
  </table>
</div>


</div>




<footer class="blog-footer">
  <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
  <p>
    <a href="#">Back to top</a>
  </p>
</footer>


    
  </body>

</html>
