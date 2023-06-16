package Agent;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import User.Message;
import User.Ticket;
import User.userDBUtil;

/**
 * Servlet implementation class agentPickServlet
 */
@WebServlet("/agentPickServlet")
public class agentPickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session =request.getSession();  
			int uid = (int) session.getAttribute("uid") ;
			int tid = Integer.parseInt(request.getParameter("ticketId")) ;
			
			boolean isTrue ;
			isTrue = userDBUtil.pickTicket(tid, uid) ;
			
			ArrayList<Message> ms = new ArrayList<>() ;
			ArrayList<Ticket> tk = new ArrayList<>() ;
			
			if (isTrue == true) {
				
				ms =   (ArrayList<Message>)userDBUtil.getMessages(tid);
				tk =  (ArrayList<Ticket>)userDBUtil.getATicketDetails(tid) ;
				
				request.setAttribute("ticket", tk);
				
				request.setAttribute("ticketMessages", ms);
				JOptionPane.showMessageDialog(null, "Ticket marked as solved");
				
				RequestDispatcher dis = request.getRequestDispatcher("/Agent/agentView.jsp") ;
				
				dis.forward(request, response);
			}
			else {
				RequestDispatcher dis2 = request.getRequestDispatcher("/User/unsuccess.jsp") ;
				
				dis2.forward(request, response);
			}
			
			
		}
		
		catch (NullPointerException e) {
			response.sendRedirect("login.jsp") ;
		}
	}


}
