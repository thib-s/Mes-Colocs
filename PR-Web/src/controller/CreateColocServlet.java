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

import model.Coloc;
import model.User;
/**
 * Servlet implementation class CreateColocServlet
 */

public class CreateColocServlet extends HttpServlet {

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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("sessionUser");
		String op = request.getParameter("ok");
		if(user != null){
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
					//HttpSession session = request.getSession();
					//User user = (User) session.getAttribute("sessionUser");
					user = facade.getUser(user.getUsername());
					session.removeAttribute("sessionUser");
					Coloc coloc = facade.addColoc(user, cName, address, city, country, b64encode.getEncoder().encodeToString(pass.getBytes()));
					facade.bindUserColoc(user,coloc);
					user = facade.getUser(user.getUsername());
					session.setAttribute("sessionUser", user);
					request.getRequestDispatcher("homeColoc.jsp").forward(request,response);
				} else {
					// Wrong password
					response.sendRedirect("passNotMatch.jsp");
				}
			}
			if(op.equals("join")){
				String cName=request.getParameter("txtColocName");
				String pass=request.getParameter("txtPass");
				System.out.println(facade.userExists(cName, b64encode.getEncoder().encodeToString(pass.getBytes())));
				if( facade.colocExists(cName, b64encode.getEncoder().encodeToString(pass.getBytes()))){
					Coloc coloc = facade.getColoc(cName); 
					//HttpSession session= request.getSession();
					//User user = (User) session.getAttribute("sessionUser");
					user = facade.getUser(user.getUsername());
					facade.bindUserColoc(user, coloc);
					user = facade.getUser(user.getUsername());
					session.setAttribute("sessionUser", user);
					RequestDispatcher rd=request.getRequestDispatcher("homeColoc.jsp");
					rd.forward(request, response);
				} else {
					// Wrong coloc
					response.sendRedirect("error.jsp");
				}
			}
		} else {
			response.sendRedirect("mustBeLoggedIn.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}

