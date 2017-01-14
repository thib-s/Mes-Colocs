<%@ page import = "java.util.*, model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Tasks of your Colocs</title>
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
        <li ><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li class="active"><a href="ColocServlet?ok=task">Tasks</a></li>
        <li ><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li><a href="ColocServlet?ok=Agen">Agenda</a></li>
        <li ><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li ><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li ><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li ><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9" style="padding:15px; margin-left:20px">
      <h4><small>Tasks of your colocs</small></h4>
     
      <form action="ColocServlet" method="post">

			<div class="form-group">
				<label for="exampleInputDate">Day to do the task before :</label>
				<input type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDate" id="txtDate"
					placeholder="Enter the day (e.g. Mon or Monday)" required="required">

			</div> 
			<div class="form-group">
				<label for="exampleInputDescription">Doer :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDoer" id="txtDoer"
					placeholder="Enter the doer of the task" required="required">
			</div>
			<div class="form-group">
				<label for="exampleInputDescription">Description :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDesc" id="txtDesc"
					placeholder="Enter the task description" required="required">
			</div>
			
			<button type="submit" style="font-size: 1.1em;"
				class="btn btn-large btn btn-success btn-lg" value="addTask"
				name="ok">
				<b>Add a task</b>
			</button>
			<br> <br>
		</form>
     
      
	    <div class="agenda">
	        <div class="table-responsive">
	            <table class="table table-condensed table-bordered">
	                <thead>
	                    <tr>
	                        <th>Date</th>
	                        <th>Doer</th>
	                        <th>Description</th>
	                        <th>Done</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                	<%	HashMap<String, List<Task>> tasksMap = (HashMap<String, List<Task>>)request.getAttribute("tasksMap"); 	                		
							for (String dayDate : tasksMap.keySet()) { 
								List<Task> tasksList = tasksMap.get(dayDate);
								int size = tasksList.size();
								if (size == 1) {
								    Task task = tasksList.get(0);
								   
								%>
								
				                    <!-- Single event in a single day -->
				                    <tr>
				                        <td class="agenda-date" class="active" rowspan="1">
				                            <div class="dayofweek"><%=dayDate %></div>
				                        </td>
				                        <td class="agenda-time">
				                            <%=task.getDoer() %>
				                        </td>
				                        <td class="agenda-events">
				                            <div class="agenda-event">
				                                <%=task.getDescription() %>
				                            </div>
				                        </td>
				                        <td>
				                        	<% if(task.isDone()) {out.println("Yes");} else {out.println("No");} %>
				                        </td>
				                    </tr>
				                    
								<%} else if(size > 0) { 
										int k=0;
										%>
								
									<!-- Multiple events in a single day (note the rowspan) -->
									<tr>
				                        <td class="agenda-date" class="active" rowspan=<%=size %>>
				                            <div class="dayofweek"><%=dayDate %></div>
				                        </td>
								<%
										for (Task task : tasksList) {
											k++;
										    
								    %>
	                    
									
				                        <td class="agenda-time">
				                            <%=task.getDoer() %>
				                        </td>
				                        <td class="agenda-events">
				                            <div class="agenda-event">
				                                <%=task.getDescription() %>
				                            </div>
				                        </td>
				                        <td>
				                        	<% if(task.isDone()) {out.println("Yes");} else {out.println("No");} %>
				                        </td>
				                    </tr>
				                    		<%if (k!=size) { %>
				                   	<tr>
				                   			<%} %>
						                    
								<%		} 
								  } %>
	                    
	                    <% } %>
	                </tbody>
	            </table>
	        </div>
	    </div>
	    
	    <form action="ColocServlet" method="post">

			<div class="form-group">
				<label for="exampleInputDate">Day to do the task before :</label>
				<input type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDate" id="txtDate"
					placeholder="Enter the day (e.g. Mon or Monday)" required="required">

			</div> 
			<div class="form-group">
				<label for="exampleInputDescription">Doer :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDoer" id="txtDoer"
					placeholder="Enter the doer of the task" required="required">
			</div>
			<div class="form-group">
				<label for="exampleInputDescription">Description :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDesc" id="txtDesc"
					placeholder="Enter the task description" required="required">
			</div>
			
			<button type="submit" style="font-size: 1.1em;"
				class="btn btn-large btn btn-success btn-lg" value="rmTask"
				name="ok">
				<b>Delete a task</b>
			</button>
			<br> <br>
		</form>
   
      
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
