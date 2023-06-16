package Admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import User.User;
import User.userDBUtil;

/**
 * Servlet implementation class getUsersServlet
 */
@WebServlet("/getUsersServlet")
public class getUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type") ;
		
		ArrayList<User> user = userDBUtil.getuserTypes(type) ;
		
		request.setAttribute("userInfo", user);
	
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/adminUser.jsp") ;
		dis.forward(request, response) ;
	}

	
}
