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
    <link href="css/home.css" rel="stylesheet">
    
    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair&#43;Display:700,900" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/blog.css" rel="stylesheet">
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
              "<a class=\"btn btn-sm btn-outline-success\" id=\"userInformation\" href=\"#\" style=\"margin: 5px\"> " + userNickname + " </a>" +
              "\n<a class=\"btn btn-sm btn-outline-secondary\" id=\"logoutset\" href=\"logout_action.jsp\" style=\"margin: 5px\"> " + "Log out" + " </a>"
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
      <a class="col-4" href="https://github.com/Hermes997/JavaScript_Ex">Github</a>
      <a class="col-4" href="list">Environment</a>
      <a class="col-4" href="#">Astronomy</a>
    </nav>
  </div>


  
  <section class="mainArea">
    
    <img class="img-fluid rounded pb-2" style="opacity:0.9;" src="designimage/background.jpg" alt="배경">
    <div>
      <div class="backgroundText"> <p>Make your world</p> </div>
      <a href="#"><img class="earthIcon1" src="designimage/premium-icon-camelopardalis-3981990.png" alt="아이콘"></a>
      <a href="#"><img class="earthIcon2" src="designimage/premium-icon-sculptor-3982225.png" alt="아이콘"></a>
      <a href="#"><img class="earthIcon3" src="designimage/premium-icon-crux-3982223.png" alt="아이콘"></a>
      <a href="#"><img class="earthIcon4" src="designimage/premium-icon-vela-3982224.png" alt="아이콘"></a>
      <a href="#"><img class="earthIcon5" src="designimage/premium-icon-cassiopeia-3981982.png" alt="아이콘"></a>
      <a href="#"><img class="earthIcon6" src="designimage/free-icon-big-dipper-3981967.png" alt="아이콘"></a>
    </div>
    
  </section>

  <div class="row mb-2">
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">Environment</strong>
          <%
          String query = "SELECT * FROM post ORDER BY postID DESC LIMIT 1";
          stmt = con.createStatement();
          rs = stmt.executeQuery(query);
          rs.next();
          imageCount = rs.getInt("imageCount");
          if(imageCount > 0) {
            uploadedImage = rs.getString("imageNames");
            uploadedImageList = uploadedImage.split("\\*");
          }
          
          %>
          <h3 class="mb-0"><%= rs.getString("title") %></h3>
          <div class="mb-1 text-muted"><%= rs.getString("uploadDate") %></div>
          <p class="card-text mb-auto"><%= rs.getString("contents") %></p>
          <a href="#" class="stretched-link"><%= rs.getString("userNickname") %></a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img class="bd-placeholder-img" src=
          

          <%
          if(imageCount > 0) {
            out.println("\"" + rs.getString("imageDir") + "/" + uploadedImageList[imageCount - 1] + "\"");
          } else {
            out.println("\"" + "\"");
          }

          %>
          
           width="200" height="250" focusable="false">

        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">Design</strong>
          <h3 class="mb-0">Post title</h3>
          <div class="mb-1 text-muted">Nov 11</div>
          <p class="mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
          <a href="#" class="stretched-link">Continue reading</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

        </div>
      </div>
    </div>
  </div>
</div>

<main role="main" class="container">
  <div class="row">
    <div class="col-md-8 blog-main">
      <h3 class="pb-4 mb-4 font-italic border-bottom">
        From the Firehose
      </h3>

      <div class="blog-post">
        <h2 class="blog-post-title">Sample blog post</h2>
        <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

        <p>This blog post shows a few different types of content that’s supported and styled with Bootstrap. Basic typography, images, and code are all supported.</p>
        <hr>
        <p>Yeah, she dances to her own beat. Oh, no. You could've been the greatest. 'Cause, baby, <a href="#">you're a firework</a>. Maybe a reason why all the doors are closed. Open up your heart and just let it begin. So très chic, yeah, she's a classic.</p>
        <blockquote>
          <p>Bikinis, zucchinis, Martinis, no weenies. I know there will be sacrifice but that's the price. <strong>This is how we do it</strong>. I'm not sticking around to watch you go down. You think you're so rock and roll, but you're really just a joke. I know one spark will shock the world, yeah yeah. Can't replace you with a million rings.</p>
        </blockquote>
        <p>Trying to connect the dots, don't know what to tell my boss. Before you met me I was alright but things were kinda heavy. You just gotta ignite the light and let it shine. Glitter all over the room <em>pink flamingos</em> in the pool. </p>
        <h2>Heading</h2>
        <p>Suiting up for my crowning battle. If you only knew what the future holds. Bring the beat back. Peach-pink lips, yeah, everybody stares.</p>
        <h3>Sub-heading</h3>
        <p>You give a hundred reasons why, and you say you're really gonna try. Straight stuntin' yeah we do it like that. Calling out my name. ‘Cause I, I’m capable of anything.</p>
        <pre><code>Example code block</code></pre>
        <p>Before you met me I was alright but things were kinda heavy. You just gotta ignite the light and let it shine.</p>
        <h3>Sub-heading</h3>
        <p>You got the finest architecture. Passport stamps, she's cosmopolitan. Fine, fresh, fierce, we got it on lock. Never planned that one day I'd be losing you. She eats your heart out.</p>
        <ul>
          <li>Got a motel and built a fort out of sheets.</li>
          <li>Your kiss is cosmic, every move is magic.</li>
          <li>Suiting up for my crowning battle.</li>
        </ul>
        <p>Takes you miles high, so high, 'cause she’s got that one international smile.</p>
        <ol>
          <li>Scared to rock the boat and make a mess.</li>
          <li>I could have rewrite your addiction.</li>
          <li>I know you get me so I let my walls come down.</li>
        </ol>
        <p>After a hurricane comes a rainbow.</p>
      </div><!-- /.blog-post -->

      <div class="blog-post">
        <h2 class="blog-post-title">Another blog post</h2>
        <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>

        <p>I am ready for the road less traveled. Already <a href="#">brushing off the dust</a>. Yeah, you're lucky if you're on her plane. I used to bite my tongue and hold my breath. Uh, She’s a beast. I call her Karma (come back). Black ray-bans, you know she's with the band. I can't sleep let's run away and don't ever look back, don't ever look back.</p>
        <blockquote>
          <p>Growing fast into a <strong>bolt of lightning</strong>. Be careful Try not to lead her on</p>
        </blockquote>
        <p>I'm intrigued, for a peek, heard it's fascinating. Oh oh! Wanna be a victim ready for abduction. She's got that international smile, oh yeah, she's got that one international smile. Do you ever feel, feel so paper thin. I’m gon’ put her in a coma. Sun-kissed skin so hot we'll melt your popsicle.</p>
        <p>This is transcendental, on another level, boy, you're my lucky star.</p>
      </div><!-- /.blog-post -->

      <div class="blog-post">
        <h2 class="blog-post-title">New feature</h2>
        <p class="blog-post-meta">December 14, 2013 by <a href="#">Chris</a></p>

        <p>From Tokyo to Mexico, to Rio. Yeah, you take me to utopia. I'm walking on air. We'd make out in your Mustang to Radiohead. I mean the ones, I mean like she's the one. Sun-kissed skin so hot we'll melt your popsicle. Slow cooking pancakes for my boy, still up, still fresh as a Daisy.</p>
        <ul>
          <li>I hope you got a healthy appetite.</li>
          <li>You're never gonna be unsatisfied.</li>
          <li>Got a motel and built a fort out of sheets.</li>
        </ul>
        <p>Don't need apologies. Boy, you're an alien your touch so foreign, it's <em>supernatural</em>, extraterrestrial. Talk about our future like we had a clue. I can feel a phoenix inside of me.</p>
      </div><!-- /.blog-post -->

      <nav class="blog-pagination">
        <a class="btn btn-outline-primary" href="#">Older</a>
        <a class="btn btn-outline-secondary disabled">Newer</a>
      </nav>

    </div><!-- /.blog-main -->

    <aside class="col-md-4 blog-sidebar">
      <div class="p-4 mb-3 bg-light rounded">
        <h4 class="font-italic">About</h4>
       </div>

      <div class="p-4">
        <h4 class="font-italic">Archives</h4>
        <ol class="list-unstyled mb-0">
          <li><a href="#">March 2014</a></li>
          <li><a href="#">February 2014</a></li>
          <li><a href="#">January 2014</a></li>
          <li><a href="#">December 2013</a></li>
          <li><a href="#">November 2013</a></li>
          <li><a href="#">October 2013</a></li>
          <li><a href="#">September 2013</a></li>
          <li><a href="#">August 2013</a></li>
          <li><a href="#">July 2013</a></li>
          <li><a href="#">June 2013</a></li>
          <li><a href="#">May 2013</a></li>
          <li><a href="#">April 2013</a></li>
        </ol>
      </div>

      <div class="p-4">
        <h4 class="font-italic">Elsewhere</h4>
        <ol class="list-unstyled">
          <li><a href="#">GitHub</a></li>
          <li><a href="#">Twitter</a></li>
          <li><a href="#">Facebook</a></li>
        </ol>
      </div>
    </aside><!-- /.blog-sidebar -->

  </div><!-- /.row -->

</main><!-- /.container -->

<footer class="blog-footer">
  <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a href="https://twitter.com/mdo">@mdo</a>.</p>
  <p>
    <a href="#">Back to top</a>
  </p>
</footer>


    
  </body>
  <script type="text/javascript" src="home.js"></script>
</html>
