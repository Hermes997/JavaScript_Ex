<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*"%>
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
    <link href="css/makepost.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/home.js"></script>
    <script type="text/javascript" src="js/makepost.js"></script>
    
  </head>

  <body>
  <%
  Connection con = null; // DBMS와 Java연결객체
  Statement stmt = null; // SQL구문을 실행
  ResultSet rs = null; // SQL구문의 실행결과를 저장
  PreparedStatement pst = null;

  Class.forName("org.mariadb.jdbc.Driver");
  try { 
  String dbURL = "jdbc:mariadb://218.158.10.116:3306/mysql"; 
  String dbID = "cus"; 
  String dbPassword = "password"; 

  con = DriverManager.getConnection(dbURL, dbID, dbPassword);
  } catch (Exception e) { 
      e.printStackTrace();
  }

  String userID = (String) session.getAttribute("userID");
  String userPassword = (String) session.getAttribute("userPassword");
  String userNickname = (String) session.getAttribute("userNickname");
  String userDate = (String) session.getAttribute("userDate");
  PrintWriter script = response.getWriter();
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
        <a class="blog-header-logo text-dark" href="#">Envir_Astro</a>
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
        
        <%=
          "<p name=\"userID\">" + userID + "</p>"
        %>
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

  <form action="makepost_action.jsp" method="post" enctype="Multipart/form-data">   
  <div class="container">
  <div class="row">
        <h2 class="col-8 mt-5 mb-3">Environment</h2>
        <div class="col-4 mt-5">
        <div class="row">
        <div class="col-12 d-flex justify-content-end">
            <button class="btn btn-sm btn-outline-success" type="summit" style="margin: 5px"> Uploade </button>
        </div>
        </div>
        </div>
  </div>
     
  <div class="container" style="height=800px;">
    <div class="input-group mb-3">
    <span class="input-group-text" id="makepostTitle">Title</span>
    <textarea class="form-control" id="makepostTitleArea" name="title" rows="1" style="width:100%;" aria-label="With textarea"></textarea>
    </div>

    <div class="input-group">
    <span class="input-group-text" id="makepostContents">Contents</span>
    <textarea class="form-control" id="makepostContentsArea" name="contents" rows="13" style="width:100%;height:100%;" aria-label="With textarea"></textarea>
    </div>

    
    <div class="custom-file">
        <input type="file" class="custom-file-input" id="customFile" name="file" multiple="multiple" accept="image/*" onchange="loadFile(this)">
        <label class="custom-file-label" id="fileListText" for="customFile" style="background-color: rgb(237,235,255);">
          <p id="fileName">Input File : </p>
        </label>
    </div>
  </form>

    
  </div>


</html>

