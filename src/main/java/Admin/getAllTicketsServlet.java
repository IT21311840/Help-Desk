package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.Ticket;
import User.userDBUtil;

/**
 * Servlet implementation class getAllTicketsServlet
 */
@WebServlet("/getAllTicketsServlet")
public class getAllTicketsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Ticket> tkt = new ArrayList<>() ;
		
		tkt =   (ArrayList<Ticket>)userDBUtil.allTickets() ;
		
		request.setAttribute("ticketDetails", tkt);
	
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/adminTicket.jsp") ;
		dis.forward(request, response) ;
	}

	
}
