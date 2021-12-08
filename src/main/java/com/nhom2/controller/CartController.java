package com.nhom2.controller;

import java.io.IOException;
import java.net.URL;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhom2.data.ProductDAO;
import com.nhom2.model.*;

/**
 * Servlet implementation class CartController
 */
public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;

    /**
     * Default constructor. 
     */
    public CartController() {
        // TODO Auto-generated constructor stub
    	productDao = new ProductDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// TODO Auto-generated method stub
				ServletContext sc = getServletContext();
		        
		        // get current action
		        String action = request.getParameter("action");
		        if (action == null) {
		            action = "CartController";  // default action
		        }
		        
		        
		        
	            String productId = request.getParameter("productId");
	            String quantityString = request.getParameter("quantity");
                String check_cart = "uncheck";
                
	            HttpSession session = request.getSession(false);
	            int total = 0;
	            int number = 0;
	            Cart cart = (Cart) session.getAttribute("cart");
	            if (cart == null) {
	                cart = new Cart();
	            }
	            
	            //if the user enters a negative or invalid quantity,
	            //the quantity is automatically reset to 1.
	            int quantity;
	            try {
	                quantity = Integer.parseInt(quantityString);
	                if (quantity < 0) {
	                    quantity = 1;
	                }
	                check_cart = "checked";
	            } catch (NumberFormatException nfe) {
	                quantity = 1;
	           
	            }

	            // String path = sc.getRealPath("/WEB-INF/products.txt");
	            // Product product = ProductIO.getProduct(productCode, path);
	            
	            // JDBC
	            Product product = null;
				product = productDao.getProduct(Integer.parseInt(productId));
	            

	            LineItem lineItem = new LineItem();
	            lineItem.setProduct(product);
	            lineItem.setQuantity(quantity);
	            if (quantity > 0) {
	                cart.addItem(lineItem);
	            } else if (quantity == 0) {
	                cart.removeItem(lineItem);
	            }
	            try {
	            	for(int i=0;i<cart.getCount();i++) {
	            		total += cart.getItems().get(i).getProduct().getPrice()*cart.getItems().get(i).getQuantity();
	            		number += cart.getItems().get(i).getQuantity();
	            	}
	            }
	            catch (NumberFormatException nfe){
	            	total =0;
	            }
	            
	           
	            session.setAttribute("total", total);
	            session.setAttribute("final", total);
	            session.setAttribute("number", number);
	            session.setAttribute("cart", cart);
	            

	            
	            request.getRequestDispatcher(request.getParameter("viewid")).forward(request, response);
		        
	}

}
