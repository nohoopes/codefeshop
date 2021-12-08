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

import com.nhom2.data.ContactDAO;
import com.nhom2.model.Contact;

/**
 * @email Ramesh Fadatare
 */

public class ContactController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ContactDAO conDAO;

    public void init() {
        conDAO = new ContactDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String conname = request.getParameter("Name");
        String conphone = request.getParameter("Phone");
        String conmail = request.getParameter("Email");
        String message = request.getParameter("Message");
        
        System.out.print("conname");
        request.setAttribute("Name2", conname);
        
        Contact con = new Contact();
	    con.setConName(conname);
	    con.setConPhone(conphone);
	    con.setConMail(conmail);
	    con.setMessage(message);
	    
        conDAO.saveContact(con);
        
    	RequestDispatcher dispatcher = request.getRequestDispatcher("Contact/Contact.jsp");
    	dispatcher.forward(request, response);
    }
    
}