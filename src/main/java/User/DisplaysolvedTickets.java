package User;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DisplaysolvedTickets
 */
@WebServlet("/DisplaysolvedTickets")
public class DisplaysolvedTickets extends HttpServlet {
	private static final long serialVersionUID = 1L;
       


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//int uid = Integer.parseInt(request.getParameter("uid")) ;
			HttpSession session =request.getSession();  
			int uid = (int) session.getAttribute("uid")   ;
			String status = request.getParameter("status") ;
			
			ArrayList<Ticket> tkt = new ArrayList<>() ;
			
			tkt =   (ArrayList<Ticket>)userDBUtil.getTickettypesDetails(uid, status) ;
			
			request.setAttribute("ticketDetails", tkt);
		
					
			RequestDispatcher dis = getServletContext().getRequestDispatcher("/User/solvedTickets.jsp") ;
			dis.forward(request, response) ;
		
		}
		catch (NullPointerException e) {
			response.sendRedirect("login.jsp") ;
		}
		
	}

}
