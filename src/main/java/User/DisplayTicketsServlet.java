package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DisplayTicketsServlet
 */
@WebServlet("/DisplayTicketsServlet")
public class DisplayTicketsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		HttpSession session =request.getSession(); 
	
		
		//int uid = Integer.parseInt(request.getParameter("uid")) ;
		  
		int uid = (int) session.getAttribute("uid")   ;
		
		ArrayList<Ticket> tkt = new ArrayList<>() ;
		
		tkt =   (ArrayList<Ticket>)userDBUtil.getTicketDetails(uid) ;
		
		request.setAttribute("ticketDetails", tkt);
	
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/User/allTickets.jsp") ;
		dis.forward(request, response) ;
		
		}
		catch (NullPointerException e) {
			response.sendRedirect("login.jsp") ;
		}
		
		
		
	}

}
