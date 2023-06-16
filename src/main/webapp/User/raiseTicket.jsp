<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
        
        	function submitFunction() {
        		document.getElementById("tickets").submit() ;
        	}
        	function submitFunctionIndex() {
        		document.getElementById("index").submit() ;
        	}
        	function submitFunctionProfile() {
        		document.getElementById("prof").submit();
        	}
        	
        </script>
<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

        <link rel="stylesheet" href="../Style/home.css">
        <link rel="stylesheet" href="../Style/theme.css">
        <link rel="stylesheet" href="../Style/raiseTicket.css">
        
        <title>Raise Ticket</title>
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
                        	<a  class="nav-link" href="../home.jsp" onclick="">Home</a>
                        </form>
                      </li>
                      <li class="nav-item ">
                        
                     
                      	<form id="tickets" action="../display" method="get">
                      		
	                        <a  class="nav-link" href="#" onclick="submitFunction()" >My Tickets</a>
                      	</form>
                      	
                      </li>
                      <li class="nav-item ">
                        <a class="nav-link" href="../index.jsp#aboutUs">About us</a>
                      </li>
                      <li class="nav-item ">
						<form id="prof" action="../profile" method="get">
							<a class="nav-link"
								href="#" onclick="submitFunctionProfile()">Profile</a>
						</form>
						</li>
                      <li class="nav-item " >
                        <a style="color: black; font-weight: bold;"  class="nav-link" href="raiseTicket.jsp">RAISE A TICKET</a>
                      </li>

                    </ul>
                  </nav>
        
                 
            </div>

                  <div class="row content" >
                    

                      <div class="col-md-3"></div>
  
                      <div class="col-md-6">
                        <form action="../raise" method="get">
                        	
                        	<input type="hidden" value="1" name="uid">
                          <div class="subject">
    
                            <h3>Subject : </h3>
                            <textarea   id="" cols="80" rows="3" placeholder="Subject" name="subject" required></textarea>  
  
                          </div>
                          
                          <div class="message">
  
                            <h4>Message : </h4>
                            <textarea  id="" cols="80" rows="10" name="message" placeholder="A brief description about your subject" required></textarea>
                            
                          </div>
    
                          <div class="raise">
                            <button type="submit" class="btn btn-success raise-btn" value="raise a ticket">Raise ticket</button>
                          </div>
                        </form>
                      </div>
  
                      <div class="col-md-3"></div>

                    

                    
                    
            
                  </div>

                  <div class="row footer">

                    <footer>
                      <h6>Follow us on facebook</h6>
                      <h6>Follow me on Instagram @t_h_a_n_i_s_h</h6>
                      <h6>twitter</h6>
                  </footer>
                  </div>

            </div>
        </div>
       

</body>
</html>