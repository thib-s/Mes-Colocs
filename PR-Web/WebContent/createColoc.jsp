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
		
				<h4><b><font color="black" style="font-family: fantasy;">Create your coloc</font> </b></h4>
				
			</div>
		
			<div class="panel-body"align="center">
				<div class="container " style="margin-top: 10%; margin-bottom: 10%;">
					<div class="panel panel-success" style="max-width: 35%;" align="left">
						<div class="panel-heading form-group" style=" width : 562px;">
							<div class="panel-body" >
								
								<form action="CreateColocServlet" method="post" >
								
								<div class="form-group">
									<label for="exampleInputColocName" align="right">Coloc Name</label > <input
										type="text" class="form-control" name="txtColocName" id="txtColocName"
										placeholder="Enter coloc name" required="required" >
								</div>
								
								<div class="form-group">
									<label for="exampleInputPassword">Password</label> <input
									type="password" class="form-control" name="txtPass" id="txtPass"
									placeholder="Password" required="required">
								</div>
								
								<div class="form-group">
									<label for="exampleInputConfirmationPassword">Confirmation Password</label> <input
									type="password" class="form-control" name="txtConfPass" id="txtPass"
									placeholder="Confirmation Password" required="required">
								</div>
								
								<div class="form-group">
									<label for="exampleAddress">Address</label> <input
									type="text" class="form-control" name="txtAddress" id="txtAddress"
									placeholder="Enter your address" required="required">
								</div>
								
								<div class="form-group">
									<label for="exampleInputCity">City</label> <input
									type="text" class="form-control" name="txtCity" id="txtCity"
									placeholder="Enter your city" required="required">
								</div>
								
								<div class="form-group">
									<label for="exampleInputCountry">Country</label> <input
									type="text" class="form-control" name="txtCountry" id="txtCountry"
									placeholder="Enter your country" required="required">
								</div>
								
								<button type="submit" style="width: 100%; font-size:1.1em;" class="btn btn-large btn btn-success btn-lg btn-block" value="ca" name="ok"><b>Create coloc</b></button>
								</form>
							</div>
						</div>
					</div>
				</div>
			
			</div>
		</div>
</body>
</html>
