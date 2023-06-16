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
 * Servlet implementation class agentsendMessage
 */
@WebServlet("/agentsendMessage")
public class agentsendMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
try {
			
			HttpSession session =request.getSession();  
			
			int uid = (int) session.getAttribute("uid")   ;
			String message = request.getParameter("message") ;
			int tid = Integer.parseInt(request.getParameter("tid")) ;
			
			boolean isTrue ;
			
			isTrue = userDBUtil.sendMessage(tid, uid, message ) ;
			
			if (isTrue == true) {
				
				
				JOptionPane.showMessageDialog(null, "Message sent!!");
				
				ArrayList<Message> ms = new ArrayList<>() ;
				ArrayList<Ticket> tk = new ArrayList<>() ;
				
				ms =   (ArrayList<Message>)userDBUtil.getMessages(tid);
				tk =  (ArrayList<Ticket>)userDBUtil.getATicketDetails(tid) ;
				
				request.setAttribute("ticket", tk);
				request.setAttribute("ticketMessages", ms);
				
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
