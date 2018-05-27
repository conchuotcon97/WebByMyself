package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import dao.UserDB;
import model.User;

/**
 * Servlet implementation class LoginHading
 */
@WebServlet("/LoginHanding")
public class LoginHanding extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginHanding() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		User u = new User();
		u.setEmail(email);
		u.setPassword(pass);

		boolean result = UserDB.checkLogin(u);
		if (result == true) {

			HttpSession session = request.getSession();
			session.setAttribute("user", u);
			getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
//			response.sendRedirect("index.jsp");

		} else {
			response.sendRedirect("lab2/login.jsp?err=1");
			// getServletContext().getRequestDispatcher("lab2/login.jsp?err=1").forward(request,
			// response);

		}

	}

}
