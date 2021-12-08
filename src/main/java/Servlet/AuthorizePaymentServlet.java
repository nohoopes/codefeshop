/**
 * AuthorizePaymentServlet class - requests PayPal for payment.
 * @author Nam Ha Minh
 * @copyright https://codeJava.net
 */
package Servlet;

import java.io.IOException;
import java.net.URISyntaxException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.base.rest.PayPalRESTException;
import model.paypal.OrderDetail;
import model.paypal.PaymentServices;
import model.paypal.URLUtil;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AuthorizePaymentServlet() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ServletContext sc = getServletContext();
		HttpSession session = request.getSession();
		//String product = request.getParameter("product");
		String product = " order from you!";
		String subtotal = String.valueOf(session.getAttribute("USD"));
		String shipping = "0";  //String.valueOf(session.getAttribute("shipping"));
		String tax = "0"; //String.valueOf(session.getAttribute("tax"));
		
		String total = subtotal;
		String firstname = "";
		String lastname = String.valueOf(session.getAttribute("cusname"));
		String email = String.valueOf(session.getAttribute("cusmail"));
		String cancel_url = null;
		String return_url = null;
		try {
			cancel_url = URLUtil.getCurrentUrl(request) + "cancel.jsp";
			return_url = URLUtil.getCurrentUrl(request) + "review_payment";
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		OrderDetail orderDetail = new OrderDetail(product, subtotal, shipping, tax, total);
		try {
			PaymentServices paymentServices = new PaymentServices();
			String approvalLink = paymentServices.authorizePayment(orderDetail, firstname, lastname, email, cancel_url,  return_url);

			response.sendRedirect(approvalLink);
			
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error.jsp")
					.forward(request, response);
		}
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
}
