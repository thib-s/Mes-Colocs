<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login to your accountc</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1000px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>
</head>



<header>
	<div align="center"
		style="background-color: #3371B7; padding: 50px; position: relative;">
		<font style="font-size: 40pt; color: white;"><b>Login to
				your account</b></font>


	</div>
</header>

<body>

	<br>
	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h4 style="padding: 10px;">Coloc Menu</h4>
				<ul class="nav nav-pills nav-stacked">

				</ul>
				<br>
			</div>


			<div class="col-sm-9" style="padding:15px; margin-left:20px">
				<form action="LoginServlet" method="post">

					<div class="form-group">
						<label for="exampleInputEmail1">Email address :</label> <br>
						<input type="text"
							style="width: 100%; margin: auto; box-sizing: border-box;"
							class="form-control" name="txtEmail" id="txtEmail"
							placeholder="Enter Email Adress" required="required">

					</div>
					<br>
					<div class="form-group">
						<label for="exampleInputPassword1">Password :</label> <br> <input
							type="password"
							style="width: 100%; margin: auto; box-sizing: border-box;"
							class="form-control" name="txtPass" id="txtPass"
							placeholder="Password" required="required">
					</div>
					<br> <br>
					<button type="submit" style="width: 100%; font-size: 1.1em;"
						class="btn btn-large btn btn-success btn-lg btn-block" value="log"
						name="ok">
						<b>Login</b>
					</button>
					<br> <br> <a href="createAccount.jsp"
						class="btn btn-success btn-lg  btn-large btn-info" role="button">Create
						an account</a>
				</form>

			</div>
		</div>
	</div>
</body>
</html>