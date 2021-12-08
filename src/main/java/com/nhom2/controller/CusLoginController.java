package com.nhom2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhom2.data.*;
import com.nhom2.model.CusAccount;

/**
 * @email Ramesh Fadatare
 */
@WebServlet("/cuslogin")
public class CusLoginController extends HttpServlet {
    private static final long serialVersionUID = 1;
    private CusAccountDao cusDao;

    public void init() {
       cusDao = new CusAccountDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("Login/codefelogin.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            authenticate(request, response);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void authenticate(HttpServletRequest request, HttpServletResponse response)
    throws Exception {
        String cusphone = request.getParameter("cusphone");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        
        CusAccount cus = cusDao.validate(cusphone, password);
        if (cus != null) {
        	
        	session.setAttribute("cusphone", cus.getCusphone());
    		session.setAttribute("cusname", cus.getCusname());
    		int total = 0;
    		try {
    			total =  (int) session.getAttribute("total");
    		} catch (Exception e) {
    			total = 0;
    		}
    		
    		if (total == 0) {
    			RequestDispatcher dispatcher = request.getRequestDispatcher("MenuController");
            	dispatcher.forward(request, response);
    		}
            else {
            	RequestDispatcher dispatcher = request.getRequestDispatcher("Cart/test_cart.jsp");
            	dispatcher.forward(request, response);
            }
         }
         else {
        	request.setAttribute("mess", "wrong user or wrong password!!!");
        	
        	session.getAttribute("cusphone");
        	session.setAttribute("cusphone", "");
        	
        	session.getAttribute("cusname");
        	session.setAttribute("cusname", "");
        	
       	 	RequestDispatcher dispatcher = request.getRequestDispatcher("Login/codefelogin.jsp");
            dispatcher.forward(request, response);
            throw new Exception("Login not successful..");
        }
    }
}