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
import javax.swing.JOptionPane;

/**
 * Servlet implementation class userDetailsServlet
 */
@WebServlet("/userDetailsServlet")
public class userDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			HttpSession session =request.getSession(); 
			
			String email = request.getParameter("email") ;
			String password = request.getParameter("password") ;
			
			boolean isSuccess = userDBUtil.validate(email, password) ;
			
			if (isSuccess == true) {
				
				ArrayList<User> user = userDBUtil.getUserDetails(email , password) ;
				
				
				
				for (User u : user) {

					//fname = u.getFirstName();
					//lname = u.getLastName();
					//uid = u.getUserId();
					//type = u.getType();
					//eml = u.getEmail();
					
					//HttpSession session =request.getSession();
					session.setAttribute("uid", u.getUserId());
					session.setAttribute("type", u.getType());
					session.setAttribute("name", u.getFirstName());
					session.setAttribute("email", u.getEmail());

				}
				
				request.setAttribute("userInfo", user);
				JOptionPane.showMessageDialog(null, "login Success");
				
				RequestDispatcher dis = getServletContext().getRequestDispatcher("/index.jsp") ;
				dis.forward(request, response) ;
			}
			else {
				
				JOptionPane.showMessageDialog(null, "login failed");
				response.sendRedirect("login.jsp") ;
				
			}
			
			
		}catch(NullPointerException e) {
			
			response.sendRedirect("login.jsp") ;
		}

		
		
	}

	

}
