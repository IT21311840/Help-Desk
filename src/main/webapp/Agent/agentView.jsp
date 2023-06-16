<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
     <%@page import="java.util.ArrayList"%>
 <%@page import="User.Message"%>
  <%@page import="User.Ticket"%>
 <%@page import="User.userDBUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

<link rel="stylesheet" href="Style/tickets.css">

<link rel="stylesheet" href="Style/view.css">

 <script type="text/javascript">
		 	function submitFunction() {
				document.getElementById("tickets").submit() ;
			}
		 	function submitFunctionAgent() {
				document.getElementById("agent").submit();
			}
		 	function submitFunctionAonprogress() {
				document.getElementById("Aonprogress").submit();
			}
		 	
		 	function submitFunctionAsolved() {
				document.getElementById("Asolved").submit();
			}
		 	function submitFunctionIndex() {
	    		document.getElementById("index").submit() ;
	    	}
		 	function AgentsendMessageFunction() {
        		document.getElementById("Asendmsg").submit() ;
        	}
		 	function submitFunctionLogout() {
        		document.getElementById("logout").submit();
        	}
        	
        	
     </script>
<title>Agent View</title>
</head>
<body>
<%
			try {
				
			
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

                      <li class="nav-item " >
                        <a  class="nav-link" href="User/raiseTicket.jsp">RAISE A TICKET</a>
                      </li>
                      
                       <li class="nav-item ">
            				<a style="color: black; font-weight: bold;" class="nav-link" href="#">Agent</a>
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
                            <form id="agent" action="agent" method="get">
              					
                               <a style=" 
                                text-decoration:none; " href="#" onclick="submitFunctionAgent()">
                					<li <%
	                                    if(status.equals("pending"))
										{
	                                    %> style="<%=style%>" <% }%> >ALL</li>
              					</a>
              				</form>
              				
              				<form id="Aonprogress" action="Agentonprogress" method="get">
              					<input type="hidden" value="onprogress" name="status">
				              <a id="onprogress" style=" 
				                                text-decoration:none" href="#" onclick="submitFunctionAonprogress()">
				                <li<%
	                                    if(status.equals("onprogress"))
										{
	                                    %> style="<%=style%>" <% }%>>ON PROGRESS</li>
				              </a>
              				</form>
              				
              				<form id="Asolved" action="Agentsolved" method="get">
              					<input type="hidden" value="solved" name="status">
				              <a style=" 
				                                text-decoration:none" href="#" onclick="submitFunctionAsolved()">
				                <li<%
	                                    if(status.equals("solved"))
										{
	                                    %> style="<%=style%>" <% }%>>SOLVED</li>
				              </a>
              				</form>

                                
                            </ul>
                        </div>
                    </div>
                        
                    
                </div>

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
                                <div class="col-md-10">
                                    <div>
                                    	<p style="word-wrap: break-word;"><%=content %></p>
                                         </div>
    
                                </div>
                                <div class="col-md-2">
                                    <!--  --> <img class="profile-pic" src="images/neymar.jpg" alt=""> -->
                                </div>
    
                                
    
                            </div>
    
    
                        </div>
                        <%
		                	}
		                	else {
		                		
		                	
                        %>
                        
                        <div class="user-msg">
    
                            <div class="row msg-content">
    
                                <div class="col-md-2">
                                    <!-- 
                                    <img class="profile-pic" src="images/Lionel-Messi.jpeg" alt="">
                                    -->
                                </div>
    
                                <div class="col-md-10">
                                    <div>
                                        
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
		             	if (!status.equals("trash") && !status.equals("solved") && !status.equals("pending"))
		             	{
	             %>                   	        
			                                <div class="col-md-8 text-area">
			                                
			        							<form id="Asendmsg" action="agentsendmsg" method="get" >
    												<input type="hidden" value="<%=tid %>" name="tid">
			                                    	<textarea name="message" cols="120" rows="4"></textarea>
			                                    </form>
			                                    
			                                </div>
			        
			                                <div class="col-md-3 send-btn">
			                                	
				                                 <button class="btn btn-primary send-button" onclick="AgentsendMessageFunction()">Send<i class="fa fa-paper-plane"></i></button>
			                                	
			                                </div>
	        
                   <%
             			}
	        }
	        
			}
			catch (NullPointerException e) {
				response.sendRedirect("../home.jsp") ;
			}
                   %>             		
	                            </div>
	                        </div>
    						
                            
    
                                
    
                            </div>
    
                           

                           
                    </div>
                    
                        
                    


                    
                        
                        
                    
                </div>

            </div>
        </div>

</body>
</html>