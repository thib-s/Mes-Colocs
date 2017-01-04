<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Create your account</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
   
    <br>
    <div class="container-fluid">
        <div class="panel panel-success">
            <div class="panel-heading" align="center">
                <h4><b><font color="black" style="font-family: fantasy;">Create your account</font> </b></h4>
            </div>
            <div class="panel-body"align="center">
                 
                <div class="container " style="margin-top: 10%; margin-bottom: 10%;">
   
                    <div class="panel panel-success" style="max-width: 35%;" align="left">
                       
                        <div class="panel-heading form-group">
                            
                   
                        <div class="panel-body" >

                        <form action="LoginServlet" method="post" >
                        <div class="form-group">
                                <label for="exampleInputEmail1">Email</label> <input
                                    type="text" class="form-control" name="txtEmail" id="txtEmail"
                                    placeholder="Enter Email" required="required">
                                   
                            </div>
                            <div class="form-group">
                                <label for="exampleInputUserName">User Name</label> <input
                                    type="text" class="form-control" name="txtUserName" id="txtUserName"
                                    placeholder="Enter User Name" required="required">
                                   
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword">Password</label> <input
                                    type="password" class="form-control" name="txtPass" id="txtPass"
                                    placeholder="Password" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFirstName">First Name</label> <input
                                    type="text" class="form-control" name="txtFirstName" id="txtFirstName"
                                    placeholder="Enter first name" required="required">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputLastName">Last Name</label> <input
                                    type="text" class="form-control" name="txtLastName" id="txtLastName"
                                    placeholder="Enter last name" required="required">
                            </div>
                            <button type="submit" style="width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="ca" name="ok"><b>Create account</b></button>                                                 
                        </form>

                        </div>
                    </div>
                   
                </div>
               
            </div>
            <div class="panel-footer" align="center"><font style="color: #111">Copyright @2014  <a href="http://mysite.com/">mysite.com</a>, All Rights Reserved. </font></div>
        </div>
    </div>
   
</body>
</html>