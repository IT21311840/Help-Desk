package User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class addMessageServlet
 */
@WebServlet("/addMessageServlet")
public class addMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session =request.getSession();  
			int uid = (int) session.getAttribute("uid")   ;
			int tid =  Integer.parseInt(request.getParameter("tid")) ;
			String message = request.getParameter("msg") ;
			
			boolean isTrue ;
			
			isTrue = userDBUtil.sendMessage(tid, uid, message) ;
			
			if (isTrue == true) {
				
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp") ;
				
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
