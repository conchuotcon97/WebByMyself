package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.*;
import model.*;
//import tools.SendMail;

@WebServlet("/UserController")

public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session1 = request.getSession();
		session1.setMaxInactiveInterval(600);
		boolean error = false;
		boolean err = false;
		String action = request.getParameter("hidAction");
		String name = request.getParameter("fullname");
		String name_error = "";
		String name_kitu = "";
		String email = request.getParameter("username");
		String email_error = "";
		String email_kitu = "";
		String pass = request.getParameter("password");
		String repass = request.getParameter("repassword");
		String pass_error = "";
		String pass_kitu = "";
		String pass_equal = "";
		System.out.println(
				"name: " + name + "---" + "user: " + email + "---" + "pass: " + pass + "---" + "repass: " + repass);
		String email_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
		// String email_REGEX1=
		// "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

//		if (action.equalsIgnoreCase("login")) {
//			User user = new User();
//			user.setUsername(request.getParameter("username"));
//			user.setPassword(request.getParameter("password"));
//			UserDao userdao = new UserDao();
//			userdao.login(user);
//			System.out.println(user);
//			if (user.isValid()) {
//				HttpSession session = request.getSession(true);
//				session.setAttribute("currentSessionUser", user);
//				response.sendRedirect("index.jsp");
//				System.out.println("login success");
//			} else {
//				response.sendRedirect("login.jsp?error=1");
//				System.out.println("login failed");
//			}
//		} else if (action.equalsIgnoreCase("update")) {
			if (email == null || email.equals("")) {
				email_error = "Email Can't Be Blank!";
				request.setAttribute("email_err", email_error);
				err = true;
				System.out.println("Khong bo trong email");
			} else {
				if (email.matches(email_REGEX)) {
					HttpSession session = request.getSession();
					session.setAttribute("user", email);
				} else {
					System.out.println("Sai cu phap user");
					email_kitu = "Wrong Syntax! Ex: example@example.com";
					request.setAttribute("email_kitu_err", email_kitu);
					err = true;
				}
			}

			if (name == null || name.equals("")) {
				name_error = "Full Name Can't Be Blank!";
				request.setAttribute("name_err", name_error);
				err = true;
				System.out.println("khong bo trong fullname");
			} else {
				if (name.length() > 3) {
					HttpSession session = request.getSession();
					session.setAttribute("fullname", name);
				} else {
					name_kitu = "Full Name Must Be At Least 4 Characters!";
					request.setAttribute("name_kitu_err", name_kitu);
					err = true;
					System.out.println("fullname khong du ki tu");
				}
			}

			if (pass == null || pass.equals("") && repass == null || repass.equals("")) {
				pass_error = "Password Can't Be Blank!";
				request.setAttribute("pass_err", pass_error);
				System.out.println("khong bo trong pass");
				err = true;
			} else {
				if (pass.length() > 5 && repass.length() > 5) {
					if (pass.equals(repass)) {
						System.out.println("Pass giong nhau");
					} else {
						pass_equal = "Password Dosen't Match The Confirm Password!. Type Both Passwords Again";
						request.setAttribute("pass_equal_err", pass_equal);
						err = true;
					}
				} else {
					pass_kitu = "Password Must be At Least 6 Characters!";
					request.setAttribute("pass_kitu_err", pass_kitu);
					err = true;
				}
			}

			if (err) {
				RequestDispatcher rD = getServletContext().getRequestDispatcher("/account/profile.jsp");
				rD.forward(request, response);
			} else {

				HttpSession session = request.getSession();
				User user = new User();
//				user.setId(Integer.parseInt(request.getParameter("id")));
//				user.setFullname(request.getParameter("fullname"));
//				user.setUsername(request.getParameter("username"));
//				user.setPassword(request.getParameter("password"));
//				user.setDate(request.getParameter("date"));
//				user.setGender(request.getParameter("gender"));
//				user.setPhoneNumber(request.getParameter("phone"));
//				user.setAddress(request.getParameter("address"));
//				user.setAvatar(request.getParameter("avatar"));
//				response.sendRedirect("account/profile.jsp?update=1");
//				session.setMaxInactiveInterval(3);
//				UserDao userdao = new UserDao();
//				userdao.update(user);
//			}
//		} else if (action.equalsIgnoreCase("register")) {
//			if (email == null || email.equals("")) {
//				email_error = "Email Can't Be Blank!";
//				request.setAttribute("email_err", email_error);
//				error = true;
//				System.out.println("Khong bo trong email");
//			} else {
//				if (email.matches(email_REGEX)) {
//					HttpSession session = request.getSession();
//					session.setAttribute("user", email);
//				} else {
//					System.out.println("Sai cu phap user");
//					email_kitu = "Wrong Syntax! Ex: example@example.com";
//					request.setAttribute("email_kitu_err", email_kitu);
//					error = true;
//				}
//			}
//
//			if (name == null || name.equals("")) {
//				name_error = "Full Name Can't Be Blank!";
//				request.setAttribute("name_err", name_error);
//				error = true;
//				System.out.println("khong bo trong fullname");
//			} else {
//				if (name.length() > 3) {
//					HttpSession session = request.getSession();
//					session.setAttribute("fullname", name);
//				} else {
//					name_kitu = "Full Name Must Be At Least 4 Characters!";
//					request.setAttribute("name_kitu_err", name_kitu);
//					error = true;
//					System.out.println("fullname khong du ki tu");
//				}
//			}
//
//			if (pass == null || pass.equals("") && repass == null || repass.equals("")) {
//				pass_error = "Password Can't Be Blank!";
//				request.setAttribute("pass_err", pass_error);
//				System.out.println("khong bo trong pass");
//				error = true;
//			} else {
//				if (pass.length() > 5 && repass.length() > 5) {
//					if (pass.equals(repass)) {
//						System.out.println("Pass giong nhau");
//					} else {
//						pass_equal = "Password Dosen't Match The Confirm Password!. Type Both Passwords Again";
//						request.setAttribute("pass_equal_err", pass_equal);
//						error = true;
//					}
//				} else {
//					pass_kitu = "Password Must be At Least 6 Characters!";
//					request.setAttribute("pass_kitu_err", pass_kitu);
//					error = true;
//				}
//			}
//
//			if (error) {
//				RequestDispatcher rD = getServletContext().getRequestDispatcher("/reg.jsp");
//				rD.forward(request, response);
//			} 
//			else {
//				User user = new User();
//				user.setFullname(request.getParameter("fullname"));
//				user.setUsername(request.getParameter("username"));
//				user.setPassword(request.getParameter("password"));
//				user.setDate(request.getParameter("ngsinh") + "/" + request.getParameter("tsinh") + "/"
//						+ request.getParameter("nsinh"));
//				user.setGender(request.getParameter("gender"));
//				user.setPhoneNumber(request.getParameter("phone"));
//				user.setAddress(request.getParameter("address"));
//				user.setAvatar(request.getParameter("avatar"));	
//				UserDao userdao = new UserDao();
//				userdao.addUser(user);
				
//				SendMail sm = new SendMail();
//	            sm.sendMail(user.getUsername(),"Nguyễn Minh Thư","Bạn đã đăng ký tài khoản thành công");
//				response.sendRedirect("reg.jsp?register=1");
				 
			}

		}

	}
//}
