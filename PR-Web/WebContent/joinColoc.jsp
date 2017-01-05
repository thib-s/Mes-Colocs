<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body style=" background-color: #687cff;">
   
    <br>
    <div class="container-fluid" style="margin-left: auto; margin-right: auto; padding-bottom: 50px; padding-top: 50px; width: 50%; background-color: white;">
        <div class="panel panel-success">
            <div class="panel-heading" align="center">
                <h4><b><font color="black" style="font-family: fantasy; font-size: 30pt;">Join your fuc*ing coloc</font> </b></h4>
            </div>
            <div class="panel-body"align="center">
                 
                <div class="container " style="margin-top: 10%; margin-bottom: 10%;">
   
                    <div class="panel panel-success" style="max-width: 35%;" align="left">
                       
                        <div class="panel-heading form-group">
                            
                   
                        <div class="panel-body" >

                        <form action="LoginServlet" method="post" >
                            <div class="form-group">
                                <label for="exampleInputColoc">Coloc Name :</label> <br> <input
                                    type="text" style="width: 100%; margin: auto;" class="form-control" name="txtColocName" id="txtColocName"
                                    placeholder="Enter Coloc Name" required="required">
                                   
                            </div> <br>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password :</label> <br> <input
                                    type="password" style="width: 100%;" class="form-control" name="txtPass" id="txtPass"
                                    placeholder="Password" required="required">
                            </div>
                            </br>
                            <button type="submit" style="margin: auto; width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="join" name="ok" ><b>Join</b></button>
							                                                 
                        </form>

                        </div>
                    </div>
                   
                </div>
               
            </div>
            
        </div>
    </div>
   
</body>
</html>