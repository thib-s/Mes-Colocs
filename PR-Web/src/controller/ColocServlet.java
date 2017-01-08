package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;
/**
 * Servlet implementation class ColocServlet
 */
public class ColocServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@EJB 
	model.Facade facade;
	
	public ColocServlet(){
		super();
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("ok");
		if(op.equals("shop")){
			String nature=request.getParameter("txtNature");
			String quantity=request.getParameter("txtQuantity");
			String cancel=request.getParameter("txtCancel");
			String cancelAll=request.getParameter("txtCancelAll");
		}
		if(op.equals("task")){
			String nature=request.getParameter("txtNature");
			String name=request.getParameter("txtName");
			String deadline=request.getParameter("txtDeadline");
			String cancel=request.getParameter("txtCancel");
		}
		if(op.equals("Exp")){
			// MAnque des choses
			String add=request.getParameter("txtAdd");
		}
		if(op.equals("Agen")){
			String addEvent=request.getParameter("txtAddEvent");
		}
		if(op.equals("Near")){
			String place=request.getParameter("txtPlace");
		}
		if(op.equals("Pict")){
			// Gestion image
		}
		if(op.equals("admin")){
			// Administrer
		}
		if(op.equals("leav")){
			String pass=request.getParameter("txtPass");
		}
		
		if(op.equals("checkNearBy")) {
			HttpSession session = request.getSession();
			User u = (User)session.getAttribute("sessionUser");
			System.out.println(u.getMyColoc().getBlazColoc());
			request.setAttribute("list", facade.getNearbyColoc(u.getMyColoc()));
			RequestDispatcher rd=request.getRequestDispatcher("nearbyColocs.jsp");
			rd.forward(request, response);
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}