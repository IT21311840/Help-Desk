<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@page import="java.util.ArrayList"%>
 <%@page import="User.Ticket"%>
 <%@page import="User.userDBUtil"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <link rel="stylesheet" href="Style/tickets.css">
        
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
	
	function submitFunctionAdminUser() {
		document.getElementById("adminU").submit();
	}
	
	function submitFunctionAdminTickets() {
		document.getElementById("adminT").submit();
	}
	function submitFunctionchangeAdmin() {
		document.getElementById("changeadmin").submit();
	}
</script>
        
<title>Admin</title>
</head>
<body>
<%
	try {
%>
 <header>

            <div class="row header">
                <h1>Whee!</h1>
            </div>
        </header>


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
							<a class="nav-link" href="#" onclick="submitFunction()">My
								Tickets</a>
						</form>
						</li>
						
                      <li class="nav-item ">
                        <a class="nav-link" href="home.html #aboutUs">About us</a>
                      </li>
                      <li class="nav-item " >
                        <a  class="nav-link" href="profile.html">Profile</a>
                      </li>
                      <li class="nav-item ">
			            	<a class="nav-link" href="User/raiseTicket.jsp">RAISE A TICKET</a>
			          </li>
                      
                      <li class="nav-item ">
						<form id="admin" action="adminAgent" method="get">
						<input type="hidden" name="type" value="agent">
							<a style="color: black; font-weight: bold;" class="nav-link"
								href="#" onclick="submitFunctionAdmin()">Admin</a>
						
						</form>
					</li>
					
                      <li class="nav-item " style="margin-left: 900px;">
						<form id="logout" action="logout" method="get" >
							<a class="nav-link"
								href="#" onclick="submitFunctionLogout()">Log out</a>
						</form>
					</li>
                      </ul>
                    </ul>
                  </nav>
        
                 
            </div>
            <div class="row">


                <div class="col-md-2 left-nav">

                    <div class="row">

                        <!-- <div class="col-md-4 nav-bar">
                           
                        </div> -->
                        <div class="col-md-12 types">
                            <ul>
                            	<form id="admin" action="adminAgent" method="get">
                            		<input type="hidden" name="type" value="agent">
	                                <a style=" 
	                                text-decoration:none; " href="#" onclick="submitFunctionAdmin()" >
	                                    <li style="background-color: #F0F0F0; color: black;" >AGENTS</li>
	                                </a>
                            	</form>
                            	
    							<form id="adminU" action="adminUser" method="get">
    								<input type="hidden" name="type" value="user">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionAdminUser()" >
	                                    <li>USER</li>
    							</form>
    							
                                </a>
                                <form id="adminT" action="adminTicket" method="get">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionAdminTickets()" >
	                                    <li>TICKETS</li>
	                                </a>
                                </form>
                            </ul>
                        </div>
                    </div>
                        
                    
                </div>

                <div class="col-md-10 content" style="padding-left: 30px ; padding-top: 50px;">
                            
                                
                              
                            <ul>
                            <Li class="tickets" style="padding-right: 0; padding-left: 0; width: 1200px ;">

                                <div class="row ticket-row">
                                    <div class="col-md-1">Id</div>
                                    <div class="col-md-2">Name </div>
                                    <div class="col-md-1">User Name </div>
                                    <div class="col-md-3">Email </div>

                                    <div class="col-md-3" > 
                                    
                                    </div>

                                    <div class="col-md-2">
                                      
                                    </div>

                                </div>
                              </Li>
                              
                            <c:forEach var="u" items="${userInfo}">
    								<c:set var="uid" value="${u.userId}"/>
    								<c:set var="uname" value="${u.userName}"/>
    								<c:set var="fname" value="${u.firstName}"/>
    								<c:set var="lname" value="${u.lastName}"/>
    								<c:set var="email" value="${u.email}"/>
    								<c:set var="type" value="${u.type}"/>
    								
                              
                              <Li class="tickets" style="padding-right: 0; padding-left: 0; width: 1200px ;">

                                <div class="row ticket-row">
                                    <div class="col-md-1">${u.userId}</div>
                                    <div class="col-md-2">${u.firstName} ${u.lastName}</div>
                                    <div class="col-md-1">${u.userName }</div>
                                    <div class="col-md-3">${u.email}</div>

                                    <div class="col-md-3" > 
                                    	<form id="changeadmin" action="adminchange" method="get">
                                    		<input type="hidden" name="uid" value="${u.userId}">
                                    		<a>
	                                    		<button type="submit" class="btn btn-primary" style ="background-color: #191f45; color: #d8bfd8">Change as admin</button>
                                    		</a>
	                                     
                                    	</form>
                                    </div>

                                    <div class="col-md-2">
                                    	<form id="remove" action="remove" method="get">
                                    		<input type="hidden" name="uid" value="${u.userId}">
                                    		<a>
                                    			<button type="submit" class="btn btn-primary" style ="background-color: rgb(212, 5, 5); color: white">Remove Agent</button>
                                    		</a>
                                    	</form>
                                      
                                    </div>

                                </div>
                              </Li>
                              
                              </c:forEach>
                            </ul>

                            

                            



                          </div>
                        </div>
                        
                  </div>
  
              </div>
  
  
          </div>
  <%
	}
	catch (NullPointerException e) {
		response.sendRedirect("../home.jsp") ;
}
  %>
</body>
</html>