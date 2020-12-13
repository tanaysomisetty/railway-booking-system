<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse and Search</title>
</head>
<body>

Search for Train Schedule:
<br>
	<form method="get" action="BSresultPage.jsp">
	<table>
		<tr>
			<td>Origin: </td> 
			<td> 
				<select name="origin" size=1>
					<option value="1">Penn Station New York</option>
					<option value="2">Elizabeth</option>
					<option value="3">Rahway</option>
					<option value="4">Edison</option>
					<option value="5">New Brunswick</option>
					<option value="6">Princeton Junction</option>
					<option value="7">Trenton</option>
					<option value="9">Newark Penn Station</option>
				</select>&nbsp;<br> 
			</td>
			
			<td>Destination: </td> 
			<td> 
				<select name="destination" size=1>
					<option value="1">Penn Station New York</option>
					<option value="2">Elizabeth</option>
					<option value="3">Rahway</option>
					<option value="4">Edison</option>
					<option value="5">New Brunswick</option>
					<option value="6">Princeton Junction</option>
					<option value="7">Trenton</option>
					<option value="9">Newark Penn Station</option>
				</select>&nbsp;<br> 
			</td>
		<tr>
		
		<tr>
			<td>Date of Travel: </td> 
			<td> 
				<select name="dateOfTravel" size=1>
					<option value="12/17">12/17</option>
					<option value="12/18">12/18</option>
					<option value="12/19">12/19</option>
					<option value="12/20">12/20</option>
					<option value="12/21">12/21</option>
				</select>&nbsp;<br> 
			</td>
		</tr>
		
		<tr>
			<td>Sort By: </td> 
			<td> 
				<select name="sortBy" size=1>
					<option value="arrivalTime">arrival time</option>
					<option value="departureTime">departure time</option>
					<option value="fare">fare</option>
				</select>&nbsp;<br> 
			</td>
		</tr>
	</table>
		<input type="submit" value="submit">
		
	</form>
<br>
<a href = 'Customer.jsp'> Return to Main Menu</a> 
<br> <a href = '../logout.jsp'> Log out</a> 
</body>
</html>