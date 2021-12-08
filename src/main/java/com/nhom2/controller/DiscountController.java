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

import com.nhom2.data.DiscountDAO;
import com.nhom2.model.Discount;

public class DiscountController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DiscountDAO discountDao;
	
	public DiscountController() {
        discountDao = new DiscountDAO();
        // TODO Auto-generated constructor stub
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		List<Discount> listDiscount = new ArrayList<Discount>();
		listDiscount = discountDao.listAllDiscount();
		System.out.print("test discount controller");
		String code = "";
		try {
		code = request.getParameter("discount").trim();
		} catch (Exception e) {
		}
		int discountNum = 0;
		HttpSession session = request.getSession();
		
		int total = (int) session.getAttribute("total");
		
		for (int i = 0; i<listDiscount.size(); i++) {
			if (code.equals(listDiscount.get(i).getCode())) {
				if (listDiscount.get(i).getType().equals("percent")) {
					discountNum = (total/100)*listDiscount.get(i).getUnit();
					session.setAttribute("final", total - discountNum);
					request.setAttribute("discountNum", discountNum);
				}
				else if (listDiscount.get(i).getType().equals("unit")) {
					discountNum = listDiscount.get(i).getUnit();
					session.setAttribute("final", total - discountNum);
					request.setAttribute("discountNum", discountNum);
				}
			}
		}
		
		if (discountNum == 0) {
			session.setAttribute("final", total);
			request.setAttribute("discountNum", "0");
			request.setAttribute("Error", "Wrong discount code, please try again");
			System.out.println("Ore");
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Cart/test_cart.jsp");
        dispatcher.forward(request, response);
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}