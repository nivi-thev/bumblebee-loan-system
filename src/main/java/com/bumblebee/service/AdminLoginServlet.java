package com.bumblebee.service;

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
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminEmail = request.getParameter("admin_email");
		String adminPassword = request.getParameter("admin_password");

		HttpSession session = request.getSession();
		javax.servlet.RequestDispatcher dispatcher = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:4306/bumblebee", "root", "");
			PreparedStatement pst = con.prepareStatement("select * from ADMIN where adminEmail = ? and adminPassword = ?");


			pst.setString(1, adminEmail);
			pst.setString(2, adminPassword);



			ResultSet rs = pst.executeQuery();



			if (rs.next()) {

				session.setAttribute("status", "success");
				session.setAttribute("adminEmail", rs.getString("adminEmail"));
				session.setAttribute("adminID", rs.getString("id"));


				response.sendRedirect("admin/a_homepage.jsp");



			} else {
				session.setAttribute("status", "failed");
				response.sendRedirect("admin/a_login.jsp");
			}

			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String adminEmail = request.getParameter("admin_email");
		String adminPassword = request.getParameter("admin_password");

		HttpSession session = request.getSession();
		javax.servlet.RequestDispatcher dispatcher = null;


			try{

				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:4306/bumblebee", "root", "admin123");
				PreparedStatement pst = conn.prepareStatement("SELECT COUNT(id) as email FROM CUSTOMERS");

				ResultSet resultSet = pst.executeQuery();


				while(resultSet.next()){

					session.setAttribute("count", resultSet);

				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}


	}

}
