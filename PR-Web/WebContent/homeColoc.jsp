<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home of your Coloc</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1000px}
    
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
      .row.content {height: auto;} 
    }
  </style>
</head>

<header>
	<div align="center" style="background-color:#3371B7; padding:50px; position:relative;">
		<font style="font-size:40pt; color:white;"><b>Mes Colocs</b></font>
		
			<div align="center" style="margin:auto; position:absolute; top:50%; transform:translateY(-50%); right:5%;">
				<form action="ColocServlet" method="post">
					<button type="submit" style="margin: auto; width: 100%; font-size:1.1em; color:white" class="btn btn-large btn btn-danger btn-lg btn-block" value="logOut" name="ok" ><b>Log Out</b></button>
				</form>
			</div>
			
	</div>
</header>

<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <h4 style="padding:10px;">Coloc Menu</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="http://localhost:8080/PR-Web/homeColoc.jsp">Home</a></li>
        <li><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li><a href="ColocServlet?ok=task">Tasks</a></li>
        <li><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li><a href="ColocServlet?ok=Agen">Agenda</a></li>
        <li><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9" style="padding:15px; margin-left:20px">
      <h4><small>Latest News</small></h4>
      <hr>
      <h2>I Love ENSEEIHT</h2>
      <h5><span class="glyphicon glyphicon-time"></span> Post by Team Mes-Coloc</h5>
      <h5> <span class="label label-primary">News</span></h5><br>
      <p>Welcome to the first version of our website Mes-Colocs.</p>
      <br><br>
      
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
