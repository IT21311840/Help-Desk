package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import User.Message;
import User.Ticket;
import User.userDBUtil;

/**
 * Servlet implementation class viewTicketAdminServlet
 */
@WebServlet("/viewTicketAdminServlet")
public class viewTicketAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			int tid =  Integer.parseInt(request.getParameter("tid")) ;
			
			ArrayList<Message> ms = new ArrayList<>() ;
			ArrayList<Ticket> tk = new ArrayList<>() ;
			
			ms =   (ArrayList<Message>)userDBUtil.getMessages(tid);
			tk =  (ArrayList<Ticket>)userDBUtil.getATicketDetails(tid) ;
			
			request.setAttribute("ticket", tk);
			request.setAttribute("ticketMessages", ms);
			
			RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/adminViewTicket.jsp") ;
			dis.forward(request, response) ;
		}
		catch (NullPointerException e) {
			response.sendRedirect("login.jsp") ;
		}
		
		
	}

	
}
