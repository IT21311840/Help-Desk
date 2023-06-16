package User;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;


@WebServlet("/RaiseTicketServlet")
public class RaiseTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session =request.getSession();  
			
			int uid = (int) session.getAttribute("uid")   ;
			String subject = request.getParameter("subject") ;
			String message = request.getParameter("message") ;
			
			
	//		PrintWriter out = response.getWriter();
	//		response.setContentType("text/html");
	//		
	//		out.println("<script type='text/javascript'>");
	//		out.println("alert('Your ticke is raised');");
	//		out.println("location='display'");
	//		out.println("</script>");
		        
			
			boolean isTrue ;
			
			isTrue = userDBUtil.raiseticket(uid, subject, message) ;
			
			if (isTrue == true) {
				
				JOptionPane.showMessageDialog(null, "Ticket raised");
				
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
