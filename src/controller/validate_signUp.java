package controller;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class validate_signUp
 */
@WebServlet("/validate_signUp")
public class validate_signUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validate_signUp() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "/finish-login-up.jsp";
		String urlBack = "/lap3.jsp";

		System.out.println(request.getContextPath() + request.getLocalAddr());
		String account = request.getParameter("account");
		String pass = request.getParameter("pass");
		String confirmPass = request.getParameter("confirmPass");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		// String birthDay = request.getParameter("birthDay");
		String phone = request.getParameter("phone");
		System.out.println("account: " + account);

		// hạn chế dung session

		if (account.equals("")) {
			request.setAttribute("errAccount", "Bạn không được để trống tài khoản!");
			url = urlBack;
		} else {

			request.setAttribute("account", account);
			request.setAttribute("errAccount", "OK");
		}
		if (name.equals("")) {
			request.setAttribute("errName", "Bạn không được để trống tên!");
			url = urlBack;
		} else {
			request.setAttribute("errName", "OK");
			request.setAttribute("name", name);

		}
		if (pass.equals("")) {
			request.setAttribute("errPass", "Bạn không được để trống mật khẩu!");
			url = urlBack;
		} else {
			request.setAttribute("pass", pass);
			request.setAttribute("errPass", "OK");
		}

		if (confirmPass.equals("")) {
			request.setAttribute("errConfirmPass", "Bạn không được để trống xác nhận mật khẩu!");
			url = urlBack;

		} else {
			if (!pass.equals(confirmPass)) {
				request.setAttribute("errConfirmPass", "Mật khẩu không giống bạn đã đặt");
				url = urlBack;
			} else {
				request.setAttribute("confirmPass", confirmPass);
				request.setAttribute("errConfirmPass", "OK");

			}
		}

		if (email.equals("")) {
			request.setAttribute("errEmail", "Bạn không đươc để trống email!");
			url = urlBack;
		} else {
			Pattern emailPattern = Pattern.compile("\\w+@\\w+(\\.\\w+)*");
			Matcher emailMatcher = emailPattern.matcher(email);
			if (!emailMatcher.matches()) {
				request.setAttribute("errEmail", "Email không hợp lệ");
				request.setAttribute("email", email);
				url = urlBack;
			} else {
				request.setAttribute("errEmail", "OK");
				request.setAttribute("email", email);
			}
		}
		if (phone.equals("")) {
			request.setAttribute("errPhone", "Bạn không được để trống số điện thoại (Gồm 11 số bất kỳ từ 0-9)!");
			url = urlBack;
		} else {
			Pattern phonePattern = Pattern.compile("\\d{11}");
			Matcher phonelMatcher = phonePattern.matcher(phone);
			if (!phonelMatcher.matches()) {
				request.setAttribute("errPhone", "Số điện thoại không đúng(Gồm 11 số bất kỳ từ 0-9)");
				request.setAttribute("phone", phone);
			} else {

				request.setAttribute("errPhone", "OK");
				request.setAttribute("phone", phone);
			}
		}

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
