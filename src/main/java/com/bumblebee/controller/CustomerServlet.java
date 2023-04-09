package com.bumblebee.controller;

import javax.servlet.http.HttpServlet;

import com.bumblebee.dao.CustomerDAO;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerDAO customerDAO;
//
//
//    public void init() throws ServletException {
//
//        customerDAO = new CustomerDAO();
//    }
//
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		String action = request.getServletPath();
//
//		switch (action)
//		{
//		case "/new":
//			showNewForm(request, response);
//			break;
//
//		case "/insert":
//			try {
//				insertCustomers(request, response);
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			break;
//
//		case "/delete":
//			try {
//				deleteCustomers(request, response);
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			break;
//
//		case "/edit":
//			try {
//				showEditForm(request, response);
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			break;
//
//		case "/update":
//			try {
//				updateCustomers(request, response);
//			} catch (IOException e) {
//				e.printStackTrace();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//			break;
//
//			default:
//				break;
//		}
//	}
//
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//		doGet(request, response);
//	}
//
//	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
//	{
//		RequestDispatcher dispatcher = request.getRequestDispatcher("customer/c_register.jsp");
//		dispatcher.forward(request, response);
//
//	}
//
//	// Insert Customers
//	private void insertCustomers(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException
//	{
//		String email       = request.getParameter("email");
//		String password    = request.getParameter("pass");
//		String dob         = request.getParameter("dateOfBirth");
//		String fullName    = request.getParameter("name");
//		double usedAmount  = 0.0;
//		double loanBalance = 15000.0;
//		String mobilePhone = request.getParameter("contact");
//		int iPlan          = 3;
//
//		CUSTOMERS newCustomer = new CUSTOMERS(email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan);
//
//		customerDAO.insertCustomers(newCustomer);
//		response.sendRedirect("list");
//
//	}
//
//	// Delete Customers
//	private void deleteCustomers(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException
//	{
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		try {
//			customerDAO.deleteUser(id);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//		response.sendRedirect("list");
//	}
//
//	//Display Edit Form
//	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
//
//		int id = Integer.parseInt(request.getParameter("id"));
//
//		CUSTOMERS existingUser = customerDAO.selectCustomers(id);
//
//		try {
//
//			RequestDispatcher dispatcher = request.getRequestDispatcher("customer/c_register.jsp");
//			request.setAttribute("customers", existingUser);
//			dispatcher.forward(request, response);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//
//	}
//
//	// Update Customer Details
//	private void updateCustomers(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//
//		int id = Integer.parseInt(request.getParameter("id"));
//		String email       = request.getParameter("email");
//		String password    = request.getParameter("pass");
//		String dob         = request.getParameter("dateOfBirth");
//		String fullName    = request.getParameter("name");
//		double usedAmount  = 0.0;
//		double loanBalance = 15000.0;
//		String mobilePhone = request.getParameter("contact");
//		int iPlan          = 3;
//
//		CUSTOMERS book = new CUSTOMERS(id, email, password, dob, fullName, usedAmount, loanBalance, mobilePhone, iPlan);
//		customerDAO.updateUser(book);
//		response.sendRedirect("list");
//	}
//
//
//	private void listUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
//
//		List<CUSTOMERS> listCustomers = customerDAO.selectAllCustomers();
//		request.setAttribute("listCustomers", listCustomers);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("customer/user-list.jsp");
//		dispatcher.forward(request, response);
//
//	}






}
