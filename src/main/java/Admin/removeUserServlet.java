package Admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import User.userDBUtil;

/**
 * Servlet implementation class removeUserServlet
 */
@WebServlet("/removeUserServlet")
public class removeUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid")) ;
		
		
		boolean isSuccess = userDBUtil.removeUser(uid) ;
		
		if(isSuccess == true ) {
			JOptionPane.showMessageDialog(null, "User removed!!");
			
			RequestDispatcher dis = request.getRequestDispatcher("/Admin/admin.jsp") ;
			
			dis.forward(request, response);
		}
		else {
			JOptionPane.showMessageDialog(null, "Unable to remove user!!");
			
			RequestDispatcher dis = request.getRequestDispatcher("/Admin/admin.jsp") ;
			
			dis.forward(request, response);
		}
		
	
	}

	
}
