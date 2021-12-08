package com.nhom2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PaymentController extends HttpServlet{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		    throws ServletException, IOException {
				String payment = "";
		        try {
		        	payment = request.getParameter("moreidea");
		        } catch (Exception e) {
		        	payment = "";
		        }
		        String name = request.getParameter("name");
		        String phone = request.getParameter("phone");
		        String mail = request.getParameter("email");
		        String address = request.getParameter("address");
		        		        
		        HttpSession session = request.getSession();
		        session.setAttribute("cusname", name);
		        session.setAttribute("cusphone", phone);
		        session.setAttribute("cusmail", mail);
		        session.setAttribute("cusaddress", address);
		        if (payment.equals("Paypal")) {
		        	int fin = (int) session.getAttribute("final");
		        	float USD = fin / 20000;
		        	session.setAttribute("USD", USD);
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("authorize_payment");
		        	dispatcher.forward(request, response);
		        }
		        else if (payment.equals("Vnpay")) {
		        	int fin = (int) session.getAttribute("final");
		        	session.setAttribute("vnpaymoney", fin);
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("vnpay_main.jsp");
		        	dispatcher.forward(request, response);
		        }
		        else if (payment.equals("Ship")) {
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("ShipCODController");
		        	dispatcher.forward(request, response);
		        }
		        else {
		        	RequestDispatcher dispatcher = request.getRequestDispatcher("Cart/error.jsp");
		        	dispatcher.forward(request, response);
		        }
		    }
}
