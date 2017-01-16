package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import model.User;


public class UploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String PATH="/home/titou/softs/jboss/standalone/deployments/PicsMesColocs/";


	@EJB 
	model.Facade facade;
	/**
	 * Default constructor.
	 */

	public UploadServlet() {
		super();

	}



	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("sessionUser");
		String op = request.getParameter("send");
		if(user != null) {
			System.out.println("ON EST ICIC");
			//if(op.equals("send")){
				System.out.println("ON EST LA");

				try {

					List<FileItem> items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);

					for (FileItem item : items) {

						if (item.isFormField()) {

							/* Traiter les champs classiques ici (input type="text|radio|checkbox|etc", select, etc). */

						} else {

							/* Traiter les champs de type fichier (input type="file"). */
							InputStream fileContent = item.getInputStream();
							int content;
							int numberPic = user.getMyColoc().getPics()+1;
							FileOutputStream output = new FileOutputStream(PATH + user.getMyColoc().getBlazColoc()+"/Pic" + numberPic+".png");

							while((content = fileContent.read()) != -1) {
								output.write(content);
							}
							output.close();
							facade.addPic(user);
							user.getMyColoc().addPic();
							RequestDispatcher rd=request.getRequestDispatcher("picsColoc.jsp");
							rd.forward(request, response);


						}

					}

				} catch (FileUploadException e) {

					throw new ServletException("Échec de l'analyse de la requête multipart.");

				}
			}
	//	}

		}


		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processRequest(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processRequest(request, response);
		}

	}
