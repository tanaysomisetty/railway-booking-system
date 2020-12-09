<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.ApplicationDB"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schedules</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			String origin = request.getParameter("origin");
			String destination = request.getParameter("destination");
			String dateOfTravel = request.getParameter("dateOfTravel");
			String sortBy = request.getParameter("sortBy");
			
			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT * FROM TrainSchedule WHERE originStationId = '" + origin + "' AND destinationStationId = '" + destination + "' ORDER BY " + sortBy;  
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			//check if empty
			if(!result.isBeforeFirst()){
				out.print("No Train Schedules match given Information please select different values  <a href='bsMainPage'> Click here to return to Selection Menu </a>");
				return;
			}
			//Make an HTML table to show the results in:
			out.print("<table>");
			//make a row
			out.print("<tr>");
			
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Transit Line Name");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Train ID");
			out.print("</td>");
			
			//make a column
			//out.print("<td>");
			//out.print("Stops");
			//out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Arrival Time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Travel Time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Fare");
			out.print("</td>");
			
			//make a row
			out.print("</tr>");
			//parse out the results
			while (result.next()) {
				
				//make a row
				out.print("<tr>");
				
				//make a column
				out.print("<td>");
				//Print out transit line name:
				out.print(result.getString("transitLineName"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out trainID:
				out.print(result.getString("trainID"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out dept time:
				out.print(result.getString("departureTime"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out arrival time:
				out.print(result.getString("arrivalTime"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out travel time:
				out.print(result.getString("travelTime"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out fare:
				out.print(result.getString("fare"));
				out.print("</td>");
				
				out.print("</tr>");
			}
			out.print("</table>");
			//close the connection.
			con.close();
		} catch (Exception e) {
		}
	%>

</body>
</html>