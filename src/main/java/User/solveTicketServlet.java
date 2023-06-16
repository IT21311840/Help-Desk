package User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class solveTicketServlet
 */
@WebServlet("/solveTicketServlet")
public class solveTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
		
			int tid = Integer.parseInt(request.getParameter("tid")) ;
			
			boolean isTrue ;
			
			isTrue = userDBUtil.solveTicket(tid) ;
			
			
			if (isTrue == true) {
				
				JOptionPane.showMessageDialog(null, "Ticket marked as solved");
				
				RequestDispatcher dis = request.getRequestDispatcher("display") ;
				
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
