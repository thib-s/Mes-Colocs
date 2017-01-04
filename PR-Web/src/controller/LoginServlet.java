package controller;


import java.io.IOException;
import java.util.Base64;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Facade;
/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Base64 b64encode ;

	@EJB 
	model.Facade facade;
	/**
	 * Default constructor.
	 */
	public LoginServlet() {
		super();

	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("ok");
		if(op.equals("ca")){
			String name=request.getParameter("txtUserName");
			String pass=request.getParameter("txtPass");
			String email=request.getParameter("txtEmail");
			String firstname=request.getParameter("txtFirsttName");
			String lastname=request.getParameter("txtLastName");
			System.out.println("name : " + name + " pass : " + pass + " email : " + email + " firstname : " + firstname + " lastname : " + lastname);
			System.out.println(b64encode.getEncoder().encodeToString(pass.getBytes()));
			facade.addUser(name, firstname, lastname, b64encode.getEncoder().encodeToString(pass.getBytes()), email);
			request.getRequestDispatcher("login.jsp").forward(request,response);
		}

		if(op.equals("log")){
			String name=request.getParameter("txtUserName");
			String pass=request.getParameter("txtPass");
			System.out.println(facade.userExists(name, b64encode.getEncoder().encodeToString(pass.getBytes())));
			if( facade.userExists(name, b64encode.getEncoder().encodeToString(pass.getBytes())))
			{
				RequestDispatcher rd=request.getRequestDispatcher("success.jsp");
				request.setAttribute("uname", name);
				rd.forward(request, response);
				System.out.println("test");
			}
			else
			{//if name&pass not match then it display error page//
				response.sendRedirect("error.jsp");
			}
		}

	}




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}