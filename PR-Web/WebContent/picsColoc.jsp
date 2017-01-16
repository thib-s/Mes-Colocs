<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*,java.util.*,apiGoogle.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Pics of your Colocs</title>
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
	height: 1500px
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
		<font style="font-size: 40pt; color: white;"><b>Mes Colocs</b></font>

		<div align="center"
			style="margin: auto; position: absolute; top: 50%; transform: translateY(-50%); right: 5%;">
			<form action="ColocServlet" method="post">
				<button type="submit"
					style="padding-left: 16px; padding-right: 16px; padding-bottom: 10px; padding-top: 10px; margin: auto; width: 100%; font-size: 1.1em; color: white"
					class="btn btn-large btn btn-danger btn-lg btn-block"
					value="logOut" name="ok">
					<b>Log Out</b>
				</button>
			</form>
		</div>

	</div>
</header>

<body>

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h4 style="padding: 10px;">Coloc Menu</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="http://localhost:8080/PR-Web/homeColoc.jsp">Home</a></li>
					<li><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping
							List</a></li>
					<li><a href="http://localhost:8080/PR-Web/tasksColoc.jsp">Tasks</a></li>
					<li><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
					<li><a href="http://localhost:8080/PR-Web/agendaColoc.jsp">Agenda</a></li>
					<li><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby
							Colocs</a></li>
					<li class="active"><a
						href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
					<li><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate
							Coloc</a></li>
					<li><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave
							Coloc</a></li>
				</ul>
				<br>
			</div>


			<%
				User user = (User) session.getAttribute("sessionUser");
				if(user == null) {
					%>

			You are not logged in !.

			<%
				} else {
					int numberOfPics = user.getMyColoc().getPics();
					String nameColoc = user.getMyColoc().getBlazColoc();
					
			%>



			<div class="col-sm-9" style="padding: 15px; margin-left: 20px">
			
				<h4>
					<small>Pics of your colocs</small>
				</h4>

<link rel="stylesheet"
					href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
				<link rel="stylesheet"
					href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
				<link rel="stylesheet"
					href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/bootstrap-image-gallery.css">
				<link rel="stylesheet"
					href="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/css/demo.css">

				<form action="UploadServlet" method="post" enctype="multipart/form-data">

				<div class="form-group">
						<label for="file">Pic location</label> <br>
						<input type="file"
							style="width: 50%; margin: auto; box-sizing: border-box;"
							class="form-control" name="fileLocation" id="fileLocation"
							placeholder="Enter pic location" required="required">

				</div>
				<br><br>
				<button type="submit"
						style="margin: auto; width: 30%; font-size: 1.1em;"
						class="btn btn-large btn btn-success btn-lg btn-block" value="send"
						name="send">
						<b>Send picture</b>
					</button>
					</form>


				<br><br>



				<div class="container">
				
					<!-- The container for the list of example images -->
				
					<div id="links">
						<%for (int i=1; i<= numberOfPics;i++){
		    
		    	%>

						<a data-gallery="" title="test"
							href="http://localhost:8080/pics/<%=nameColoc%>/Pic<%=i%>.png"> <img
							src="http://localhost:8080/pics/<%=nameColoc%>/Pic<%=i%>.png" height="100" width="100" >
						</a>
						<%}
		        } %>
					</div>
					<br>
				</div>
				<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
				<div id="blueimp-gallery" class="blueimp-gallery">
					<!-- The container for the modal slides -->
					<div class="slides"></div>
					<!-- Controls for the borderless lightbox -->
					<h3 class="title"></h3>
					<a class="prev"></a> <a class="next"></a> <a class="close">Ã</a> <a
						class="play-pause"></a>
					<ol class="indicator"></ol>
					<!-- The modal dialog, which will be used to wrap the lightbox content -->
					<div class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" aria-hidden="true">ï¿½</button>
									<h4 class="modal-title"></h4>
								</div>
								<div class="modal-body next"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default pull-left prev">
										<i class="glyphicon glyphicon-chevron-left"></i> Previous
									</button>
									<button type="button" class="btn btn-primary next">
										Next <i class="glyphicon glyphicon-chevron-right"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
				<!-- Bootstrap JS is not required, but included for the responsive demo navigation and button states -->
				<script
					src="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
				<script
					src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
				<script
					src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/bootstrap-image-gallery.js"></script>
				<script
					src="https://raw.github.com/blueimp/Bootstrap-Image-Gallery/master/js/demo.js"></script>





			</div>
		</div>
	</div>

	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>

</body>

</html>
