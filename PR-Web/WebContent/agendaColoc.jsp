<%@ page import = "java.util.*, model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Agenda of your Coloc</title>
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
    
    .agenda {  }

	/* Dates */
	.agenda .agenda-date { width: 170px; }
	.agenda .agenda-date .dayofmonth {
	  width: 40px;
	  font-size: 36px;
	  line-height: 36px;
	  float: left;
	  text-align: right;
	  margin-right: 10px; 
	}
	.agenda .agenda-date .shortdate {
	  font-size: 0.75em; 
	}
	
	
	/* Times */
	.agenda .agenda-time { width: 180px; } 
	
	
	/* Events */
	.agenda .agenda-events {  } 
	.agenda .agenda-events .agenda-event {  } 
	
	@media (max-width: 767px) {
	    
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
        <li><a href="http://localhost:8080/PR-Web/shopColoc.jsp">Shopping List</a></li>
        <li><a href="ColocServlet?ok=task">Tasks</a></li>
        <li><a href="http://localhost:8080/PR-Web/expensesColoc.jsp">Expenses</a></li>
        <li class="active"><a href="ColocServlet?ok=Agen">Agenda</a></li>
        <li><a href="http://localhost:8080/PR-Web/nearbyColocs.jsp">Nearby Colocs</a></li>
        <li><a href="http://localhost:8080/PR-Web/picsColoc.jsp">Pictures</a></li>
        <li ><a href="http://localhost:8080/PR-Web/adminColoc.jsp">Administrate Coloc</a></li>
        <li><a href="http://localhost:8080/PR-Web/leaveColoc.jsp">Leave Coloc</a></li>
      </ul><br>
    </div>

    <div class="col-sm-9" style="padding:15px; margin-left:20px">
      <h4><small>Agenda of your coloc</small></h4>
      
      <form action="ColocServlet" method="post">

			<div class="form-group">
				<label for="exampleInputDate">Date (dd/mm/yyyy) :</label>
				<input type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDate" id="txtDate"
					placeholder="Enter the date like this dd/mm/yyyy" required="required">

			</div> 
			<div class="form-group">
				<label for="exampleInputTime">Time (hh:mm[-hh:mm]) :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtTime" id="txtTime"
					placeholder="Enter the time. The second time (end of event) is optional" required="required">
			</div> 
			<div class="form-group">
				<label for="exampleInputTime">Description :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDesc" id="txtDesc"
					placeholder="Enter the event description" required="required">
			</div>
			
			<button type="submit" style="font-size: 1.1em;"
				class="btn btn-large btn btn-success btn-lg" value="addEvent"
				name="ok">
				<b>Add an event</b>
			</button>
			<br> <br>
		</form>
     
      
	    <div class="agenda">
	        <div class="table-responsive">
	            <table class="table table-condensed table-bordered">
	                <thead>
	                    <tr>
	                        <th>Date</th>
	                        <th>Time</th>
	                        <th>Event</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
	                	<%	HashMap<Date, List<Event>> eventsMap = (HashMap<Date, List<Event>>)request.getAttribute("eventsMap"); 	                		
							for (Date dayDate : eventsMap.keySet()) { 
								List<Event> eventsList = eventsMap.get(dayDate);
								int size = eventsList.size();
								if (size == 1) {
									Calendar cal = Calendar.getInstance();
								    cal.setTime(dayDate);
								    int year = cal.get(Calendar.YEAR);
								    String month = Utils.intToMonth(cal.get(Calendar.MONTH));
								    int day = cal.get(Calendar.DAY_OF_MONTH);
								    String dayWeek = Utils.intToDay(cal.get(Calendar.DAY_OF_WEEK));
								    Event event = eventsList.get(0);
								    cal.setTime(event.getBeginTime());
								    String beginTimeHS = Utils.format(cal.get(Calendar.HOUR_OF_DAY));
								    String beginTimeMS = Utils.format(cal.get(Calendar.MINUTE));
								    Date endTime = event.getEndTime();
								    String endTimeH = null;
								    String endTimeM = null;
								    if (endTime != null) {
								    	cal.setTime(endTime);
										endTimeH = Utils.format(cal.get(Calendar.HOUR_OF_DAY));
									    endTimeM = Utils.format(cal.get(Calendar.MINUTE));
								    }
								%>
								
				                    <!-- Single event in a single day -->
				                    <tr>
				                        <td class="agenda-date" class="active" rowspan="1">
				                            <div class="dayofmonth"><%=day %></div>
				                            <div class="dayofweek"><%=dayWeek %></div>
				                            <div class="shortdate text-muted"><%=month %>, <%=year %></div>
				                        </td>
				                        <td class="agenda-time">
				                            <%=beginTimeHS %>:<%=beginTimeMS %> <% if(endTime != null) {out.println("- " + endTimeH + ":" + endTimeM);} %>
				                        </td>
				                        <td class="agenda-events">
				                            <div class="agenda-event">
				                                <%=event.getDescription() %>
				                            </div>
				                        </td>
				                    </tr>
				                    
								<%} else if(size > 0) { 
										int k=0;
										Calendar cal = Calendar.getInstance();
									    cal.setTime(dayDate);
									    int year = cal.get(Calendar.YEAR);
									    String month = Utils.intToMonth(cal.get(Calendar.MONTH));
									    int day = cal.get(Calendar.DAY_OF_MONTH);
									    String dayWeek = Utils.intToDay(cal.get(Calendar.DAY_OF_WEEK));%>
								
									<!-- Multiple events in a single day (note the rowspan) -->
									<tr>
				                        <td class="agenda-date" class="active" rowspan=<%=size %>>
				                            <div class="dayofmonth"><%=day %></div>
				                            <div class="dayofweek"><%=dayWeek %></div>
				                            <div class="shortdate text-muted"><%=month %>, <%=year %></div>
				                        </td>
								<%
										for (Event event : eventsList) {
											k++;
										    cal.setTime(event.getBeginTime());
										    int beginTimeH = cal.get(Calendar.HOUR_OF_DAY);
										    String beginTimeHS = Utils.format(cal.get(Calendar.HOUR_OF_DAY));
										    String beginTimeMS = Utils.format(cal.get(Calendar.MINUTE));
										    Date endTime = event.getEndTime();
										    String endTimeH = null;
										    String endTimeM = null;
										    if (endTime != null) {
										    	cal.setTime(endTime);
												endTimeH = Utils.format(cal.get(Calendar.HOUR_OF_DAY));
											    endTimeM = Utils.format(cal.get(Calendar.MINUTE));
										    }
								    %>
	                    
									
				                        <td class="agenda-time">
				                            <%=beginTimeHS %>:<%=beginTimeMS %> <% if(endTime != null) {out.println("- " + endTimeH + ":" + endTimeM);} %>
				                        </td>
				                        <td class="agenda-events">
				                            <div class="agenda-event">
				                                <%=event.getDescription() %>
				                            </div>
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
				<label for="exampleInputDate">Date (dd/mm/yyyy) :</label>
				<input type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDate" id="txtDate"
					placeholder="Enter the date like this dd/mm/yyyy" required="required">

			</div> 
			<div class="form-group">
				<label for="exampleInputTime">Time (hh:mm[-hh:mm]) :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtTime" id="txtTime"
					placeholder="Enter the time. The second time (end of event) is optional" required="required">
			</div> 
			<div class="form-group">
				<label for="exampleInputTime">Description :</label>
				<input
					type="text"
					style="margin: auto; box-sizing: border-box;"
					class="form-control" name="txtDesc" id="txtDesc"
					placeholder="Enter the event description" required="required">
			</div>
			
			<button type="submit" style="font-size: 1.1em;"
				class="btn btn-large btn btn-success btn-lg" value="rmEvent"
				name="ok">
				<b>Delete an event</b>
			</button>
			<br> <br>
		</form>
   
     
      
</div></div></div>

<footer class="container-fluid">
  <p>Footer Text</p>
</footer>

</body>
</html>
