<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu</title>
</head>
<body>

	<div class="container-fluid" style="margin-left: auto; margin-right: auto; padding-bottom: 50px; padding-top: 50px; width: 50%; background-color: white;">
    	<div class="panel panel-success">
            <div class="panel-heading" align="center">
                <h4><b><font color="black" style="font-family: fantasy; font-size: 30pt;">You don't belong to any coloc yet !</font> </b></h4>
            </div>
            
            <div class="panel-body" align="center">
            	<br>
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