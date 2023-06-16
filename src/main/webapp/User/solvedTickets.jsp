<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
  <%@page import="java.util.ArrayList"%>
 <%@page import="User.Ticket"%>
 <%@page import="User.userDBUtil"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
		function submitFunction() {
			document.getElementById("tickets").submit() ;
		}
		function submitFunctionProgress() {
			document.getElementById("ticketsProgress").submit() ;
		}
		function submitFunctionPending() {
			document.getElementById("ticketsPending").submit() ;
		}
		function submitFunctionSolved() {
			document.getElementById("ticketsSolved").submit() ;
		}
		function submitFunctionTrash() {
			document.getElementById("ticketsTrash").submit() ;
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
        	
</script>
<head>
<meta charset="ISO-8859-1">

 		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <link rel="stylesheet" href="Style/tickets.css">
        
          
         <%
         try {
     
       int id = (int) session.getAttribute("uid");
		String	utype = (String) session.getAttribute("type");
		String name = (String) session.getAttribute("name");
     %>  

        <title>Solved tickets</title>
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
                      <li class="nav-item ">
                       <form action="user" method="post" id="index">
                        	<a  class="nav-link" href="home.jsp" onclick="">Home</a>
                        </form>
                      </li>
                      <li class="nav-item">
                        <form id="tickets" action="display" method="get">
                        	<a style="color: black; font-weight: bold;" class="nav-link" href="#" onclick="submitFunction()">My Tickets</a>
                        </form>
                      <li class="nav-item">
                        <a class="nav-link" href="index.jsp#aboutUs">About us</a>
                      </li>
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
						<form id="admin" action="" method="">
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
            <div class="row">


                <div class="col-md-2 left-nav">

                    <div class="row">

                        <!-- <div class="col-md-4 nav-bar">
                           
                        </div> -->
                        <div class="col-md-12 types">
                            <ul>
                                <form id="tickets" action="display" method="get">
	                                <a style=" 
	                                text-decoration:none; " href="#" onclick="submitFunction()">
	                                    <li  >ALL</li>
	                                </a>
                            	</form>

                               	<form id="ticketsProgress" action="onprogress" method="get"> 
									<input type="hidden" value="onprogress" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#"  onclick="submitFunctionProgress()">
	                                    <li>ON PROGRESS</li>
	                                </a>
								</form>
								
								<form id="ticketsPending" action="pending" method="get">
									<input type="hidden" value="onprogress" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionPending()">
	                                    <li >PENDING</li>
	                                </a>
								</form>
								
								<form id="ticketsSolved" action="solved" method="get">
									<input type="hidden" value="solved" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionSolved()">
	                                    <li style="background-color: #F0F0F0; color: black;">SOLVED</li>
	                                </a>
								</form>
			
                                
                                 <form id="ticketsTrash" action="trash" method="get"> 
									<input type="hidden" value="trash" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionTrash()">
	                                    <li>TRASH</li>
	                                </a>
	                             </form>
                                
                            </ul>
                        </div>
                    </div>
                        
                    
                </div>

                <div class="col-md-10 content">
                    <div class="row heading-row">
                        <h2>Solved tickets</h2>

                    </div>

                    
                        <div class="row search-row">
                            <div class="col-md-9">
                            </div>

                            <div class="col-md-3">
                                 <!--  
                                    <form action=""></form>
                                    <input class="search-text" type="text">
            
                                    <input class="search-btn" type="submit" value="search">
                                -->
                            </div>
                        </div>
                    
                    <ul>
                        
                       <% 
								
    						
    							//ArrayList<Ticket> tct = (ArrayList<Ticket>) request.getAttribute("ticketDetails") ;
    							//for(Ticket t : tct ) {
    								
    							//int tid = t.getTicketId() ;
    							//int uid = t.getUserId() ;
    							//int agent = t.getAgent() ;
    							//String subject = t.getSubject() ;
    							//String status = t.getStatus() ;
    							//String lastmod = t.getLastmodified() ;
    							
    						%>
    							<c:forEach var="t" items="${ticketDetails}">
    								<c:set var="tid" value="${t.ticketId}"/>
    								<c:set var="uid" value="${t.userId}"/>
    								<c:set var="status" value="${t.status}"/>
    								<c:set var="agent" value="${t.agent}"/>
    								<c:set var="subject" value="${t.subject}"/>
    								<c:set var="mod" value="${t.lastmodified}"/>
    						 	<li class="tickets">

								<div class="row ticket-row">

								<div class="col-md-8 message">
									<p>${t.subject}</p>
									
								</div>


								<div class="col-md-1 time-date">
									<p style=" font-size : 7px">${t.lastmodified}</p>
									
								</div>

								<div class="col-md-3 action-button">
									<div class="row">
										<div class="col-md-6">

											<form action="deletetemp" method="get"> 
												<input type="hidden" value="${t.ticketId}" name="ticketId" >
													<button
														class="delete-btn btn btn-default btn-block  btn-danger ">
														DELETE <i class="fas fa-trash"></i>
													</button>
											</form>
										</div>

										<div class="col-md-6">
										
										<form action="view" method="get"> 
											<input type="hidden" value="${t.ticketId}" name="ticketId" >
											<a href="viewTicket.jsp">
												<button type="submit"
													class="open-btn btn btn-default btn-block btn-primary">
													Open <i class='fas fa-folder-open'></i>
												</button>
											</a>
										</form>

										</div>
									</div>

								</div>

							</div>
						</li>
						</c:forEach>
    					<%
    					}
    					catch (NullPointerException e) {
    						response.sendRedirect("../home.jsp") ;
    					}
    					%> 	
                        
                    </ul>
                       
                        
                    </ul>

                    
                </div>

            </div>
        </div>


</body>
</html>