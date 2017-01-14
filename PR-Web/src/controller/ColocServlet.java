package controller;

import java.io.IOException;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

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
	private static Base64 b64encode ;
	@EJB 
	model.Facade facade;

	public ColocServlet(){
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String op = request.getParameter("ok");
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("sessionUser");
		user = facade.getUser(user.getUsername());
		if((user != null)&&(op != null)) {
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
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("shopColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("addTask")){
				Coloc coloc = user.getMyColoc();
				String date = request.getParameter("txtDate");
				String doer = request.getParameter("txtDoer");
				String desc = request.getParameter("txtDesc");
				facade.addTask(date, doer, desc, coloc);
				HashMap<String, List<Task>> tasksMap = (HashMap<String, List<Task>>)coloc.getTasks();
				request.setAttribute("tasksMap", tasksMap);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("tasksColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("task")){
				Coloc coloc = user.getMyColoc();
				HashMap<String, List<Task>> tasksMap = (HashMap<String, List<Task>>)coloc.getTasks();
				request.setAttribute("tasksMap", tasksMap);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("tasksColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("Exp")){
				// MAnque des choses
				String add=request.getParameter("txtAdd");
			}
			if(op.equals("addEvent")){
				Coloc coloc = user.getMyColoc();
				String date = request.getParameter("txtDate");
				String time = request.getParameter("txtTime");
				String desc = request.getParameter("txtDesc");
				facade.addEvent(date, time, desc, coloc);
				HashMap<Date, List<Event>> eventsMap = (HashMap<Date, List<Event>>)coloc.getEvents();
				request.setAttribute("eventsMap", eventsMap);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("agendaColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("rmEvent")){
				Coloc coloc = user.getMyColoc();
				String date = request.getParameter("txtDate");
				String time = request.getParameter("txtTime");
				String desc = request.getParameter("txtDesc");
				facade.removeEvent(date, time, desc, coloc);
				HashMap<Date, List<Event>> eventsMap = (HashMap<Date, List<Event>>)coloc.getEvents();
				request.setAttribute("eventsMap", eventsMap);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("agendaColoc.jsp");
				rd.forward(request, response);
			}
			if (op.equals("Agen")) {
				Coloc coloc = user.getMyColoc();
				HashMap<Date, List<Event>> eventsMap = (HashMap<Date, List<Event>>)coloc.getEvents();
				request.setAttribute("eventsMap", eventsMap);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("agendaColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("Pict")){
				// Gestion image
			}
			if(op.equals("leave")){
				String pass=request.getParameter("txtPass");
				
				if(facade.userExists(user.getUsername(), b64encode.getEncoder().encodeToString(pass.getBytes()))){
					facade.removeUserFromColoc(user);
				}
				user.setMyColoc(null);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("menuLoggedIn.jsp");
				rd.forward(request, response);
			}
			if(op.equals("checkNearBy")) {
				System.out.println(user.getMyColoc().getBlazColoc());
				request.setAttribute("list", facade.getNearbyColoc(user.getMyColoc()));
				request.setAttribute("listPins", facade.getNearbyColocPins(user.getMyColoc()));
				RequestDispatcher rd=request.getRequestDispatcher("nearbyColocs.jsp");
				rd.forward(request, response);
			}
			if(op.equals("changeName")){
				String cName = request.getParameter("txtNewColocName");
				String pass = request.getParameter("txtPass");
				
				Coloc c = user.getMyColoc();
				if(facade.colocMatchPass(c, b64encode.getEncoder().encodeToString(pass.getBytes()))){
					facade.changeColocName(c,cName);
				}
				user.getMyColoc().setBlazColoc(cName);
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("adminColoc.jsp");
				rd.forward(request, response);
			}
			if(op.equals("changeAddress")){
				String cAddress = request.getParameter("txtNewColocAddress");
				String cCity = request.getParameter("txtNewColocCity");
				String cCountry = request.getParameter("txtNewColocCountry");
				String pass = request.getParameter("txtPass");
				Coloc c = user.getMyColoc();
				if(facade.colocMatchPass(c, b64encode.getEncoder().encodeToString(pass.getBytes()))){
					facade.changeColocAddress(c, cAddress, cCity, cCountry);
				}
				request.setAttribute("sessionUser", user);
				RequestDispatcher rd=request.getRequestDispatcher("adminColoc.jsp");
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