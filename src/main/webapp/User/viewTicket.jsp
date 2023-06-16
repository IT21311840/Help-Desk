<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
     <%@page import="java.util.ArrayList"%>
 <%@page import="User.Message"%>
  <%@page import="User.Ticket"%>
 <%@page import="User.userDBUtil"%>
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
        	function sendMessageFunction() {
        		document.getElementById("sendmsg").submit() ;
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

        <link rel="stylesheet" href="Style/view.css">
          
         <%
         try {
     
       int id = (int) session.getAttribute("uid");
		String	utype = (String) session.getAttribute("type");
		String name = (String) session.getAttribute("name");
     %>  
        
        <title>Ticket view</title>
</head>
<body>
		<%
		   ArrayList<Ticket> tkt = (ArrayList<Ticket>) request.getAttribute("ticket") ;
        
        	String style = "background-color: #F0F0F0; color: black;" ;
	        for(Ticket t : tkt) {
	        	int tid = t.getTicketId() ;
	        	String subject = t.getSubject() ;
	        	String status = t.getStatus() ;
	        	
	        	
			
		%>
		
		
        <header>

            <div class="row header">
                <h1>Whee!</h1>
            </div>
        </header>


        <div class="container-fluid">

            <div class="row">

                <nav class="navbar navbar-expand-sm  navigation" >
                    <ul class="navbar-nav ">
                      <li class="nav-item ">
                        <form action="user" method="post" id="index">
                        	<a  class="nav-link" href="home.jsp" onclick="">Home</a>
                        </form>
                      </li>
                      <li class="nav-item ">
                        <a style="color: black; font-weight: bold;" class="nav-link" href="#">My Tickets</a>
                      </li>
                      <li class="nav-item ">
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
	                                text-decoration:none; " href="#" >
	                                    <li  onclick="submitFunction()">ALL</li>
	                                </a>
                            	</form>
								<%
									
								%>
								<form id="ticketsProgress" action="onprogress" method="get"> 
									<input type="hidden" value="onprogress" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#"  onclick="submitFunctionProgress()">
	                                    <li <%
	                                    if(status.equals("onprogress"))
										{
	                                    %> style="<%=style%>" <% }%>>ON PROGRESS</li>
	                                </a>
								</form>
								
								
								<form id="ticketsPending" action="pending" method="get"> 
									<input type="hidden" value="pending" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionPending()" >
	                                    <li<%
	                                    if(status.equals("pending"))
										{
	                                    %> style="<%=style%>" <% }%>>PENDING</li>
	                                </a>
                                </form>
                                
                                
                                <form id="ticketsSolved" action="solved" method="get"> 
									<input type="hidden" value="solved" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionSolved()">
	                                    <li<%
	                                    if(status.equals("solved"))
										{
	                                    %> style="<%=style%>" <% }%>>SOLVED</li>
	                                </a>
	                                
	                             </form>
	                             
	                             <form id="ticketsTrash" action="trash" method="get"> 
									<input type="hidden" value="trash" name="status">
	                                <a style=" 
	                                text-decoration:none" href="#" onclick="submitFunctionTrash()">
	                                    <li<%
	                                    if(status.equals("trash"))
										{
	                                    %> style="<%=style%>" <% }%>>TRASH</li>
	                                </a>
	                             </form>
                                
                            </ul>
                        </div>
                    </div>
                        
                    
                </div>
                
                <%
             
                
                %>
                	<div class="col-md-10 content">

                    <div class="row">
                        
                        <div class="ticket-details">
    
                            <h5> Reference No : <%=tid %></h5> 
                            <h4>Subject :</h4> 
                            <p><%=subject %></p>
                        </div>
                        
                       <div class="messages">
                       
                       
                <% 
	        	
	        
                ArrayList<Message> msg = (ArrayList<Message>) request.getAttribute("ticketMessages") ;
                
                for(Message m : msg) {
                	
                
                	String dtime = m.getTime() ;
                	int sender = m.getSender() ;
                	String content = m.getContent() ;
                	int uid = (int) session.getAttribute("uid") ;
                
                	
                	if ((int) session.getAttribute("uid") == sender ) {
                		
                %>
                
                 <div class="reply-msg">
    						
                            <div class="row msg-content">
                                <div class="col-md-10" ">
                                    <div >
                                    	<h5>You :</h5>
                                    	<p style="word-wrap: break-word;"><%=content %></p>
                                    </div>
    
                                </div>
                                
                                <div class="col-md-2">
                                    <!--<img class="profile-pic" src="images/neymar.jpg" alt="">  -->
                                </div>
    
                                
    
                            </div>
    
    
                        </div>
                		
                		
                <%		
                	}
                	else 
                	{
                %>	
                		 <div class="user-msg">
    
                            <div class="row msg-content">
    							
                                
    
                                <div class="col-md-12" >
                                    <div >
                                        <h5>Agent :</h5>
                                        <p style="word-wrap: break-word;"><%=content %></p>
                                    </div>
    
                                </div>
    
                            </div>
                        </div>
                <% 	
                	}
                }
                
                %>
         
    			</div>
    				
	                       <div class="send-msg row">
	                            <div class="row" >
	                                		
	             <%
		             	if (!status.equals("trash") && !status.equals("solved"))
		             	{
	             %>                   	        
			                                <div class="col-md-8 text-area">
			                                
			        							<form id="sendmsg" action="send" method="get" >
    												<input type="hidden" value="<%=tid %>" name="tid">
			                                    	<textarea name="message" cols="120" rows="4"></textarea>
			                                    </form>
			                                    
			                                </div>
			        
			                                <div class="col-md-3 send-btn">
			                                	
				                                 <button class="btn btn-primary send-button" onclick="sendMessageFunction()">Send<i class="fa fa-paper-plane"></i></button>
			                                	
			                                </div>
	        
                   <%
             			}
                   %>             		
	                            </div>
	                        </div>
                       
    
    
  
                            <div class="ticket-options">
                                
                                <div class="row">
                                    <div class="col-md-4 options">
    								<%
    								if(status.equals("trash") ||  status.equals("solved")) 
									{
    								%>
    									<form action="solve" method="get">
            								<input type="hidden" value="<%=tid %>" name="tid" >
                                            <button type="submit" class="mark-button btn btn-secondary" disabled><i class="fa fa-check"></i> Solved</button>
                                        </form>
    								
    								<%	
									}
    								else {
    								%>
    									<form action="solve" method="get">
            								<input type="hidden" value="<%=tid %>" name="tid" >
                                            <button type="submit" class="mark-button btn btn-secondary"><i class="fa fa-check"></i> Solved</button>
                                        </form>
    								
    								
    								<% 	
    								}
    								%>
                                        
                                    </div>
    
                                    
    
                                    <div class="col-md-4 options">
    
                                       
                                    </div>
    
                                    <div class="col-md-4 options" >
    									<%
    										if(status.equals("trash")) 
    										{
    									%>
    											<form action="deleteperm" method="get">
		            								<input type="hidden" value="<%=tid %>" name="ticketId" >
		                                            <button type="submit" class="mark-button btn btn-danger"> <i class="fas fa-trash" ></i> Delete Permanently</button>
                                       	 		</form>
                                       	<%
    										}
    										else {
    									%>
    										<form action="deletetemp" method="get">
	            								<input type="hidden" value="<%=tid %>" name="ticketId" >
	                                            <button type="submit" class="mark-button btn btn-danger"> <i class="fas fa-trash" ></i> Delete</button>
                                       	 	</form>
    									
    									<% 		
    											
    										
    										}
    									%>
                                       
                                    </div>
                                    
                                    </div>
    
    				<%
	        			}
    				%>
                                    
    
                                </div>
    
                                <div class="row ticket-options-info">
    
                                    <div class="col-md-4 options">
                                        <p> <i class="fa fa-info-circle" aria-hidden="true"></i> By clicking this your ticket will be marked as solved and you wont be able to reply to this ticket anymore . </p>
                           				</p>
                                    </div>
    
                                    <div class="col-md-4 options">
                                        
                                    </div>
    
                                    <div class="col-md-4 options">
                                        <p> <i class="fa fa-info-circle" aria-hidden="true"></i> By clicking this your ticket will be deleted.</p>
                                    </div>
    
    
    
                                </div>
                                
    
                            </div>
    
                            <!-- <div class="report">
                                
                                <div class="row">
                                    <div class="col-md-2">
    
                                        <form action="">
            
                                            <button type="submit" class="mark-button btn btn-danger"> <i class="fa fa-flag" ></i> Report</button>
                                        </form>
                                    </div>
    
                                    <div class="col-md-10 solved-info">
                                        <p> <i class="fa fa-info-circle" aria-hidden="true"></i> By clicking this...</p>
    
                                    </div>
    
                                </div>
                
                            </div> -->

                            
                    </div>
                    
                        
                    
				<%
    							
     					}
    					catch (NullPointerException e) {
    						response.sendRedirect("../home.jsp") ;
    					}
    							
    					%> 	

                    
                        
                        
                    
                </div>

            </div>
        </div>

    

</body>
</html>