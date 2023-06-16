<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   
 <%@page import="java.util.ArrayList"%>
 <%@page import="User.Ticket"%>
 <%@page import="User.userDBUtil"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

  <link rel="stylesheet" href="Style/tickets.css">
  
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
		 	function submitFunctionLogout() {
        		document.getElementById("logout").submit();
        	}
        	
        	
     </script>
<title>Agent Page</title>
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
          
          <li class="nav-item ">
			<form id="tickets" action="display" method="get">
				<a class="nav-link" href="#" onclick="submitFunction()">My
					Tickets</a>
			</form>
		</li>
          <li class="nav-item ">
            <a class="nav-link" href="profile.html">Profile</a>
          </li>

          <li class="nav-item ">
				<a class="nav-link" href="User/raiseTicket.jsp">RAISE A TICKET</a>
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
                					<li >ALL</li>
              					</a>
              				</form>
              				
              				<form id="Aonprogress" action="Agentonprogress" method="get">
              					<input type="hidden" value="onprogress" name="status">
				              <a id="onprogress" style=" 
				                                text-decoration:none" href="#" onclick="submitFunctionAonprogress()">
				                <li style="background-color: #F0F0F0; color: black;">ON PROGRESS</li>
				              </a>
              				</form>
              				
              				<form id="Asolved" action="Agentsolved" method="get">
              					<input type="hidden" value="solved" name="status">
				              <a style=" 
				                                text-decoration:none" href="#" onclick="submitFunctionAsolved()">
				                <li>SOLVED</li>
				              </a>
              				</form>

            </ul>
          </div>
        </div>


      </div>

      <div class="col-md-10 content" style="margin-right: 0;">

        <div>

          <div class="row heading-row">
            <h2>On progress tickets</h2>

          </div>
          <div class="row search-row">
            <!--  <div class="col-md-9">
            </div>

            <div class="col-md-3">
              <form action=""></form>
              <input class="search-text" type="text">

              <input class="search-btn" type="submit" value="search">
            </div>
            -->
          </div>

          <ul>
          
          <%
          try {
      		ArrayList<Ticket> tct = (ArrayList<Ticket>) request.getAttribute("ticketDetails") ;
				for(Ticket t : tct ) {
					
				int tid = t.getTicketId() ;
				int uid = t.getUserId() ;
				int agent = t.getAgent() ;
				String subject = t.getSubject() ;
				String status = t.getStatus() ;
				String lastmod = t.getLastmodified() ;
			
          %>

            <li class="tickets">

                            <div class="row ticket-row">

                                <div class="col-md-8 message">
                                    <p><%=subject %></p>
                                </div>


                                <div class="col-md-1 time-date">
                                    <p style=" font-size : 7px"><%=lastmod %></p>
                                    
                                </div>

                                <div class="col-md-3 action-button">
                                    <div class="row">

                                        <div class="col-md-12">
                                        <form action="agentview" method="get">
                                            <a href="">
												<input type="hidden" value="<%=tid %>" name="ticketId">
                                                <button type="submit" class="open-btn btn btn-default btn-block btn-primary">Open <i
                                                        class='fas fa-folder-open'></i></button>
                                            </a>
										</form>
                                        </div>
                                    </div>

                                </div>

                            </div>
                        </li>
            <%
				}
				
          	}
			catch (NullPointerException e) {
				response.sendRedirect("../home.jsp") ;
			}
            %>


           


          </ul>
        </div>

       
      </div>

    </div>


  </div>

</body>
</html>