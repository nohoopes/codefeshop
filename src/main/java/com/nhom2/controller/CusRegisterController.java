package com.nhom2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nhom2.data.CusAccountDao;
import com.nhom2.model.CusAccount;

/**
 * @email Ramesh Fadatare
 */

@WebServlet("/cusregister")
public class CusRegisterController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CusAccountDao cusDao;

    public void init() {
        cusDao = new CusAccountDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        register(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.sendRedirect("codefelogin.jsp");
    }
    
    private void register(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String cusphone = request.getParameter("cusphone");
        String cusname = request.getParameter("cusname");
        String password = request.getParameter("password");

        CusAccount cus = new CusAccount();
        cus.setCusphone(cusphone);
        cus.setPassword(password);
        cus.setCusname(cusname);

        cusDao.saveUser(cus);
        
        HttpSession session = request.getSession();
        session.setAttribute("cusname", cus.getCusname());
        session.setAttribute("cusphone", cus.getCusphone());
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
}