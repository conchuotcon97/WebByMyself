package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDB;
import model.User;

/**
 * Servlet implementation class AcountServlet
 */
@WebServlet("/AcountServlet")
public class AcountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AcountServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(" nek bong oi");
		String url = "/register.jsp";
		// get curent action
		String action = request.getParameter("action");
		if (action == null) {
			action = "join";
		}
		if (action.equals("join")) {
			url = "/register.jsp";
		} else if (action.equals("add")) {
			// get parameter from the request
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
//			User user = new User(firstName, lastName, email, password);
//			UserDB.insert(user);
//
//			request.setAttribute("user", user);
			url = "/thanks.jsp";

		}
		getServletContext().getRequestDispatcher(url).forward(request, response);
	}

}
