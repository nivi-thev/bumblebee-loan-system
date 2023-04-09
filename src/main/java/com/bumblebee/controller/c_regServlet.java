package com.bumblebee.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class c_regServlet
 */
@WebServlet("/register")
public class c_regServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String fullName     = request.getParameter("name");
		String email        = request.getParameter("email");
		String password     = request.getParameter("pass");
		String dob          = request.getParameter("dateOfBirth");
		String mobilePhone  = request.getParameter("contact");
		double usedAmount   = 0.0;
		double loanBalance  = 15000.0;
		int iPlan           = 3;

		javax.servlet.RequestDispatcher dispatcher = null;
		Connection con = null;
		HttpSession session = request.getSession();

		if(fullName == null)
		{

			session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
			response.sendRedirect("customer/register.jsp");
		}

		else {


		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:4306/bumblebee", "root", "");
			PreparedStatement pst = con.prepareStatement("insert into CUSTOMERS(email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan) values(?,?,?,?,?,?,?,?)");
			pst.setString(1, email);
			pst.setString(2, password);
			pst.setString(3, dob);
			pst.setString(4, fullName);
			pst.setDouble(5, usedAmount);
			pst.setDouble(6, loanBalance);
			pst.setString(7, mobilePhone);
			pst.setInt(8, iPlan);



			int rowCount = pst.executeUpdate();
			dispatcher = request.getRequestDispatcher("customer/c_login.jsp");

			if(rowCount > 0) {

				response.sendRedirect("customer/c_login.jsp");
				request.setAttribute("status", "success");

			}

			else {
				response.sendRedirect("customer/c_register.jsp");
				request.setAttribute("status", "failed");
			}

			dispatcher.forward(request, response);





		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
		}
	}




}
