package com.nhom2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhom2.model.*;
import com.nhom2.data.*;

/**
 * Servlet implementation class HomeController
 */
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MenuController() {
        productDao = new ProductDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = productDao.listAllProduct();
		HttpSession session = request.getSession();
        
		session.setAttribute("discountNum", 0);
		session.setAttribute("listProduct", listProduct);
		session.setAttribute("check_filter","all" );
		session.setAttribute("sort_by","none" );
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Menu/Menu.jsp");
        dispatcher.forward(request, response);
        
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
