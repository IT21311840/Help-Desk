<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="User.Ticket"%>
<%@page import="User.userDBUtil"%>
<%@page import="User.User"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">

<link rel="stylesheet" href="Style/home.css">
<link rel="stylesheet" href="Style/theme.css">
<link rel="stylesheet" href="Style/footer.css">

<script type="text/javascript">
	function submitFunction() {
		document.getElementById("tickets").submit();
	}
	
	function submitFunctionLogout() {
		document.getElementById("logout").submit();
	}
	
	function submitFunctionAgent() {
		document.getElementById("agent").submit();
	}
	
	function submitFunctionAdmin() {
		document.getElementById("admin").submit();
	}
	function submitFunctionProfile() {
		document.getElementById("prof").submit();
	}
</script>
<%
//HttpSession session =request.getSession(); 
//session.setAttribute("uid", 1) ;
//session.removeAttribute("uid") ;
try{
	
		//ArrayList<User> user = (ArrayList<User>) request.getAttribute("userInfo");

		int id;
		String utype;
		String name ;
		String eml ;

		//for (User u : user) {

			//String fname = u.getFirstName();
			//String lname = u.getLastName();
			//int uid = u.getUserId();
			//String type = u.getType();
			//String email = u.getEmail();
			
			//HttpSession session =request.getSession();
			//session.setAttribute("uid", u.getUserId());
			//session.setAttribute("type", u.getType());
			//session.setAttribute("name", u.getFirstName());
			//session.setAttribute("email", u.getEmail());

		//}
		
		id = (int) session.getAttribute("uid");
		utype = (String) session.getAttribute("type");
		name = (String) session.getAttribute("name");
		eml = (String) session.getAttribute("email");
		
		
		//session.setAttribute("uid", id);
		//session.setAttribute("type", utype);
		//session.setAttribute("name", name);
		//session.setAttribute("email", eml);
		
		if( session.getAttribute("uid") == null){		
			
			response.sendRedirect("home.jsp") ;
		}
		else {


		
//ArrayList<User> user = (ArrayList<User>) request.getAttribute("userInfo");

//int id;
//String utype;
//String name ;

//for (User u : user) {

	//String fname = u.getFirstName();
	//String lname = u.getLastName();
	//int uid = u.getUserId();
	//String type = u.getType();
	//String email = u.getEmail();

	//session.setAttribute("uid", u.getUserId());
	//session.setAttribute("type", u.getType());
	//session.setAttribute("name", u.getFirstName());

	

//}

id = (int) session.getAttribute("uid");
utype = (String) session.getAttribute("type");
name = (String) session.getAttribute("name");


%>






<title>Home page</title>
</head>
<body>

	<header>

		<div class="row header">
			<h1>Whee!</h1>
		</div>
	</header>


	<div class="container-fluid">

		<div class="row">

			<nav class="navbar navbar-expand-sm  navigation">
				<ul class="navbar-nav">

					<li class="nav-item "><a
						style="color: black; font-weight: bold;" class="nav-link" href="#">Home</a>
					</li>
					
					<li class="nav-item ">
						<form id="tickets" action="display" method="get">
							<a class="nav-link" href="#" onclick="submitFunction()">My
								Tickets</a>
						</form>
					</li>
					
					<li class="nav-item "><a class="nav-link" href="#aboutUs">About
							us</a></li>
					<li class="nav-item ">
						<form id="prof" action="profile" method="get">
							<a class="nav-link"
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
						<form id="admin" action="adminAgent" method="get">
						<input type="hidden" name="type" value="agent">
							<a class="nav-link"
								href="#" onclick="submitFunctionAdmin()">Admin</a>
						
						</form>
					</li>
					<%
					}
					%>
					<li class="nav-item " style="margin-left: 1000px;">
						<form id="logout" action="logout" method="get" >
							<a class="nav-link"
								href="#" onclick="submitFunctionLogout()">Log out</a>
						</form>
					</li>

				</ul>
			</nav>


		</div>

		<div class="row content">
			<div class="row">
				<div class="welcome-msg">
					<h3>Welcome <%=name %>, to Whee!</h3>
					<p>If you are seeking for support please type in the key words in the search bar. Should you wish to connect with us please raise a ticket. We are constantly updating this site to provide up-to-date services for you.
					</p>
				</div>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<a href="User/raiseTicket.jsp">
					<button class=" btn btn-success raiseticket-btn">Raise a
						Ticket</button>

				</a>
			</div>
			<div class="col-md-4"></div>

			<div class="row stat-content">
				<div class="col-md-3 stats">
					<h4>1,200+ Users</h4>

				</div>
				<div class="col-md-3 stats">

					<h4>25,000 Solved Tickets</h4>
				</div>
				<div class="col-md-3 stats">

					<h4>4+ Years of Experience</h4>
				</div>
			</div>

	<!-- 
			<div class="row">
				<div class="general-supports">
					<br> <br>
					<h3>Frequently asked supports...</h3>
					<p>You can search previously solved...... Lorem ipsum dolor sit
						amet consectetur adipisicing elit. Earum similique magni, aliquid
						odio voluptatem ullam quae quo, distinctio ex perspiciatis natus.
						Similique enim repellat ipsum distinctio ab, dolorum dignissimos
						eligendi. Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Hic nemo, consequatur sunt vel facilis numquam! Recusandae illo
						repellendus et vel veritatis, labore eligendi harum doloribus
						exercitationem minima culpa tempora illum.</p>
				</div>
			</div>
	
	 -->


			<div class="row search-container">
				<!-- 
                            <div class="col-md-2 search-box" ></div>

                            <div class="col-md-8 search-box">

                                <form action="">
                                    <input type="text" class="search-text"> 
                                    <input type="submit" value="search" class="btn btn-success search-btn">
                                </form>
                            </div>

                            <div class="col-md-2 search-box"></div>
                           -->
			</div>


			<div class="row">


				<div id="aboutUs" class="about-us">
					<br> <br>
					<h3>About-us...</h3>
					<p>We work with over 100 countries across the globe in the field of education, Established in 1990, we are still as enthusiastic to provide you with our best concern. Annually, we reach over 82 million people directly and 750 million people overall including online and publications. We are a srilankan based, helpdesk governed by an emirates public body</p>
				</div>
			</div>

			<div class="row">


				<div id="aboutUs" class="terms-cond">
					<br> <br>
					<h3>Terms and Condition...</h3>
					<p>Whee hereby grants you a non-exclusive, non-sub-licensable, non-transferable, limited worldwide right for your authorized Users to access and use the Service during the License Term, solely for your own eternal educational  purposes, subject to the terms and conditions of the Agreement.  All rights not expressly granted to you in the Agreement are reserved by Company and its licensors.
					</p>
					</div>
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



</body>

<%
		}
}

catch (NullPointerException e) {
	response.sendRedirect("home.jsp") ;
}
		

%>
</html>

