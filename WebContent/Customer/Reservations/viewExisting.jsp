<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import=" com.cs336.pkg.ApplicationDB "%>
<!--Import  libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Viewing existing Reservations</title>
</head>
<body>

<%   
	
	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs;
		String username = session.getAttribute("user").toString();
		//String line = request.getParameter("line");
		//String trainId = request.getParameter("id");
		//String curDate = "2020/" + request.getParameter("curDate");
		String curDate = request.getParameter("curDate");
		//out.print("curDate is " + curDate);
		//out.print("username is " + username);
		//rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and DATE(r.date) > DATE('" + curDate + "')");
		//rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and DATE(r.date) > date_format(DATE(NOW()), '%m/%d/%Y')");
		//rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and date_format(DATE(r.date), '%Y-%m-%d') <= DATE(NOW())");
		//rs = stmt.executeQuery("select DATE(NOW())");
		rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and r.date > '" + curDate + "'");
		//rs.next();
		//rs = stmt.executeQuery("select r.reservationNum, r.date, r.username, r.fare, r.transitLineName, r.trainId from Reservation r where r.username = '" + username + "' and DATE(r.date) > DATE(NOW())");
		
		if(rs.isBeforeFirst()){
			out.print("<table border='1'>");
			
			//make a row
			out.print("<tr>");
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("Reservation Number");
			out.print("</th>");
			
			//make a column
			out.print("<th>");
			//print out the column header
			out.print("Date  ");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Username ");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Fare $");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Transit Line Name");
			out.print("</th>");
			
			out.print("<th>");
			//print out the column header
			out.print("Train Id ");
			out.print("</th>");
			
			
			out.print("</tr>");
			
			while(rs.next()){
				out.print("<tr>");
				out.print("<td style='text-align:center'>");
				//print out the column header
				out.print(rs.getString("reservationNum"));
				out.print("</td>");
					
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("date"));
				out.print("</td>");
	
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("username"));
				out.print("</td>");
					
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("fare"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("transitLineName"));
				out.print("</td>");
				
				out.print("<td style='text-align:center'>");
				out.print(rs.getString("trainId"));
				out.print("</td>");
	
				out.print("</tr>");
			}
			out.print("</table>");
		}
		else{
			out.print("No existing reservations.");
		}
	
	}
	catch(Exception ex){
		out.print(ex);
		out.print("Exception at viewExisting catch");
	}
	
	//The next part will make the reservation and display a confirm
%>

<form action="cancelReservation.jsp" method="POST">
		Want to cancel a current reservation?
		To cancel, please fill the following with your choices 
		<br> Reservation Number: <input type="text" name="reservationNum" /> <br>
	 <input
			type="submit" value="Cancel this reservation">
	</form>

<a href = '../Reservations.jsp'> Go to back to reservations menu</a> || 
<a href = '../logout.jsp'> Log out</a>
</body>
</html>
