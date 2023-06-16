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
</script>       
<title>Admin Tickets</title>
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
	                                    <li  >AGENTS</li>
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
	                                    <li style="background-color: #F0F0F0; color: black;">TICKETS</li>
	                                </a>
                                </form>
                                        </ul>
                                    </div>
                                </div>
                                    
                                
                            </div>

                            <div class="col-md-10 content" style="margin-right: 0;">

                                    <div>

                                        <div class="row heading-row">
                                            <h2>All tickets</h2>
                
                                        </div>
                                        <ul>
                                        
                                   <c:forEach var="t" items="${ticketDetails}">
	    								<c:set var="tid" value="${t.ticketId}"/>
	    								<c:set var="uid" value="${t.userId}"/>
	    								<c:set var="status" value="${t.status}"/>
	    								<c:set var="agent" value="${t.agent}"/>
	    								<c:set var="subject" value="${t.subject}"/>
	    								<c:set var="mod" value="${t.lastmodified}"/>
	    								
                                        <li class="tickets">
                
                                                <div class="row ticket-row">
                                                
                    										<div class="col-md-1 message">
                                                                <p>${t.ticketId}</p>
                                                            </div>
                                                            
                                                            <div class="col-md-6 message">
                                                                <p>${t.subject}</p>
                                                            </div>
                                                        
                            
                                                        <div class="col-md-2 time-date" style="">
                                                            <p>${t.lastmodified}</p>

                                                        </div>
                            
                                                        <div class="col-md-3 action-button">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                	<form action="adminV" method="get">
                                                                		<input type="hidden" name="tid" value="${t.ticketId}" >
	                                                                    <a href="view.html">
	                                                                        <button type="submit" class="open-btn btn btn-default btn-block btn-primary">View <i class='fas fa-folder-open'></i></button>
	                                                                    </a>
                                                                	</form>
                
                                                                </div>
                                                            </div>
                                                        
                                                        </div>
                                                        
                                                </div>
                                        </li>
                                        </c:forEach>
                                    </ul>
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