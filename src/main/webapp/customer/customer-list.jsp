<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
	String id = request.getParameter("userid");
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:4306/bumblebee";
	
	String userid = "root";
	String password = "";
	try {
	Class.forName(driver);
	} catch (ClassNotFoundException e) {
	e.printStackTrace();
	}
	Connection connection = null;
	Statement statement = null;
	ResultSet resultSet = null;
%>


<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body bgcolor=”#800000">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<a href="https://www.xadmin.net" class="navbar-brand"> User
					Management Application </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="../admin/a_writeCustomer" class="btn btn-success">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Full Name</th>
						<th>Email</th>
						<th>Used Amount</th>
						<th>Loan Balance</th>
						<th>Date Of Birth</th>
						<th>Mobile Phone</th>
					</tr>
				</thead>
				<tbody>

					<%
						try{
							connection = DriverManager.getConnection(connectionUrl, userid, password);
							statement=connection.createStatement();
							String sql ="select * from CUSTOMERS";
							resultSet = statement.executeQuery(sql);
							
							while(resultSet.next()){
								%>
					<tr>
						<td><%=resultSet.getString("id") %></td>
						<td><%=resultSet.getString("fullName") %></td>
						<td><%=resultSet.getString("email") %></td>
						<td><%=resultSet.getString("usedAmount") %></td>
						<td><%=resultSet.getString("loanBalance") %></td>
						<td><%=resultSet.getString("dob") %></td>
						<td><%=resultSet.getString("mobilePhone") %></td>
						<td><a
							href="edit?id=<c:out value='${resultSet.getString("id")}' />">Edit</a>
							&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="delete?id=<c:out value='${resultSet.getString("id")}' />">Delete</a></td>


					</tr>
					<%
							}
							
							connection.close();
							
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>

				</tbody>

			</table>
		</div>
	</div>
</body>
</html>
