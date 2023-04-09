package com.bumblebee.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bumblebee.dao.OrderDAO;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	   private OrderDAO orderDAO;
	    
	    public void init() {
	        orderDAO = new OrderDAO();
	    }

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        try {
	            String productId = request.getParameter("id");
	            int rowsAffected = orderDAO.addOrder(productId);
	            if (rowsAffected > 0) {
	                response.getWriter().println("<h2>Order placed successfully!</h2>");
	                response.sendRedirect("customer/c_homepage.jsp");
	            } else {
	                response.getWriter().println("<h2>Failed to place order!</h2>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    

}
