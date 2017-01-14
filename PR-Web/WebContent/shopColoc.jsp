<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*,java.util.*"%>
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
        <li ><a href="http://localhost:8080/PR-Web/homeColoc.jsp">Home</a></li>
        <li class="active"><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li><a href="http://localhost:8080/PR-Web/tasksColoc.jsp">Tasks</a></li>
        <li ><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li><a href="ColocServlet?ok=Agen">Agenda</a></li>
        <li ><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li ><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li ><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li ><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9" style="padding:15px; margin-left:20px">
      	<h4><small>Shopping list of your colocs</small></h4>
      	
      	<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-list"></span>Shopping list
                    <div class="pull-right action-buttons">
                        <div class="btn-group pull-right">
                            <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-cog" style="margin-right: 0px;"></span>
                            </button>
                            <ul class="dropdown-menu slidedown">
                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span>Edit</a></li>
                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-trash"></span>Delete</a></li>
                                <li><a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-flag"></span>Flag</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <ul class="list-group">
                    			<%
				User user = (User) session.getAttribute("sessionUser");
				if(user == null) {
					%>

			You are not logged in !.

			<%
				} else {
				String name = user.getUsername();
				Coloc coloc = user.getMyColoc();
				Set<ShoppingList> lists = coloc.getShoppingLists();
				for (ShoppingList list : lists){
					for (ShoppingItem it: list.getItems()){
			%>
                    
                        <li class="list-group-item">
                            <div class="checkbox">
                                <input type="checkbox" id="checkbox" />
                                <label for="checkbox">
                                    <%System.out.println(it.getItemName()); %>
                                </label>
                            </div>
                            <div>
                            	<label>
                            	<% System.out.println(it.getQuantity()); %>
                            	</label>
                            </div>
                            <div>
                            	<label>
                            	<% System.out.println(it.getLastBuyDate().toGMTString()); %>
                            	</label>
                            </div>
                            <div class="pull-right action-buttons">
                                <a href="http://www.jquery2dotnet.com"><span class="glyphicon glyphicon-pencil"></span></a>
                                <a href="http://www.jquery2dotnet.com" class="trash"><span class="glyphicon glyphicon-trash"></span></a>
                                <button type="submit" class="buy" value="addItem" name="buy"></button><span class="glyphicon glyphicon-flag"></span></button>
                            </div>
                        </li>
            <%}}}%>
                    
                    </ul>
                </div>
                <div class="panel-footer">
                    <div class="row">
                        <div class="col-md-6">
                            <h6>
                                Total Count <span class="label label-info">25</span></h6>
                        </div>
                        <div class="col-md-6">
                            <ul class="pagination pagination-sm pull-right">
                                <li class="disabled"><a href="javascript:void(0)">«</a></li>
                                <li class="active"><a href="javascript:void(0)">1 <span class="sr-only">(current)</span></a></li>
                                <li><a href="http://www.jquery2dotnet.com">2</a></li>
                                <li><a href="http://www.jquery2dotnet.com">3</a></li>
                                <li><a href="http://www.jquery2dotnet.com">4</a></li>
                                <li><a href="http://www.jquery2dotnet.com">5</a></li>
                                <li><a href="javascript:void(0)">»</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
      	
      <form action="ColocServlet" method="post">
		<div class="form-group">
      		<label for="exampleInputColoc">Add an item :</label> <br> <input
        		type="text" style="width:100%; margin:auto; box-sizing: border-box;" class="form-control" name="txtItem" id="txtColocName"
            	placeholder="Enter the item" required="required">     
      	</div> <br>
      	<div class="form-group">
      		<label for="exampleInputColoc"> Quantity : </label> <br><input
        		type="text" style="width:100%; margin:auto; box-sizing: border-box;" class="form-control" name="txtQuantity" id="txtColocName"
            	placeholder="Enter the item's quantity" required="required"> 
      	</div> <br>
      	
      		<button type="submit" style="margin: auto; width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="addItem" name="ok" ><b>Add</b></button>
     	</form>
      
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
