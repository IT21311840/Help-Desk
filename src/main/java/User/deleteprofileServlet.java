package User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class deleteprofileServlet
 */
@WebServlet("/deleteprofileServlet")
public class deleteprofileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		try {
			HttpSession session =request.getSession();
			
		    int id = (int) session.getAttribute("uid");
		    
		    
		    boolean isTrue = userDBUtil.deleteprofile(id);
		    
            if (isTrue == true) {
				
				JOptionPane.showMessageDialog(null, "User deleted Permanently");
				
				RequestDispatcher dis = request.getRequestDispatcher("logout") ;
				
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
