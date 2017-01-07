package controller;

import java.io.IOException;
import java.util.Base64;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Facade;
import model.User;
/**
 * Servlet implementation class CreateColocServlet
 */

public class CreateColocServlet {
	
	private static final long serialVersionUID = 1L;
	private static Base64 b64encode ;

	@EJB 
	model.Facade facade;
	/**
	 * Default constructor.
	 */
	
	public CreateColocServlet(){
		super();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String op = request.getParameter("ok");
		if(op.equals("cc")){
			String cName=request.getParameter("txtColocName");
			String pass=request.getParameter("txtPass");
			String confPass=request.getParameter("txtConfPass");
			String address=request.getParameter("txtAddress");
			String city=request.getParameter("txtCity");
			String country=request.getParameter("txtCountry");
			System.out.println("cName : " + cName + " pass : " + pass + " address : " + address + " , " + city + " , " + country);
			System.out.println(b64encode.getEncoder().encodeToString(pass.getBytes()));
			if (pass.equals(confPass)){
				HttpSession session = request.getSession();
				User user = (User) session.getAttribute("sessionUser");
				facade.addColoc(user, cName, address, city, country, b64encode.getEncoder().encodeToString(pass.getBytes()));
				request.getRequestDispatcher("homeColoc.jsp").forward(request,response);
			} else {
				// Wrong password
				response.sendRedirect("error.jsp");
			}
		}
		if(op.equals("join")){
			String cName=request.getParameter("txtColocName");
			String pass=request.getParameter("txtPass");
			System.out.println(facade.userExists(cName, b64encode.getEncoder().encodeToString(pass.getBytes())));
			if( facade.colocExists(cName, b64encode.getEncoder().encodeToString(pass.getBytes()))){
				RequestDispatcher rd=request.getRequestDispatcher("homeColoc.jsp");
				rd.forward(request, response);
			} else {
				// Wrong coloc
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

