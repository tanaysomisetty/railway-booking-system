<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	
	try{
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs;
		rs = stmt.executeQuery("select transitLineName, trainId, originStationId, destinationStationId, dateOfTravel, departureTime, arrivalTime, typeOfTrip, fare from TrainSchedule");
		if(!rs.isBeforeFirst()){
			out.print("No reservations have been made");
		}
		else{
			
			out.print("<table border='1'>");
			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("Transit Line");
			out.print("</th>");
			
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("TrainId");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Origin Station");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Destination Station");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Date of Travel");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Departure Time");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Arrival Time");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Type of Trip ");
			out.print("</th>");
			//out.print("</tr>");
			
			out.print("<th>");
			//print out the column header
			out.print("Fare $");
			out.print("</th>");
			out.print("</tr>");
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td style='text-align:center'>");
				//print out the column header
				out.print(rs.getString("transitLineName"));
				//out.print("<td style='text-align:right'>$100</td> </td>");
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("trainId"));
				out.print("</td>");

				out.print("<td style='text-align:center'>");
				out.print(rs.getString("originStationId"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("destinationStationId"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("dateOfTravel"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("departureTime"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("arrivalTime"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("typeOfTrip"));
				out.print("</td>");
				//out.print("</tr>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("fare"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");
		}
			}
			catch(Exception ex){
				out.print(ex);
				out.print("Exception at makeReservation catch.");
			}
				
	
	//The next part will make the reservation and display a confirm
%>

<form action="reserve.jsp" method="POST">
		To reserve, please fill the following with your choices 
		<br> Transit line: <input type="text" name="line" /> <br>
		Train id: <input type="text" name="id" /> <br>
		Date for reservation: <input type="text" name="date" /> <br>
		Please select type of trip: <input type="radio" name="typeOfTrip" value="One-way" />One-way <input type="radio" name="typeOfTrip" value="Two-way" />Two-way <br>
		Please select discount (if applicable): <br> 
		<input type="radio" name="discount" value="Children" />Children	<br>
		<input type="radio" name="discount" value="Senior" /> Senior <br>
		<input type="radio" name="discount" value="Disabled" /> Disabled <br>
		<input type="submit" value="Reserve"> <br>
	</form>

<a href = '../Reservations.jsp'> Go back</a> <br> 
</body>
</html>
