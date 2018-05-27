package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.messaging.jmq.jmsserver.core.Session;

import dao.ProductDao;
import model.Product;

/**
 * Servlet implementation class ProductManagerServlet
 */
@WebServlet("/ProductManagerServlet")
public class ProductManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductManagerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String url = "";
		switch (action) {

		case "delete":
			boolean a=ProductDao.deleteProduct(request.getParameter("productCode"));
			System.out.println(a);
			url = "/admin_managerment/product_manager.jsp";
			break;
		}
//		RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
//		rd.forward(request, response);
		response.sendRedirect(String.format("%s%s", request.getContextPath(), url));
//		response.sendRedirect(url);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String url = "", error = "";
		switch (action) {
		case "update":
			String id = request.getParameter("id").trim();
			String price = request.getParameter("price").trim();
			Product p = ProductDao.getProduct(id);
			ProductDao.updateProduct(id, Double.parseDouble(price));
			url = "/admin_managerment/product_manager.jsp";
			break;
		case "insert":
			String code = request.getParameter("id");
			String name = request.getParameter("name");
			String description = request.getParameter("description");
			String type = request.getParameter("type");
			String category = request.getParameter("category");

			String productPrice = request.getParameter("price");
			String path = request.getParameter("url");
			ProductDao.insertProduct(
					new Product(code, name, description, path, Double.parseDouble(productPrice), category));
			url = "/admin_managerment/product_manager.jsp";
			break;
		default:
			break;
		}
		// getServletContext().getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(String.format("%s%s", request.getContextPath(), url));
	}

}
