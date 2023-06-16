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
    <link rel="stylesheet" href="Style/sign up.css">
    <link rel="stylesheet" href="Style/tickets.css">
<title>Sign Up</title>
</head>
<body>

<header>
            <div class="row header"  style=" z-index: +1;">
                <h1>Whee!</h1>
            </div>
        </header>
        

<div class="bg-image" style=" z-index: 0;">
	<form class="bg-text1" action="reg" method="post">
	    <h1>Sign Up</h1>
	    <p>Please fill this form to create an account.</p>
	    <input type="text" placeholder="firstName" name="fname" required>
	
	    <input type="text" placeholder="lastName" name="lname" required>
	    
	    <input type="text" placeholder="userName" name="uname" required>
	
	    <input type="text" placeholder="Email" name="email" required>
	
	    <input type="password" placeholder="Password" name="password" required>
	
	    <input type="password" placeholder="Repeat Password" name="pswrepeat" required>
	    
	    <div class="remember">
	      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
	    </div>
	    <div class= "terms">
	    <p>By creating an account you agree to our <a href="#terms-cond" style="color:rgb(255, 30, 30)">Terms & Privacy</a>.</p>
		</div>
	    <div class="clearfix">
	    
	    	<a href="login.jsp">
	    		<button type="button" class="cancelbtn">Cancel</button>
	    	</a>  
	      <button type="submit" class="signupbtn">Sign Up</button>
	    </div>
	</form>
</div>
  
<footer class="footer">
    <h6>Follow us on facebook</h6>
    <h6>Follow me on Instagram @t_h_a_n_i_s_h</h6>
    <h6>twitter</h6>
</footer>
 

</body>
</html>