<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		
		String line = request.getParameter("line");
		String trainId = request.getParameter("id");
		String date = request.getParameter("date");
		String typeOfTrip = request.getParameter("typeOfTrip");
		
		//out.print("Before rs");
		ResultSet rs = stmt.executeQuery("select s.travelTime, s.fare, s.typeOfTrip, s.originStationId, s.destinationStationId, s.departureTime, s.arrivalTime from TrainSchedule s where s.transitLineName = '" + line + "' and s.trainId = '" + trainId + "' and s.dateOfTravel = '" + date + "'");
		//out.print("After rs");
		//String scheType = "One-way";//rs.getString("s.typeOfTrip");
		//out.print("After scheType getString()");
		
		//if(scheType.equals("One-way")){
		//	if(typeOfTrip.equals("Round-trip")){
		//		
		//	}
		//}
		
		//If there's no TrainSchedule that has the primary keys requested, abort.
		if(!rs.isBeforeFirst()){
			//Do not continue with reservation
			out.print("No schedule matches the details input.");
			
		}
		else if(typeOfTrip == null){
			//This condition means that the user didn't input type of trip
			out.print("Please, input type of trip and try again.");
		}
		else{
			rs.next();
			String scheType = rs.getString("s.typeOfTrip");
			if(scheType.equals("one-way") && typeOfTrip.equals("Two-way")){
				//This condition means that the user wants to reserve a round-trip on a schedule that is one-way
				//The counter-example case of wanting to reserve a one-way trip on a round-trip schedule is allowed
				out.print("Cannot schedule a round-trip on a one-way schedule.");
			}
			else{
				String travelTime = rs.getString("travelTime");
			
				float fare = Float.parseFloat(rs.getString("fare"));
				String discount = request.getParameter("discount");
				
				if(typeOfTrip.equals("Two-way")){
					fare = fare * (float)2.0;
				}
			
				if(discount != null){
					if(discount.equals("Children"))
						fare = fare * (float)0.75;
					else if(discount.equals("Senior"))
						fare = fare * (float)0.65;
					else if(discount.equals("Disabled"))
						fare = fare * (float)0.5;
				}
			
				//String typeOfTrip = rs.getString("s.typeOfTrip");
				
				int origin = Integer.parseInt(rs.getString("s.originStationId"));
				int destination = Integer.parseInt(rs.getString("s.destinationStationId"));
				String departureTime = rs.getString("s.departureTime");
				String arrivalTime = rs.getString("s.arrivalTime");
			
				int newId;//newId is a new reservationNum.
				ResultSet rs1;
				ResultSet rs2;
				//out.print("Before rs1");
				rs1 = stmt.executeQuery("select r.reservationNum from Reservation r where r.reservationNum = (select max(re.reservationNum) from Reservation re)");
				
				//Check if there's absolutely no reservations
				if(!rs1.isBeforeFirst()){
					
					//This is the first insertion, new id is 1
					newId = 1;
					//out.print("newId is " + newId);
					//out.print("date is " + date);
					//out.print("fare is " + fare);
					//out.print("line is " + line);
					//out.print("trainId " + trainId);
				}
				else{
					
					rs1.next();
					newId = Integer.parseInt(rs1.getString("reservationNum")) + 1;
				}
			
				String username = session.getAttribute("user").toString();
				//out.print("username is " + username);
			
				//out.print("Between the 2 executes");
				
				//rs2 = stmt.executeQuery("select t.fare from TrainSchedule t where t.trainLine = " + line + " and t.trainId = " + trainId);
				//float fare = Float.parseFloat(rs2.getString("fare"));//Or reservationNum?
				
				//As of now, newId is created, date is gotten from user input, username is gotten from session attribute, fare is 
				//searched and retrieved from TrainSchedule in Database, line trainId is from user input.
				//out.print("execute Update");
				stmt.executeUpdate("insert into Reservation values (" + newId + ", '" + date + "' , '" + username + "' ," + fare + ", '" + line + "'," + trainId + ")");
				out.print("Reservation was a Success!");
			}
		}
			
	}catch(Exception ex){
				out.print(ex);
				out.print(" failed :()");
	}
	
	
	//The next part will make the reservation and display a confirm
%>
<a href = '../Reservations.jsp'> Go back to reservations menu</a> || 
</body>
</html>
