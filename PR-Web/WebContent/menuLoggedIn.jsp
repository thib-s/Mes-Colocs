<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Menu Logged in</title>
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




<header>
	<div align="center"
		style="background-color: #3371B7; padding: 50px; position: relative;">
		<font style="font-size: 40pt; color: white;"><b>You don't belong to any coloc yet !</b></font>
	<div align="center" style="margin:auto; position:absolute; top:50%; transform:translateY(-50%); right:5%;">
				<form action="ColocServlet" method="post">
					<button type="submit" style="margin: auto; width: 100%; font-size:1.1em; color:white" class="btn btn-large btn btn-danger btn-lg btn-block" value="logOut" name="ok" ><b>Log Out</b></button>
				</form>
			</div>

	</div>
</header>


<body>

	<div class="container-fluid" >
	
	<div class="row content">
			<div class="col-sm-2 sidenav">
				<h4 style="padding: 10px;">Coloc Menu</h4>
				<ul class="nav nav-pills nav-stacked">

				</ul>
				<br>
			</div>
			
			
			<div class="col-sm-9">
  				<br><br>
            	<form action="http://localhost:8080/PR-Web/joinColoc.jsp">
    			<input type="submit" style="margin: auto; padding:15px; width: 60%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="Join a coloc" name="ok" >
    			</form>
    			<br><br>
    			<form action="http://localhost:8080/PR-Web/createColoc.jsp">
    			<input type="submit" style="margin: auto; padding:15px; width: 60%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="Create a coloc" name="ok" >
    			</form>
  				
  			</div>
    	</div>
  	</div>

</body>
</html>