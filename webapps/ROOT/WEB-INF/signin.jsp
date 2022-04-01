<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.79.0">
    <title>Envir_Astro</title>
    <script src="js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/background.css" rel="stylesheet">
    <link href="css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
 


<main class="form-signin">
    <div>
      <form action="ps-check">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <label for="inputEmail" class="visually-hidden">Email address</label>
        <input type="email" id="userID" name="userID" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="visually-hidden">Password</label>
        <input type="password" id="userPassword" name="userPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> Remember me
        </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        <p></p>
        <button class="w-100 btn btn-lg btn-secondary" type="submit" onclick="window.location.href='welcome'">Sign up</button>
        <p></p>
        <button class="w-100 btn btn-lg btn-info" type="submit" onclick="window.location.href='main'">Back to Home</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p>
      </form>
    </div>
</main>
 
 
    
  </body>
</html>