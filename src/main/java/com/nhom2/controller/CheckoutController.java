package com.nhom2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public void init() {
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	String cusname;
    	try {
    		cusname = session.getAttribute("cusname").toString();
    	} catch (Exception e) {
    		cusname = "eeeee";
    	}
    	    	
    	if (cusname.equals("eeeee")) {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("CusLoginController");
            dispatcher.forward(request, response);
    	}
    	else {
    		RequestDispatcher dispatcher = request.getRequestDispatcher("Cart/test_cart.jsp");
            dispatcher.forward(request, response);
    	}
    }
}