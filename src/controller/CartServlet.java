package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LineItemDao;
import dao.ProductDao;
import model.Cart;
import model.LineItem;
import model.Product;
import model.User;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// String action = request.getParameter("action");
		// if (action == null) {
		// action = "cart";
		// }
		// String url = "/lab6/products.jsp";

		// if (action.equals("shop")) {
		// url = "/lab6/products.jsp";
		// } else if (action.equals("cart")) {
		// String productCode = request.getParameter("productCode");
		// String quantityString = request.getParameter("quantity");
		// HttpSession session = request.getSession();
		//
		// Cart cart = (Cart) session.getAttribute("cart");
		// if (cart == null) {
		// cart = new Cart();
		// }
		// int quantity;
		// try {
		// quantity = Integer.parseInt(quantityString);
		// if (quantity < 0) {
		// quantity = 1;
		//
		// }
		// } catch (NumberFormatException e) {
		// quantity = 1;
		// }
		//
		// Product product = ProductDao.getProduct(productCode);
		// LineItem lineItem = new LineItem();
		// lineItem.setProduct(product);
		// lineItem.setQuantity(quantity);
		// if (quantity > 0) {
		// cart.addItem(lineItem);
		//
		// } else if (quantity == 0) {
		// cart.removeItem(lineItem);
		// }
		//
		// session.setAttribute("cart", cart);
		// url = "/lab6/cart.jsp";
		//
		// } else if (action.equals("invoice"))
		//
		// {
		// url = "/invoice.jsp";
		// }

		// getServletContext().getRequestDispatcher("index.jsp").forward(request,
		// response);
		String command = request.getParameter("command");
		String productCode = request.getParameter("productCode");
		String quantityString = request.getParameter("quantity");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		String url = "labs/lab5/products.jsp";
		try {
			int quantity = Integer.parseInt(quantityString);
			Product product = ProductDao.getProduct(productCode);

			switch (command) {
			case "plus":
				if (cart.lookup(productCode) != null) {
					cart.addItem(new LineItem(product, cart.lookup(productCode).getQuantity() + 1));
				} else {
					cart.addItem(new LineItem(product, quantity));
				}
				url = "labs/lab5/cart.jsp";
				break;

			default:
				break;
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
		session.setAttribute("cart", cart);
		// getServletContext().getRequestDispatcher(url).forward(request, response);
		response.sendRedirect(url);
	}

}
