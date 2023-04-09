<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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


<!DOCTYPE html>
<html lang="en">

<head>
<title>ADMIN PANEL</title>
<!-- HTML5 Shim and Respond.js IE9 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
     <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
     <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
     <![endif]-->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
<!-- Favicon icon -->
<link rel="shortcut icon" href="assets/images/favicon.png"
	type="image/x-icon">
<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">

<!-- Google font-->
<link href="https://fonts.googleapis.com/css?family=Ubuntu:400,500,700"
	rel="stylesheet">

<!-- themify -->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/icon/themify-icons/themify-icons.css">

<!-- iconfont -->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/icon/icofont/css/icofont.css">

<!-- simple line icon -->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/icon/simple-line-icons/css/simple-line-icons.css">

<!-- Required Fremwork -->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/plugins/bootstrap/css/bootstrap.min.css">

<!-- Chartlist chart css -->
<link rel="stylesheet"
	href="../css/c_dashboard/plugins/chartist/dist/chartist.css"
	type="text/css" media="all">

<!-- Weather css -->
<link href="../css/c_dashboard/css/svg-weather.css" rel="stylesheet">


<!-- Style.css -->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/css/main.css">

<!-- Responsive.css-->
<link rel="stylesheet" type="text/css"
	href="../css/c_dashboard/css/responsive.css">

</head>

<body class="sidebar-mini fixed">

	<div class="wrapper">
		<!-- Navbar-->
		<header class="main-header-top hidden-print">
			<a href="index.jsp" class="logo">Bumble Bee<img
				class="img-fluid able-logo" src="assets/images/logo.png"
				alt="Theme-logo"></a>
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#!" data-toggle="offcanvas" class="sidebar-toggle"></a>

				<!-- Navbar Right Menu-->


				<ul class="top-nav">
					<!--Notification Menu-->




					<!-- User Menu-->
					<li class="dropdown"><a href="#!" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false"
						class="dropdown-toggle drop icon-circle drop-image"> <span>Welcome,
								<b>Admin</b> <i class=" icofont icofont-simple-down"></i>
						</span>

					</a></li>
				</ul>

				<!-- search -->
				<div id="morphsearch" class="morphsearch">
					<form class="morphsearch-form">

						<input class="morphsearch-input" type="search"
							placeholder="Search..." />

						<button class="morphsearch-submit" type="submit">Search</button>

					</form>
			</nav>
		</header>
		<!-- Side-Nav-->
		<aside class="main-sidebar hidden-print ">
			<section class="sidebar" id="sidebar-scroll">
				<!-- Sidebar Menu-->
				<ul class="sidebar-menu">
					<li class="nav-level">--- Navigation</li>
					<li class="active treeview"><a class="waves-effect waves-dark"
						href="index.jsp"> <i class="icon-speedometer"></i><span>
								Dashboard</span>
					</a></li>
					<li class="nav-level">--- Components</li>
					<li class="treeview"><a class="waves-effect waves-dark"
						href="#!"><i class="icon-briefcase"></i><span>Add New
								Products</span><i class="icon-arrow-down"></i></a></li>



					<li class="treeview"><a class="waves-effect waves-dark"
						href="../adminLogout"> <i class="icon-list"></i><span>
								Logout</span>
					</a></li>








				</ul>
			</section>
		</aside>
		<!-- Sidebar chat start -->



		<div class="content-wrapper">
			<!-- Container-fluid starts -->
			<!-- Main content starts -->
			<div class="container-fluid">
				<div class="row">
					<div class="main-header">
						<h4>Dashboard</h4>
					</div>
				</div>
				<!-- 4-blocks row start -->
				<div class="row dashboard-header">
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>Products Available</span>
							<h2 class="dashboard-total-products">0</h2>
							<span class="label label-warning">Stock</span>
							<div class="side-box">
								<i class="ti-box text-warning-color"></i>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6">
						<div class="card dashboard-product">
							<span>Total Customers</span>
							<h2 class="dashboard-total-products">0</h2>
							<span class="label label-primary">Users</span>
							<div class="side-box ">
								<i class="ti-person text-primary-color"></i>
							</div>
						</div>
					</div>


				</div>
				<!-- 4-blocks row end -->

				<!-- 1-3-block row start -->
				<div class="row">

					<div class="card ml-5">
						<div class="container">
							<h3 class="text-center">List of Customers</h3>
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
											href="edit?id=<c:out value='${resultSet.getString("id")}' ">Edit</a>
											&nbsp;&nbsp;&nbsp;&nbsp; <a
											href="delete?id=<c:out value='${resultSet.getString("id")}'">Delete</a></td>


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
					<!-- 1-3-block row end -->
					<!-- Me Added -->
					<br><br>
					<div class="card ml-5">
						<div class="container">
							<h3 class="text-center">Ordered Products</h3>
							<hr>
							
							<br>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>ID</th>
										<th>Description</th>
										<th>Price</th>
										<th>Installment</th>
									</tr>
								</thead>
								<tbody>

									<%
						try{
							connection = DriverManager.getConnection(connectionUrl, userid, password);
							statement=connection.createStatement();
							String sql ="select * from ordered_product";
							resultSet = statement.executeQuery(sql);
							
							while(resultSet.next()){
								%>
									<tr>
										<td><%=resultSet.getString("id") %></td>
										<td><%=resultSet.getString("Description") %></td>
										<td><%=resultSet.getString("price") %></td>
										<td><%=resultSet.getString("Installment") %></td>
									
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
					<!-- 2-1 block start -->


					<!-- Warning Section Starts -->
					<!-- Older IE warning message -->
					<!--[if lt IE 9]>
      <div class="ie-warning">
          <h1>Warning!!</h1>
          <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
          <div class="iew-container">
              <ul class="iew-download">
                  <li>
                      <a href="http://www.google.com/chrome/">
                          <img src="assets/images/browser/chrome.png" alt="Chrome">
                          <div>Chrome</div>
                      </a>
                  </li>
                  <li>
                      <a href="https://www.mozilla.org/en-US/firefox/new/">
                          <img src="assets/images/browser/firefox.png" alt="Firefox">
                          <div>Firefox</div>
                      </a>
                  </li>
                  <li>
                      <a href="http://www.opera.com">
                          <img src="assets/images/browser/opera.png" alt="Opera">
                          <div>Opera</div>
                      </a>
                  </li>
                  <li>
                      <a href="https://www.apple.com/safari/">
                          <img src="assets/images/browser/safari.png" alt="Safari">
                          <div>Safari</div>
                      </a>
                  </li>
                  <li>
                      <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                          <img src="assets/images/browser/ie.png" alt="">
                          <div>IE (9 & above)</div>
                      </a>
                  </li>
              </ul>
          </div>
          <p>Sorry for the inconvenience!</p>
      </div>
      <![endif]-->
					<!-- Warning Section Ends -->

					<!-- Required Jqurey -->
					<script src="assets/plugins/Jquery/dist/jquery.min.js"></script>
					<script src="assets/plugins/jquery-ui/jquery-ui.min.js"></script>
					<script src="assets/plugins/tether/dist/js/tether.min.js"></script>

					<!-- Required Fremwork -->
					<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

					<!-- Scrollbar JS-->
					<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
					<script
						src="assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

					<!--classic JS-->
					<script src="assets/plugins/classie/classie.js"></script>

					<!-- notification -->
					<script src="assets/plugins/notification/js/bootstrap-growl.min.js"></script>

					<!-- Sparkline charts -->
					<script
						src="assets/plugins/jquery-sparkline/dist/jquery.sparkline.js"></script>

					<!-- Counter js  -->
					<script src="assets/plugins/waypoints/jquery.waypoints.min.js"></script>
					<script src="assets/plugins/countdown/js/jquery.counterup.js"></script>

					<!-- Echart js -->
					<script src="assets/plugins/charts/echarts/js/echarts-all.js"></script>

					<script src="https://code.highcharts.com/highcharts.js"></script>
					<script src="https://code.highcharts.com/modules/exporting.js"></script>
					<script src="https://code.highcharts.com/highcharts-3d.js"></script>

					<!-- custom js -->
					<script type="text/javascript" src="assets/js/main.min.js"></script>
					<script type="text/javascript" src="assets/pages/dashboard.js"></script>
					<script type="text/javascript" src="assets/pages/elements.js"></script>
					<script src="assets/js/menu.min.js"></script>
					<script>
var $window = $(window);
var nav = $('.fixed-button');
$window.scroll(function(){
    if ($window.scrollTop() >= 200) {
       nav.addClass('active');
    }
    else {
       nav.removeClass('active');
    }
});
</script>
</body>

</html>
