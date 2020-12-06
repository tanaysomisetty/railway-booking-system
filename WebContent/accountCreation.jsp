<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <!-- note the show.jsp will be invoked when the choice is made -->
	<!-- The next lines give HTML for radio buttons being displayed -->
<form action = "createAccount.jsp" method= "POST">
	Select Account Type
  <input type="radio" name="account" value="Admin"/>Admin 
  <br>
  <input type="radio" name="account" value="Customer"/>Customer 
  <input type="radio" name="account" value="CustomerRep"/> Customer Representative
  <br>
	Username: <input type = "text" name = "username"/> <br/>
	Password: <input type = "password" name = "password"/> <br/>
	<input type ="submit" value = "Create Account">
	</form>
</body>
</html>