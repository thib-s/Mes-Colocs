<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success Page</title>
</head>
<body>

<%

User user =(User)session.getAttribute("sessionUser");
String name = user.getUsername();
if(name!=null)
{
    %>
    <h1>Hi welcome <%=name%> </h1>   
<%
} else {
	%>
    <h1>YOU MUST LOG IN BEFORE !!! </h1>   
<%
}
%>
</body>
</html> 