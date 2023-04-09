<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Customer Login</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="../css/cRegistration.css">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/intro_style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="../css/responsive.css" rel="stylesheet" />
</head>
<body>

	<input type="hidden" id="status"
		value="<%= session.getAttribute("status") %>>">

	<div class="main">

		<nav
			class="navbar navbar-light navbar-expand-md navigation-clean-search mb-5">
			<div class="container-fluid">
				<a class="navbar-brand" href="../index.jsp">BUMBLE BEE</a>
				<button data-toggle="collapse" class="navbar-toggler"
					data-target="#navcol-1">
					<span class="sr-only">Toggle navigation</span><span
						class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav">

					</ul>
					<a class="btn btn-light action-button" role="button"
						href="../admin/a_login.jsp">Admin</a>
				</div>
			</div>
		</nav>

		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">


					<div class="signin-form">
						<h2 class="form-title">Login</h2>
						<form method="post" action="../adminLogin" class="register-form"
							id="login-form">
							<div class="form-group">
								<label for="username"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="admin_email" id="admin_email"
									placeholder="Admin Master Email" />
							</div>
							<div class="form-group">
								<label for="password"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="admin_password" id="admin_password"
									placeholder="Admin Master Password" />
							</div>

							<div class="form-group form-button">
								<input style="background-color: #7d9ce0" type="submit"
									name="signin" id="signin" class="form-submit" value="Log in" />
							</div>
						</form>

					</div>

					<div class="signin-image">
						<figure>
							<img src="../images/login.jpg" alt="sing up image">
						</figure>

					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script>
		var status = document.getElementById("status").value;
		if(status == "succes") {
			swal("Success","Sucessfully Logged In", "success");
		} else if(status == "failed") {
			swal("Failed!","Login Failed", "error");
		} 
	</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>