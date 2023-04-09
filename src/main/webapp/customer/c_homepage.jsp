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
<title>Bumble Bee - Customer Dashboard</title>
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
						class="dropdown-toggle drop icon-circle drop-image"> <span>Welcome
								<b><%=session.getAttribute("fullName")%></b> <i
								class=" icofont icofont-simple-down"></i>
						</span>

					</a>
						<ul class="dropdown-menu settings-menu">
							<li><a href="#!"><i class="icon-settings"></i> Settings</a></li>
							<li><a href="#"><i class="icon-user"></i> Profile</a></li>
							<li><a href="#"><i class="icon-envelope-open"></i> My
									Messages</a></li>
							<li class="p-0">
								<div class="dropdown-divider m-0"></div>
							</li>
							<li><a href="#"><i class="icon-lock"></i> Lock Screen</a></li>
							<li><a href="login1.html"><i class="icon-logout"></i>
									Logout</a></li>

						</ul></li>
				</ul>

				<!-- search -->
				<div id="morphsearch" class="morphsearch">
					<form class="morphsearch-form">

						<input class="morphsearch-input" type="search"
							placeholder="Search..." />

						<button class="morphsearch-submit" type="submit">Search</button>

					</form>
					<div class="morphsearch-content">
						<div class="dummy-column">
							<h2>People</h2>
							<a class="dummy-media-object" href="#!"> <img class="round"
								src="http://0.gravatar.com/avatar/81b58502541f9445253f30497e53c280?s=50&d=identicon&r=G"
								alt="Sara Soueidan" />
								<h3>Sara Soueidan</h3>
							</a> <a class="dummy-media-object" href="#!"> <img class="round"
								src="http://1.gravatar.com/avatar/9bc7250110c667cd35c0826059b81b75?s=50&d=identicon&r=G"
								alt="Shaun Dona" />
								<h3>Shaun Dona</h3>
							</a>
						</div>
						<div class="dummy-column">
							<h2>Popular</h2>
							<a class="dummy-media-object" href="#!"> <img
								src="assets/images/avatar-1.png" alt="PagePreloadingEffect" />
								<h3>Page Preloading Effect</h3>
							</a> <a class="dummy-media-object" href="#!"> <img
								src="assets/images/avatar-1.png"
								alt="DraggableDualViewSlideshow" />
								<h3>Draggable Dual-View Slideshow</h3>
							</a>
						</div>
						<div class="dummy-column">
							<h2>Recent</h2>
							<a class="dummy-media-object" href="#!"> <img
								src="assets/images/avatar-1.png" alt="TooltipStylesInspiration" />
								<h3>Tooltip Styles Inspiration</h3>
							</a> <a class="dummy-media-object" href="#!"> <img
								src="assets/images/avatar-1.png" alt="NotificationStyles" />
								<h3>Notification Styles Inspiration</h3>
							</a>
						</div>
					</div>
					<!-- /morphsearch-content -->
					<span class="morphsearch-close"><i
						class="icofont icofont-search-alt-1"></i></span>
				</div>
				<!-- search end -->
	</div>
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
					href="#!"><i class="icon-briefcase"></i><span>My
							Purchases</span><i class="icon-arrow-down"></i></a></li>



				<li class="treeview"><a class="waves-effect waves-dark"
					href="../logout"> <i class="icon-list"></i><span> Logout</span>
				</a></li>







			</ul>
		</section>
	</aside>
	<!-- Sidebar chat start -->
	<div id="sidebar" class="p-fixed header-users showChat">
		<div class="had-container">
			<div class="card card_main header-users-main">
				<div class="card-content user-box">
					<div class="md-group-add-on p-20">
						<span class="md-add-on"> <i
							class="icofont icofont-search-alt-2 chat-search"></i>
						</span>
						<div class="md-input-wrapper">
							<input type="text" class="md-form-control" name="username"
								id="search-friends"> <label>Search</label>
						</div>

					</div>
					<div class="media friendlist-main">

						<h6>Friend List</h6>

					</div>
					<div class="main-friend-list">
						<div class="media friendlist-box" data-id="1" data-status="online"
							data-username="Josephin Doe" data-toggle="tooltip"
							data-placement="left" title="Josephin Doe">

							<a class="media-left" href="#!">

								<div class="live-status bg-success"></div>
							</a>
							<div class="media-body">
								<div class="friend-header">Josephin Doe</div>
								<span>20min ago</span>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>


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
						<span>Amount Used</span>
						<h2 class="dashboard-total-products">
							LKR
							<%=session.getAttribute("usedAmount")%></h2>
						<span class="label label-warning">LIVE</span>
						<div class="side-box">
							<i class="ti-money text-warning-color"></i>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card dashboard-product">
						<span>Loan Balance</span>
						<h2 class="dashboard-total-products">
							LKR
							<%=session.getAttribute("loanBalance")%></h2>
						<span class="label label-primary">Eligible</span>
						<div class="side-box ">
							<i class="ti-money text-primary-color"></i>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="card dashboard-product">
						<span>Eligible Installments</span>
						<h2 class="dashboard-total-products">
							<span><%=session.getAttribute("iPlan")%></span>
						</h2>
						<span class="label label-success">Plan</span>
						<div class="side-box">
							<i class="ti-direction-alt text-success-color"></i>
						</div>
					</div>
				</div>

			</div>
			<!-- 4-blocks row end -->

			<!-- 1-3-block row start -->
			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="user-block-2">

							<h5><%=session.getAttribute("fullName")%></h5>
							<h6><%=session.getAttribute("email")%></h6>
						</div>
						<div class="card-block">
							<div class="user-block-2-activities">
								<div class="user-block-2-active">
									<i class="icofont icofont-phone"></i>
									<%=session.getAttribute("mobilePhone")%>

								</div>
							</div>
							<div class="user-block-2-activities">
								<div class="user-block-2-active">
									<i class="icofont icofont-users"></i>
									<%=session.getAttribute("dob")%>

								</div>
							</div>



						</div>
					</div>
				</div>

				<!-- 1-3-block row end -->


				<!-- 2-1 block start -->
				<!-- Me Added -->

				<div class="card ml-5">
					<div class="container">
						<h3 class="text-center">Available Products</h3>
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

								<%-- <%
								try {
									connection = DriverManager.getConnection(connectionUrl, userid, password);
									statement = connection.createStatement();
									String sql = "select * from prodcust";
									resultSet = statement.executeQuery(sql);

									while (resultSet.next()) {
								%>
								<tr>
									<td><%=resultSet.getString("id")%></td>
									<td><%=resultSet.getString("Description")%></td>
									<td><%=resultSet.getString("price")%></td>
									<td><%=resultSet.getString("Installment")%></td>
									<td>
										<a href="order?id=<%=resultSet.getString("id")%>">Order</a>
										<form action="OrderServlet" method="post">
											<td><a
												href="OrderServlet?id=<c:out value='${resultSet.getString("id")}' ">Order</a>
												<input type="hidden" name="id"
												value="<%=resultSet.getString("id")%>"></td>
										</form>
								</tr>
								<%
								}

								connection.close();

								} catch (Exception e) {
								e.printStackTrace();
								}
								%> --%>

								<%
								try{
										connection = DriverManager.getConnection(connectionUrl, userid, password);
										statement = connection.createStatement();
										String sql = "select * from prodcust";
										resultSet = statement.executeQuery(sql);

										while (resultSet.next()) {
								%>
								<tr>
									<td><%=resultSet.getString("id")%></td>
									<td><%=resultSet.getString("Description")%></td>
									<td><%=resultSet.getString("price")%></td>
									<td><%=resultSet.getString("Installment")%></td>
									<td>
										<form action="../order" method="post">
											<input type="hidden" name="id"
												value="<%=resultSet.getString("id")%>"> <input
												type="submit" value="Order">
										</form>
									</td>
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

				<!-- 2-1 block end -->
			</div>
			<!-- Main content ends -->
			<!-- Container-fluid ends -->
			<div class="fixed-button">
				<a href="#!" class="btn btn-md btn-primary"> <i
					class="fa fa-shopping-cart" aria-hidden="true"></i>
				</a>
			</div>
		</div>
	</div>


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
	<script src="assets/plugins/jquery.nicescroll/jquery.nicescroll.min.js"></script>

	<!--classic JS-->
	<script src="assets/plugins/classie/classie.js"></script>

	<!-- notification -->
	<script src="assets/plugins/notification/js/bootstrap-growl.min.js"></script>

	<!-- Sparkline charts -->
	<script src="assets/plugins/jquery-sparkline/dist/jquery.sparkline.js"></script>

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
		$window.scroll(function() {
			if ($window.scrollTop() >= 200) {
				nav.addClass('active');
			} else {
				nav.removeClass('active');
			}
		});
	</script>

</body>

</html>
