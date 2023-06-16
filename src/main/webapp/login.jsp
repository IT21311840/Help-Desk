<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="Style/home.css">
<link rel="stylesheet" href="Style/theme.css">
<link rel="stylesheet" href="Style/sign in.css">

<title>Sign in page</title>
</head>
<body>

<header>
        <div class="row header" style="color:white">
            <h1>Whee!</h1>
        </div>
    </header>
<div class="bg-image"></div>
  <div class="bg-img">
  
  	<form class="bg-text" action="user" method="post">
	    <h1>Sign In</h1>
	    
	    <input type="text" placeholder="Email" name="email" required>
	    <input type="password"placeholder="Password" name="password" required>
	    <div class="pass">
	      <p>Don't have an account yet?<a href="signup.jsp" style="color:grey"> Register</a></p>
	    </div>
	    <button type="submit" class="btn">Login</button>
    </form>
    
  </div>




</body>
</html>