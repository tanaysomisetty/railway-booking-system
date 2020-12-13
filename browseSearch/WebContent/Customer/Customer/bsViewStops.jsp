<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="group25.cs336.pkg.* "%>
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
			String searchStops = request.getParameter("searchStops");

			
			//Make a SELECT query from the sells table with the price range specified by the 'price' parameter at the index.jsp
			String str = "SELECT s.transitLineName, s.trainId, s.departureTime, s.arrivalTime, s.stationId, (ts.fare)/numStops.ns as fps FROM TrainSchedule ts, Stops s, (SELECT transitLineName, COUNT(transitLineName) as ns FROM Stops GROUP BY transitLineName) as numStops WHERE ts.trainId = '" + searchStops + "' AND s.trainId = '" + searchStops + "' AND s.stationId = ts.destinationStationId ORDER BY s.stationId";  
			//String str2 = "SELECT (ts.fare)/count(ts.transitLineName) as fps FROM TrainSchedule ts, Stops s WHERE ts.trainId = '" + searchStops + "' AND s.trainId = '" + searchStops + "' GROUP BY ts.transitLineName"; 
			//Run the query against the database.
			
			ResultSet result = stmt.executeQuery(str);
			
			//check if empty
			if(!result.isBeforeFirst()){
				out.print("No stops found.  <br> <a href='bsMainPage.jsp'> Click here to return to Selection Menu </a> ");
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
			out.print("<td>");
			out.print("Departure Time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Arrival Time");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Stop Station");
			out.print("</td>");
			
			//make a column
			out.print("<td>");
			out.print("Fare Per Stop ($)");
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
				//Print out stops:
				out.print(result.getString("stationId"));
				out.print("</td>");
				
				out.print("<td>");
				//Print out stops:
				out.print(result.getString("fps"));
				out.print("</td>");
				
				
				
				out.print("</tr>");
			}
			out.print("</table>");
				
			//close the connection.
			con.close();
		} catch (Exception e) {
		}
			
		
		
	%>
	
<a href = 'bsMainPage.jsp'> Return to Selection Menu</a>  
<br> <a href = 'logout.jsp'> Log out</a> 