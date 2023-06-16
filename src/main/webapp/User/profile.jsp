<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
li form a{
margin-top:10px;
}
</style>
<script type="text/javascript">
        
        	function submitFunction() {
        		document.getElementById("tickets").submit() ;
        	}
        	function submitFunctionIndex() {
        		document.getElementById("index").submit() ;
        	}
        	function submitFunctionAgent() {
        		document.getElementById("agent").submit();
        	}
        	function submitFunctionLogout() {
        		document.getElementById("logout").submit();
        	}
        	function submitFunctionProfile() {
        		document.getElementById("prof").submit();
        	}
        	function submitFunctionAdmin() {
        		document.getElementById("admin").submit();
        	}
        	function submitFunctionLogout() {
        		document.getElementById("logout").submit();
        	}
        	
        </script>
	
	
 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="Style/home.css">
        <link rel="stylesheet" href="Style/theme.css">
        <link rel="stylesheet" href="Style/profile.css">
        <link rel="stylesheet" href="Style/footer.css">
        
        
        
<title>Profile</title>
</head>
<body>


<header>

            <div class="row header">
                <h1>Whee!</h1>
            </div>
</header>

<%      
try {
        int id = (int) session.getAttribute("uid");
        String utype = (String) session.getAttribute("type");
        String name = (String) session.getAttribute("name");
        
        //int count = (int)request.getAttribute("counts");
       // int countp = (int)request.getAttribute("countp");
        
 %>


        <div class="container-fluid">

            <div class="row">

                <nav class="navbar navbar-expand-sm  navigation">
                    <ul class="navbar-nav">
                      <li class="nav-item ">
                      	<form action="user" method="post" id="index">
                        	<a  class="nav-link" href="home.jsp" onclick="">Home</a>
                        </form>
                      </li>
                      <li class="nav-item ">
                      
                      	<form id="tickets" action="display" method="get">
                      		
	                        <a style="" class="nav-link" href="#" onclick="submitFunction()" >My Tickets</a>
                      	</form>
                      	
                      </li>
                      <li class="nav-item ">
                        <a class="nav-link" href="index.jsp#aboutus">About us</a>
                      </li>
                      <li class="nav-item ">
						<form id="prof" action="profile" method="get">
							<a style="color: black; font-weight: bold;" class="nav-link"
								href="#" onclick="submitFunctionProfile()">Profile</a>
						</form>
						</li>
                       <%
					   if (utype.equals("agent")) {
					   %>
					   <li class="nav-item ">
						 <form id="agent" action="agent" method="get">
							<a class="nav-link"
								href="#" onclick="submitFunctionAgent()">Agent</a>
						
						</form>
					   </li>
					   <%
					   }
					   if (utype.equals("admin")) {
					   %>
					   <li class="nav-item ">
						 <form id="admin" action="" method="get">
							<a class="nav-link"
								href="Admin/admin.jsp">Admin</a>
						
						</form>
					   </li>
					   <%
					   }
					   %>
					   
					    <li class="nav-item " >
                        <a  class="nav-link" href="User/raiseTicket.jsp">RAISE A TICKET</a>
                      </li>
                      <li class="nav-item " style="margin-left: 900px;">
						<form id="logout" action="logout" method="get" >
							<a class="nav-link"
								href="#" onclick="submitFunctionLogout()">Log out</a>
						</form>
					</li>
                    </ul>
                  </nav>
        
                 
            </div>
            
            <%
                       
                		
            %>
            
            <div class="row content">
            
                <div class="row coloumn1" style="width:100%">
                        <div class="col-5"></div>
                        <div class="col-4 ">
                          <img src="Images/profile.png" alt=""  class="image"  >
                        </div>
                        <div class="col-3"></div>                        
                      </div>
                   
                      <div class="row" style="width:100%">
                        <div class="col-md-4"></div>
                        
                        
                        <div class="container">
                          
                          <c:forEach var="usr" items="${userinfo}">
                          <form class="form-horizontal" action="dltprofile" method="get">
                            <div class="form-group">
                              <label class="control-label col-sm-2" for="fname">First name:</label>
                              <div class="col-sm-4">          
                                <input type="text" class="form-control" id="fname"  name="fname" value="${usr.firstName}" readonly>
                              </div>
                              <label class="control-label col-sm-2" for="lname">Last name:</label>
                              <div class="col-sm-4">          
                                <input type="text" class="form-control" id="lname"  name="lname" value="${usr.lastName}" readonly>
                              </div>
                            </div>
                            
                            
                            <div class="form-group">
                              <label class="control-label col-sm-2" for="mail">E-mail:</label>
                              <div class="col-sm-10">          
                                <input type="text" class="form-control" id="mail"  name="mail" value="${usr.email }" readonly>
                              </div>
                            </div>
                            
                            <div class="form-group">
                              <label class="control-label col-sm-2" for="pwd">Password:</label>
                              <div class="col-sm-10">          
                                <input type="password" class="form-control" id="pwd"  name="pwd" value="${usr.password }" readonly>
                              </div>
                            </div>
                            <div class="form-group">
                              
                              <div class="col-sm-2"> 
                              <!--  <input type="text" class="form-control" id="pt"  name="pt" value="" readonly> 
                                      <label class="control-label col-sm-2" for="pt">Pending tickets:</label>
                                      -->
                              </div>
                              
                              <div class="col-sm-2"> 
                              <!-- 
                              <label class="control-label col-sm-2" for="st">Solved tickets:</label>
                                <input type="text" class="form-control" id="st"  name="st" value ="" readonly>
                               -->         
                              </div>
                            </div>

                            <div class="form-group">        
                              <div class="col-sm-offset-2 col-sm-10">
	                              
	                                  <button type="submit" class="btn btn-outline-primary">Delete profile</button>
	                             
                              </div>
                            </div>
                          </form>
                          </c:forEach>
                        </div>
            
            </div>
            </div>

                    
     

        <footer class="site-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-6">
          <h6>About</h6>
          <p class="text-justify">Whee stands for "we help for eternal education".Today's schools, colleges and universities are faced with a unique set of challenges. Ensuring departments remain efficient, effective and within budget whilst handling a multitude of complex support issues is no easy task - until now.
            Our helpdesk software for education brings together all your support requests into a single, intuitive interface - regardless of whether it's  by raising ticket. With whee, you can effortlessly create the ultimate helpdesk for both staff and students.</p>
        </div>
        <div class="col-xs-6 col-md-3">
          <h6>Quick Links</h6>
          <ul class="footer-links">
            <li><a href="#">About Us</a></li>
            <li><a href="#">FAQs</a></li>
            <li><a href="#">Terms and Conditions</a></li>
            <li><a href="#">My Tickets</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Raise a Ticket</a></li>
          </ul>
        </div>
      </div>
      <hr>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-8 col-sm-6 col-xs-12">
          <p class="copyright-text">Copyright &copy; 2017 All Rights Reserved by 
       <a href="home.html">Whee!</a>
          </p>
        </div>

        <div class="col-md-4 col-sm-6 col-xs-12">
          <ul class="social-icons">
            <li><a class="facebook" href="https://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
            <li><a class="twitter" href="https://twitter.com"><i class="fa fa-twitter"></i></a></li>
            <li><a class="dribbble" href="https://dribbble.com"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="linkedin" href="https://www.linkedin.com/feed/"><i class="fa fa-linkedin"></i></a></li>   
          </ul>
        </div>
      </div>
    </div>
</footer>

        <%
}

catch (NullPointerException e) {
	response.sendRedirect("../login.jsp") ;
}
        %>
      
</body>
</html>