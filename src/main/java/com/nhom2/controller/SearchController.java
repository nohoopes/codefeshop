package com.nhom2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.nhom2.data.ProductDAO;
import com.nhom2.model.*;
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDao;

    /**
     * Default constructor. 
     */
    public SearchController() {
        // TODO Auto-generated constructor stub
    	productDao = new ProductDAO();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
		
    	String search_name = request.getParameter("search-info").trim();
    	String sort_by =  request.getParameter("sortby").trim();
    	String selection = request.getParameter("selection").trim();
		
		List<Product> listProduct = new ArrayList<Product>();
		listProduct = productDao.listSelectTypeProduct(search_name,selection,sort_by);	
		session.setAttribute("listProduct", listProduct);	
		
		String check = selection;
		request.setAttribute("check_filter", check);
		request.setAttribute("search_name", search_name);
		request.setAttribute("sort_by", sort_by);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/Menu/Menu.jsp");
        dispatcher.forward(request, response);
		
		        
	}

	private boolean not(boolean equals) {
		// TODO Auto-generated method stub
		return false;
	}

}
