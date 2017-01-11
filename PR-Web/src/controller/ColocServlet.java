package controller;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
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
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("sessionUser");
		if(user != null) {
			if(op.equals("logOut")){
				session.invalidate();
				response.sendRedirect("login.jsp");
			}
			if(op.equals("addItem")){
				Coloc coloc = facade.getColoc(user.getMyColoc().getBlazColoc());
				String item =request.getParameter("txtItem");
				String txtQuantity=request.getParameter("txtQuantity");
				int quantity = Integer.parseInt(txtQuantity);

				facade.addItemToShoppingList(coloc,item,quantity);

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
				System.out.println(user.getMyColoc().getBlazColoc());
				request.setAttribute("list", facade.getNearbyColoc(user.getMyColoc()));
				request.setAttribute("listPins", facade.getNearbyColocPins(user.getMyColoc()));
				RequestDispatcher rd=request.getRequestDispatcher("nearbyColocs.jsp");
				rd.forward(request, response);
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