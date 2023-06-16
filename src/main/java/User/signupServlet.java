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
 * Servlet implementation class signupServlet
 */
@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname = request.getParameter("fname") ;
		String lname = request.getParameter("lname") ;
		String uname = request.getParameter("uname") ;
		String email = request.getParameter("email") ;
		String password = request.getParameter("password") ;
		String pswRpt = request.getParameter("pswrepeat") ;
		
		
		
		
		
		if( password.equals(pswRpt) ) {
			
			boolean checkemail = userDBUtil.checkEmail(email) ;
			
			if ( checkemail == true ) {
				
				boolean isSuccess =  userDBUtil.registerUser(uname , fname, lname, email, password ) ;
				
				if ( isSuccess == true) {
					
					JOptionPane.showMessageDialog(null, "User Registered Succesfully");
					response.sendRedirect("login.jsp") ;
				}
				else {
					JOptionPane.showMessageDialog(null, "User Registration unsuccessfull");
					response.sendRedirect("signup.jsp") ;
				}
			}
			else {
				JOptionPane.showMessageDialog(null, "This email already exist");
				response.sendRedirect("signup.jsp") ;
			}
			
			
		}
		else {
			JOptionPane.showMessageDialog(null, "Password do not match");
			response.sendRedirect("signup.jsp") ;
		}
		
	}

}
