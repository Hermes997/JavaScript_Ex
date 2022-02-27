<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Signin Template · Bootstrap v5.0</title>
    <script src="jquery-3.5.1.min.js" type="text/javascript"></script>
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
 

    
    <!-- Custom styles for this template -->
    <link href="/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
 
<main class="form-signin">
    <div>
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <label for="inputEmail" class="visually-hidden">Email address</label>
        <input type="email" id="email_id" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="visually-hidden">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="window.location.href='home.jsp'">Sign in</button>
        <p></p>
        <button class="w-100 btn btn-lg btn-secondary" type="submit" onclick="window.location.href='signup.jsp'">Sign up</button>
        <p></p>
        <button class="w-100 btn btn-lg btn-info" type="submit" onclick="window.location.href='home.jsp'">Back to Home</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
    </div>
</main>
 
 
    
  </body>
</html>