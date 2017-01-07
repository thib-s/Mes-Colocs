<!DOCTYPE html>
<html lang="en">
<head>
  <title>Shopping list of your Colocs</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
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
					<button type="submit" style="margin: auto; width: 100%; font-size:1.1em; color:white" class="btn btn-large btn btn-success btn-lg btn-block" value="logOut" name="ok" >Log Out</button>
				</form>
			</div>
			
	</div>
</header>

<body>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4 style="padding:10px;">Coloc Menu</h4>
      <ul class="nav nav-pills nav-stacked">
        <li ><a href="http://localhost:8080/PR-Web/homeColoc.jsp">Home</a></li>
        <li class="active"><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li><a href="http://localhost:8080/PR-Web/tasksColoc.jsp">Tasks</a></li>
        <li ><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li ><a href="http://localhost:8080/PR-Web/agendaColoc.jsp">Agenda</a></li>
        <li ><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li ><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li ><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li ><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9">
      	<h4><small>Shopping list of your colocs</small></h4>
      
		<div class="form-group">
      		<label for="exampleInputColoc">Add an item :</label> <br> <input
        		type="text" style="width:100%; margin:auto; box-sizing: border-box;" class="form-control" name="txtItem" id="txtColocName"
            	placeholder="Enter the item" required="required">     
      	</div> <br>
      	<form action="ColocServlet" method="post">
      		<button type="submit" style="margin: auto; width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="join" name="ok" ><b>Join</b></button>
     	</form>
      
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
