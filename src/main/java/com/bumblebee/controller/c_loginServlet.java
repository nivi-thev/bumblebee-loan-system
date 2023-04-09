package com.bumblebee.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class c_loginServlet
 */
@WebServlet("/login")
public class c_loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("username");
		String password = request.getParameter("password");

		HttpSession session = request.getSession();
		javax.servlet.RequestDispatcher dispatcher = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/bumblebee", "root", "");
			PreparedStatement pst = con.prepareStatement("select * from CUSTOMERS where email = ? and password = ?");


			pst.setString(1, email);
			pst.setString(2, password);



			ResultSet rs = pst.executeQuery();



			if (rs.next()) {

				session.setAttribute("status", "success");
				session.setAttribute("fullName", rs.getString("fullName"));
				session.setAttribute("loanBalance", rs.getString("loanBalance"));
				session.setAttribute("usedAmount", rs.getString("usedAmount"));
				session.setAttribute("iPlan", rs.getString("iPlan"));
				session.setAttribute("mobilePhone", rs.getString("mobilePhone"));
				session.setAttribute("dob", rs.getString("dob"));
				session.setAttribute("email", rs.getString("email"));

				response.sendRedirect("customer/c_homepage.jsp");



			} else {
				session.setAttribute("status", "failed");
				response.sendRedirect("customer/c_login.jsp");
			}

			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
