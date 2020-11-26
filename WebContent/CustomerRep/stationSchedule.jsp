<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action = "findSchedules.jsp" method = "Get">
		<input type = "radio" id= "origin" name = "station" value = "originStationId">
		<label for ="origin"> Origin Station</label>
		<input type = "radio" id = "destination" name = "station" value = "destinationStationId">
		<label for = "destination"> destination Station</label>
		Please Enter StationName<input type = "text" name = "stationName">
		<input type="submit" value="Submit">
	</form>
</body>
</html>