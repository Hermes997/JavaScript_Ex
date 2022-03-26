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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>



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
      String postID = request.getParameter("postID");
      session.setAttribute("postID", postID);

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
              "<a class=\"btn btn-sm btn-outline-secondary\" id=\"logoutset\" href=\"logout_action.jsp\" style=\"margin: 5px\"> " + "Log out" + " </a>"
        %>
        <%
            } else {

        %>
        <%=   
              "<a class=\"btn btn-sm btn-outline-primary\" id=\"signin\" href=\"signin.jsp\" style=\"margin: 5px\"> Sign in </a>" + 
              "\n<a class=\"btn btn-sm btn-outline-secondary\" id=\"signup\" href=\"signup.jsp\" style=\"margin: 5px\"> Sign up </a>"

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
      <a class="col-4" href="post.jsp">Environment</a>
      <a class="col-4" href="#">Astronomy</a>
    </nav>
  </div>

  <div class="container">
  <div class="row">
        <h2 class="col-8 mt-5 mb-3">Environment</h2>
        <div class="col-4 mt-5">

        </div>
        
        <%
        String query = "SELECT * FROM post WHERE postID=" + request.getParameter("postID") + " LIMIT 1";
        stmt = con.createStatement();
        rs = stmt.executeQuery(query);
        rs.next();
        imageCount = rs.getInt("imageCount");
        if(imageCount > 0) {
          uploadedImage = rs.getString("imageNames");
          uploadedImageList = uploadedImage.split("\\*");
        }
        

        %>
        <h3 class="col-12"><%= rs.getString("title") %></h3>
        <div id="demo" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-indicators">
            <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#demo" data-bs-slide-to="2" aria-label="Slide 3"></button>
          </div>
          <div class="carousel-inner">
        <%
      
        if(imageCount > 0) {
        for(int i=imageCount; i>0; i--){
          if(i==imageCount) {
            out.println("<div class='carousel-item active'>");
          } else {
            out.println("<div class='carousel-item'>");
          }
          
          out.println("<img src='" + rs.getString("imageDir") + "/" + uploadedImageList[i - 1] + "'" + " class='d-block w-100'" + " alt='slide" + String.valueOf(i) + "'>");
          out.println("</div>");
        }
        } else {
        }
        %>
        </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
          </button>
        </div>

        <h5 class="col-12"><%= rs.getString("contents") %></h5> 
        <div class="col-12">
          <form action="comments_action.jsp" method="post">   
            <div class="container">
            <div class="row">
                  <h2 class="col-8 mt-5 mb-3">Comments</h2>
                  <div class="col-4 mt-5">
                  <div class="row">
                  <div class="col-12 d-flex justify-content-end">
                      <button class="btn btn-sm btn-outline-success" type="summit" style="margin: 5px"> Uploade </button>
                  </div>
                  </div>
                  </div>
            </div>
              
            
            <div class="row">
              <div class="col-12 mt-5">
                <div class="input-group">
                <span class="input-group-text" id="makeComments">Contents</span>
                <textarea class="form-control" id="makeCommnetsArea" name="commentContents" rows="3" style="width:100%;height:100%;" aria-label="With textarea"></textarea>
                </div>
              </div>
            </div>
          </form>
        </div>

        <div class="col-12">
          <div class="table-responsive">
          <table class="table table-striped table-sm">

          <%
          try {
            query = "SELECT * FROM comments where postID=" + postID + " ORDER BY commentsID";
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
          
            while(rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("commentsID") %></td>
                <td><%= rs.getString("userNickname") %></td>
                <td><%= rs.getString("userID") %></td>
                <td><%= rs.getString("contents") %></td>
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
        </div>
        </div>
        </div>

  </div>
  </div>



  


</div>



</body>
</html>