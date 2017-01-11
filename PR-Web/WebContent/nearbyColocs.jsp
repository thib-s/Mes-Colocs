<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*,java.util.*,apiGoogle.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Check nearby Colocs</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
#map {
	height: 400px;
	width: 100%;
}

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
					style="margin: auto; width: 100%; font-size: 1.1em; color: white"
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
					<li class="active"><a
						href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby
							Colocs</a></li>
					<li><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
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
				String name = user.getUsername();
				Coloc coloc = user.getMyColoc();
				ArrayList<Tuple<Float,Coloc>> list = (ArrayList<Tuple<Float,Coloc>>) request.getAttribute("list");
				ArrayList<Location> listPins = (ArrayList<Location>) request.getAttribute("listPins");
				
				if (list == null) {
			%>

			<div class="col-sm-9" style="padding: 15px; margin-left: 20px">
				<h4>
					<small>Check nearby colocs</small>
				</h4>
				<form action="ColocServlet" method="post">
					<button type="submit" style="width: 100%; font-size: 1.1em;"
						class="btn btn-large btn btn-success btn-lg btn-block"
						value="checkNearBy" name="ok">
						<b>Check NearBy Colocs</b>
					</button>
				</form>
				<%
					} else {
						%>
						<script>
      function initMap() {
        var start = {lat: <%= listPins.get(0).lat%>, lng:<%= listPins.get(0).lng%>};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 10,
          center: start
        });
        var marker = new google.maps.Marker({
          position: start,
          map: map
        });
        <%for(int i=1;i<listPins.size();i++) {%>
        var marker = new google.maps.Marker({
          position: {lat: <%= listPins.get(i).lat%>, lng:<%= listPins.get(i).lng%>},
          map: map
        });
       <%}%>
      }
    </script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB7AHMCAg7cGpafgiCmuGETMzWyLaiOEtg&callback=initMap">
    </script>
				<div class="container">
				<br>
				<div id="map"></div>
					<ul class="nav nav-pills nav-stacked">
					
						<%
						for(Tuple<Float,Coloc> t : list) {
							%>
						<li><a href="https://www.google.fr/maps/dir/<%=coloc.getAddressColoc()%>,+<%=coloc.getCityColoc()%>,+<%=coloc.getCountryColoc()%>/<%=t.y.getAddressColoc()%>,+<%=t.y.getCityColoc()%>,+<%=t.y.getCountryColoc()%>"> <%=t.y.getBlazColoc()%> is   <%=t.x %> km away
								from you.
						</a></li>
						<% 
						}
						%>
					</ul>
				</div>
				
				<%
					}
				}
				%>




			</div>
		</div>
	</div>

	<footer class="container-fluid">
		<p>Footer Text</p>
	</footer>

</body>
</html>
