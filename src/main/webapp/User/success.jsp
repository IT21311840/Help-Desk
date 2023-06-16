<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="javax.servlet.http.HttpSession"%>
    <%@page import="javax.swing.JOptionPane"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h1>login</h1>
	
	
	<%
		///session.setAttribute("uid", 1) ; 
	
		//int res = JOptionPane.showConfirmDialog (null , "Logged in") ;
		
		//if (res == 0)
			//response.sendRedirect("../index.jsp") ;
	%>
	
	<form action="../user" method="post">
		<input type="text" name="uname" >
		<input type="text" name="password" >
		<input type="submit" value="login" >
	
	</form>
	
	
</body>
</html>