<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Train Schedules</title>
</head>
<body>
<%
	//Display all train schedules and have user input trainsitlinename and trainID and attribute they would like to change or delete
	
	try {
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		Statement stmt = con.createStatement();
		ResultSet rs;

		rs = stmt.executeQuery(
		"select transitLineName, trainId, originStationId, destinationStationId, typeOfTrip, dateOfTravel,arrivalTime, departureTime, travelTime, fare from TrainSchedule");

		if (!rs.isBeforeFirst()) {
			out.print("No Train Schedules exist <a href='CustomerRep.jsp'> Click here to return to Navigation Menu </a>");
			return;
		}
		out.print("<table>");

		//make a row
		out.print("<tr>");
		//make a column
		out.print("<td>");
		//print out column header
		out.print("Transit Line");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("trainId");
		out.print("</td>");
		//make a column
		out.print("<td>");
		out.print("Origin Station");
		out.print("</td>");

		out.print("<td>");
		out.print("destination Station");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Type of Trip");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Date of Travel");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Arrival Time");
		out.print("</td>");
		out.print("<td>");
		out.print("Departure Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Travel Time");
		out.print("</td>");
		
		out.print("<td>");
		out.print("Fare");
		out.print("</td>");
		out.print("</tr>");

		//parse out the results, accessed one tuple at a time
		while (rs.next()) {
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//Print out current category:
			out.print(rs.getString("transitLineName"));
			out.print("</td>");
			out.print("<td>");
			//Print out current question:
			out.print(rs.getString("trainId"));
			out.print("</td>");
			out.print("<td>");
			//Print out answer:
			out.print(rs.getString("originStationId"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("destinationStationId"));
			out.print("</td>");
			

			out.print("<td>");
			out.print(rs.getString("typeOfTrip"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("dateOfTravel"));
			out.print("</td>");
			
			
			out.print("<td>");
			out.print(rs.getString("arrivalTime"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("departureTime"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("travelTime"));
			out.print("</td>");
			
			out.print("<td>");
			out.print(rs.getString("fare"));
			out.print("</td>");
			out.print("</tr>");

		}
		out.print("</table>");				
	} catch (Exception ex) {
		out.print(ex);
		out.print(" failed :()");
	}
%>

<!-- place two forms in html one for delete one for edit and it takes the fields using select multiple field, multiple select with CTRL -->
<br>
<form method="get" action="UpdateAttribute.jsp">
		<select name="attribute"  >
			<option selected disabled > Select Attribute to Update </option>
			<option value="arrivalTime">Arrival Time</option>
			<option value="departureTime">Departure Time</option>
			<option value="fare">fare</option>
			<option value = "dateOfTravel">date of Travel </option>
			<option value = "travelTime"> Travel Time </option>
		</select>&nbsp;<br>  <br>
		Please Enter new Value <input type="text" name="newVal" />
		<br> Please Enter Train Schedule Information <br>
		TrainsitLine Name <input Type = "text" name = "transitLine"> 
		<br> TrainID <input type = "text" name = "TrainID">
		<br /> <input type="submit" value="submit">
	</form>
	<br>
<form method = "get" action = "deleteTrainSchedule.jsp">
<select name="attribute"  >
	<option selected disabled > Select Attribute to Delete </option>
			<option value="arrivalTime">Arrival Time</option>
			<option value="departureTime">Departure Time</option>
			<option value="fare">fare</option>
			<option value = "dateOfTravel">date of Travel </option>
			<option value = "travelTime"> Travel Time </option>
		</select>&nbsp;<br>
		<br> Please Enter Train Schedule Information <br>
		TrainsitLine Name <input Type = "text" name = "transitLine"> 
		<br> TrainID <input type = "text" name = "TrainID">
		<br /> <input type="submit" value="submit">
</form>
</body>
</html>