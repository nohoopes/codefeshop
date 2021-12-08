package com.nhom2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhom2.data.BillDAO;
import com.nhom2.model.Bill;
import com.nhom2.model.Mail;

public class ShipCODController extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    
	    Bill bil = new Bill();
	    bil.setCusname(session.getAttribute("cusname").toString());
	    bil.setAddress(session.getAttribute("cusaddress").toString());
	    bil.setPhone(session.getAttribute("cusphone").toString());
	    bil.setEmail(session.getAttribute("cusmail").toString());
	    bil.setTotal( (int) session.getAttribute("final") );
	    int discount =0;
	    try {
	    	discount = (int) session.getAttribute("total") - (int) session.getAttribute("final");
	    }
	    catch (Exception a){
	    	discount =0;
	    }
	    bil.setdiscount(discount);
	    bil.setStatus("On delivery");
	    bil.setMethod("COD");
	    
	    BillDAO conBil = new BillDAO();
	    conBil.addBill(bil);
	    
	    Mail mail= new Mail();
	    //  mail.Send(bil.getAddress().toString(), "Your purchase bill", "Thank you, "+bil.getCusname()+". Your purchase was successful, your total money is: "+bil.getTotal()+", your product will be devileried as soon as possible. Hope you have a greatful time when choosing your products!");
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("Cart/SHIPCOD.jsp");
        dispatcher.forward(request, response);
	}
	
	
}
